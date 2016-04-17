#!/usr/bin/perl -w

# To the extent possible under law, the person who associated CC0
# with this work has waived all copyright and related or neighboring
# rights to this work.
# http://creativecommons.org/publicdomain/zero/1.0/

use strict;

my $asgs_unzip_dir = "02-ASGS-UNZIP";

# table_mapping - hash of SHAPE file name to PostgreSQL table name
# schema_mapping - hash of SHAPE file name to PostgreSQL schema
# volume_mapping - hash of SHAPE file name to dataset ABS publication volume
# src_col_mapping - hash of SHAPE file name to SHAPE file primary key attribute
# dst_col_mapping - hash of SHAPE file name to PostgreSQL primary key attribute
my %table_mapping;
my %volume_mapping;
my %schema_mapping;
my %src_col_mapping;
my %dst_col_mapping;
my @ordered_tables;

# keep track of tables we load into so we can overwrite new ones but append to
# ones which have a many to one (shp to psql table) relationship.
my %ogr_tables_loaded_this_session;

my %sql_generated_tables_this_session;

# optionally set the coordinate system to transform geometry into the loading
# an empty string means don't transform, rather leave in same coordsys as source shape file
my $t_srs = "";

if ((@ARGV >= 2) && ($ARGV[0] eq "-t_srs")) {
  $t_srs = "-t_srs '" . $ARGV[1] . "'";
  print "Reprojecting shape files to " . $ARGV[1] . "\n";
}

while (<STDIN>) {
  chomp;
  next if /^#/;
  next if /^\s*$/;

  if (/([^\s]*)\s([^\s]*)\s([^\.]*)\.([^\s]*)\s([^\.]*)\.([^\s]*)/) {
    my $volume = $1;
    my $schema = $2;
    my $src_table = $3;
    my $src_column = $4;
    my $dst_table = $5;
    my $dst_column = $6;

    # if wildcard character exists, expand it now
    if ($src_table =~ /\*/) {
      my @glob = glob "$asgs_unzip_dir/127005500${volume}_".lc (${src_table})."_csv/";
      for my $g (@glob) {
        if ($g =~ /\/[0-9]*_(.*)_csv/) {
          my $expanded_src_table = $1;
          $volume_mapping{$expanded_src_table} = $volume;
          $schema_mapping{$expanded_src_table} = $schema;
          $table_mapping{$expanded_src_table} = $dst_table;
          $src_col_mapping{$expanded_src_table} = $src_column;
          $dst_col_mapping{$expanded_src_table} = $dst_column;
          if (scalar (grep (/^$expanded_src_table$/, @ordered_tables)) == 0) {
            push @ordered_tables, $expanded_src_table;
          }
        }
      }
    }else{
      $volume_mapping{$src_table} = $volume;
      $schema_mapping{$src_table} = $schema;
      $table_mapping{$src_table} = $dst_table;
      $src_col_mapping{$src_table} = $src_column;
      $dst_col_mapping{$src_table} = $dst_column;
      if (scalar (grep (/^$src_table$/, @ordered_tables)) == 0) {
        push @ordered_tables, $src_table;
      }
    }
  }else{
    print STDERR "Parse Error: $_\n";
  }
}

open (my $cast_ogr_sql_fh, '>', "stage2/06-cast-ogr.sql") or die $!;
open (my $cleanup_sql_fh, '>', "stage2/08-clean-ogr.sql") or die $!;


for my $src_table (@ordered_tables) {

  my $dst_table = $table_mapping{$src_table};
  my $volume = $volume_mapping{$src_table};
  my $schema = 'asgs_' . $schema_mapping{$src_table};

  my $src_col = $src_col_mapping{$src_table};
  my $dst_col = $dst_col_mapping{$src_table};

  my $dst_col_datatype = "${dst_table}_${dst_col}";

  my $shp_file = "$asgs_unzip_dir/127005500${volume}_" . lc ($src_table) . "_shape/" . uc ($src_table) . ".shp";

  print "ogr2ogr $shp_file...\n";
  # if we haven't already loaded into this table this session overwrite any
  # existing data in the table, otherwise append to it
  my $psql_update_method = "-overwrite";
  my $ogr_lco = "-lco DIM=2 -lco SPATIAL_INDEX=OFF";
  if (exists $ogr_tables_loaded_this_session{$dst_table}) {
    $psql_update_method = "-update -append";
    $ogr_lco = ""; # layer creation options can't be used when appending to an existing table
  }

  # now run ogr2ogr to load the data
  # this makes up >99.99% of this scripts execution
  # PG_USE_COPY uses COPY rather than INSERTS which are much faster
  # we don't need a spatial index as we make one later on the final joined table
  my $ogr_ret = `ogr2ogr --config PG_USE_COPY YES $psql_update_method -nlt MULTIPOLYGON -select "$src_col" -nln ${dst_table}_ogr $t_srs -f PostgreSQL PG:"active_schema=$schema" $shp_file $ogr_lco`;
  $ogr_tables_loaded_this_session{$dst_table} = "yes";
  die "Problem occured using ogr2ogr to load SHAPE file\n" if ($ogr_ret = undef);

  print "psql statements...\n";

  if (!exists $sql_generated_tables_this_session{"$schema.$dst_table"}) {
    # generate SQL to change the datatype of the attribute we use to JOIN back to the CSV table so they are common
    print $cast_ogr_sql_fh "-- change datatype so we can join USING (code)\n";
    print $cast_ogr_sql_fh "BEGIN;\n".
                           "ALTER TABLE $schema.${dst_table}_ogr ADD COLUMN $dst_col $schema.$dst_col_datatype;\n".
                           "UPDATE $schema.${dst_table}_ogr SET $dst_col = CAST($src_col AS $schema.$dst_col_datatype);\n".
                           "ALTER TABLE $schema.${dst_table}_ogr DROP COLUMN $src_col;\n".
                           "COMMIT;\n";
    print $cast_ogr_sql_fh "VACUUM ANALYZE $schema.${dst_table}_ogr;\n\n";

    # generate SQL to clean up the geometry_columns table post join and drop the _ogr and _csv tables

    print $cleanup_sql_fh "UPDATE geometry_columns SET f_geometry_column = 'geom', f_table_name = '$dst_table' WHERE (f_table_schema = '$schema' AND f_table_name = '${dst_table}_ogr');\n";

    print $cleanup_sql_fh "DROP TABLE $schema.${dst_table}_ogr CASCADE;\n";
    print $cleanup_sql_fh "DROP TABLE $schema.${dst_table}_csv CASCADE;\n\n";

    $sql_generated_tables_this_session{"$schema.$dst_table"} = "yes";
  }
}

close ($cast_ogr_sql_fh) or warn $!;
close ($cleanup_sql_fh) or warn $!;

print "Success!\n";

