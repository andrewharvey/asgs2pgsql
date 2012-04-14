#!/usr/bin/perl -w

# To the extent possible under law, the person who associated CC0
# with this work has waived all copyright and related or neighboring
# rights to this work.
# http://creativecommons.org/publicdomain/zero/1.0/

use strict;

my $schema = "asgs_2011";

my $asgs_unzip_dir = "02-ASGS-UNZIP";

# table_mapping - hash of SHAPE file name to PostgreSQL table name
# volume_mapping - hash of SHAPE file name to dataset ABS publication volume
# src_col_mapping - hash of SHAPE file name to SHAPE file primary key attribute
# dst_col_mapping - hash of SHAPE file name to PostgreSQL primary key attribute
# dst_datatype_mapping - hash of SHAPE file name to PostgreSQL primary key attribute
my %table_mapping;
my %volume_mapping;
my %src_col_mapping;
my %dst_col_mapping;
my %dst_datatype_mapping;
my @ordered_tables;

# keep track of tables we load into so we can overwrite new ones but append to
# ones which have a many to one (shp to psql table) relationship.
my %ogr_tables_loaded_this_session;

my %sql_generated_tables_this_session;

my $transform_to_osm_coordsys = "no";
if ((@ARGV > 0) && ($ARGV[0] eq "-use_osm_coordsys")) {
  $transform_to_osm_coordsys = "yes";
  print "Reprojecting shape files to the OSM Slippy Map Coordinate System - EPSG:3857\n";
}

while (<STDIN>) {
  chomp;
  next if /^#/;
  next if /^\s*$/;

  if (/([^\s]*)\s([^\.]*)\.([^\s]*)\s([^\.]*)\.([^\s]*)\s(.*)/) {
    my $volume = $1;
    my $src_table = $2;
    my $src_column = $3;
    my $dst_table = $4;
    my $dst_column = $5;
    my $dst_datatype = $6;

    # if wildcard character exists, expand it now
    if ($src_table =~ /\*/) {
      my @glob = glob "$asgs_unzip_dir/127005500${volume}_".lc (${src_table})."_csv/";
      for my $g (@glob) {
        if ($g =~ /\/[0-9]*_(.*)_csv/) {
          my $expanded_src_table = $1;
          $volume_mapping{$expanded_src_table} = $volume;
          $table_mapping{$expanded_src_table} = $dst_table;
          $src_col_mapping{$expanded_src_table} = $src_column;
          $dst_col_mapping{$expanded_src_table} = $dst_column;
          $dst_datatype_mapping{$expanded_src_table} = $dst_datatype;
          if (scalar (grep (/^$expanded_src_table$/, @ordered_tables)) == 0) {
            push @ordered_tables, $expanded_src_table;
          }
        }
      }
    }else{
      $volume_mapping{$src_table} = $volume;
      $table_mapping{$src_table} = $dst_table;
      $src_col_mapping{$src_table} = $src_column;
      $dst_col_mapping{$src_table} = $dst_column;
      $dst_datatype_mapping{$src_table} = $dst_datatype;
      if (scalar (grep (/^$src_table$/, @ordered_tables)) == 0) {
        push @ordered_tables, $src_table;
      }
    }
  }else{
    print STDERR "Parse Error: $_\n";
  }
}

open (my $cast_ogr_sql_fh, '>', "06-cast-ogr.sql") or die $!;
open (my $cleanup_sql_fh, '>', "08-clean-ogr.sql") or die $!;


for my $src_table (@ordered_tables) {

  my $dst_table = $table_mapping{$src_table};
  my $volume = $volume_mapping{$src_table};

  my $src_col = $src_col_mapping{$src_table};
  my $dst_col = $dst_col_mapping{$src_table};

  my $dst_col_datatype = $dst_datatype_mapping{$src_table};

  my $shp_file = "$asgs_unzip_dir/127005500${volume}_" . lc ($src_table) . "_shape/" . uc ($src_table) . ".shp";

  print "ogr2ogr $shp_file...\n";
  # if we haven't already loaded into this table this session overwrite any
  # existing data in the table, otherwise append to it
  my $psql_update_method = "-overwrite";
  if (exists $ogr_tables_loaded_this_session{$dst_table}) {
    $psql_update_method = "-update -append";
  }

  # transform geometry to the OSM projection when loading geometry
  my $t_srs = ""; # empty string means don't transform, rather leave in same coordsys as source shape file
  if ($transform_to_osm_coordsys eq "yes") {
    $t_srs = "-t_srs '+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0.0 +k=1.0 +units=m +nadgrids=\@null +wktext +no_defs +over'";
  }

  my $ogr_ret = `ogr2ogr $psql_update_method -nlt MULTIPOLYGON -select "$src_col" -nln ${dst_table}_ogr $t_srs -f PostgreSQL PG:"dbname=abs user=abs active_schema=$schema" $shp_file`;
  $ogr_tables_loaded_this_session{$dst_table} = "yes";
  die "Problem occured using ogr2ogr to load SHAPE file\n" if ($ogr_ret = undef);

  print "psql statements...\n";

  if (!exists $sql_generated_tables_this_session{$dst_table}) {
    # generate SQL to change the datatype of the attribute we use to JOIN back to the CSV table so they are common
    print $cast_ogr_sql_fh "-- change datatype so we can join USING (code)\n";
    print $cast_ogr_sql_fh "BEGIN;\n".
                           "ALTER TABLE $schema.${dst_table}_ogr ADD COLUMN $dst_col $dst_col_datatype;\n".
                           "UPDATE $schema.${dst_table}_ogr SET $dst_col = CAST($src_col AS $dst_col_datatype);\n".
                           "ALTER TABLE $schema.${dst_table}_ogr DROP COLUMN $src_col;\n".
                           "COMMIT;\n";
    print $cast_ogr_sql_fh "VACUUM ANALYZE $schema.${dst_table}_ogr;\n\n";

    # generate SQL to clean up the geometry_columns table post join and drop the _ogr and _csv tables

    print $cleanup_sql_fh "UPDATE geometry_columns SET f_geometry_column = 'geom', f_table_name = '$dst_table' WHERE (f_table_schema = '$schema' AND f_table_name = '${dst_table}_ogr');\n";

    print $cleanup_sql_fh "DROP TABLE $schema.${dst_table}_ogr CASCADE;\n";
    print $cleanup_sql_fh "DROP TABLE $schema.${dst_table}_csv CASCADE;\n\n";

    $sql_generated_tables_this_session{$dst_table} = "yes";
  }
}

close ($cast_ogr_sql_fh) or warn $!;
close ($cleanup_sql_fh) or warn $!;

print "Success!\n";

