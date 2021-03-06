#!/usr/bin/perl -w

# To the extent possible under law, the person who associated CC0
# with this work has waived all copyright and related or neighboring
# rights to this work.
# http://creativecommons.org/publicdomain/zero/1.0/

use strict;
use Text::CSV;
use DBI;

sub cut($$);
sub vacuum_analyze($);

my $asgs_unzip_dir = "02-ASGS-UNZIP";

my %src_tables;
my %dst_tables;
my %volume_mapping;
my %schema_mapping;
my $column_mappings = {};
my @load_keys;
my @links;

while (<STDIN>) {
  chomp;
  next if /^#/;
  next if /^\s*$/;

  if (/^LINK\s(.*)/i) {
    my $link_line = $1;

    # value should match:
    # 2 2011 Indigenous_Structure_Allocation_2011.SA1_MAINCODE_2011 sa1.code Indigenous_Structure_Allocation_2011.ILOC_CODE_2011 sa1.iloc
    if ($link_line =~ /^(\d)\s([^\s]*)\s([^\.]*)\.([^\s]*)\s([^\.]*)\.([^\s]*)\s\3\.([^\s]*)\s\5\.([^\s]*)/) {
      my $volume = $1;
      my $schema = $2;
      my $src_table = $3;
      my $csv_sa1_attribute = $4;
      my $db_sa1_table = "$5" . "_csv";
      my $db_sa1_attribute = $6;
      my $csv_link_attribute = $7;
      my $db_link_attribute = $8;

      if ($link_line =~ /\*/) { # wildcard character exists, expand it out
        my @glob = glob "$asgs_unzip_dir/127005500${volume}_".lc (${src_table})."_csv/";
        for my $g (@glob) {
          if ($g =~ /\/[0-9]*_(.*)_csv/) {
            my $expanded_src_table = $1;
            push @links, [$volume, $schema, $expanded_src_table, $csv_sa1_attribute, $db_sa1_table, $db_sa1_attribute, $csv_link_attribute, $db_link_attribute];
          }
        }
      }else{
        push @links, [$volume, $schema, $src_table, $csv_sa1_attribute, $db_sa1_table, $db_sa1_attribute, $csv_link_attribute, $db_link_attribute];
      }
    }else{
      print STDERR "Parse Error: LINK string in unexpected format: $link_line\n";
    }
  }elsif (/([^\s]*)\s([^\s]*)\s([^\.]*)\.([^\s]*)\s([^\.]*)\.(.*)/) {
    my $volume = $1;
    my $schema = $2;
    my $src_table = $3;
    my $src_column = $4;
    my $dst_table = "$5" . "_csv";
    my $dst_column = $6;

    # if wildcard character exists, expand it now
    if ($src_table =~ /\*/) {
      my @glob = glob "$asgs_unzip_dir/127005500${volume}_".lc (${src_table})."_csv/";
      for my $g (@glob) {
        if ($g =~ /\/[0-9]*_(.*)_csv/) {
          my $expanded_src_table = $1;
          my $key = "$expanded_src_table-$dst_table";
          $volume_mapping{$key} = $volume;
          $schema_mapping{$key} = $schema;
          $src_tables{$key} = $expanded_src_table;
          $dst_tables{$key} = $dst_table;
          $column_mappings->{$key}->{$src_column} = $dst_column;
          if (scalar (grep (/^$key$/, @load_keys)) == 0) {
            push @load_keys, $key;
          }
        }
      }
    }else{
      my $key = "$src_table-$dst_table";
      $volume_mapping{$key} = $volume;
      $schema_mapping{$key} = $schema;
      $src_tables{$key} = $src_table;
      $dst_tables{$key} = $dst_table;
      $column_mappings->{$key}->{$src_column} = $dst_column;
      if (scalar (grep (/^$key$/, @load_keys)) == 0) {
        push @load_keys, $key;
      }
    }
  }else{
    print STDERR "Parse Error: $_\n";
  }
}

# set up database connection
my $dbh = DBI->connect("DBI:Pg:", '', '' , {'RaiseError' => 1, AutoCommit => 0});
my $sth;

for my $key (@load_keys) {
  my $src_table = $src_tables{$key};
  my $dst_table = $dst_tables{$key};
  my $volume = $volume_mapping{$key};
  my $schema = 'asgs_' . $schema_mapping{$key};

  my @src_columns = keys %{$column_mappings->{$key}};
  my @dst_columns = values %{$column_mappings->{$key}};

  print "-- $src_table -> $schema.$dst_table ...\n";

  # open the source csv file for reading
  my $csv = Text::CSV->new();
  open (my $src_data, '<', "$asgs_unzip_dir/127005500${volume}_".lc (${src_table})."_csv/".uc (${src_table}).".csv") or next;

  my $header = $csv->getline($src_data);
  #test src_columns are actually in header
  for my $c (@src_columns) {
    die "ERROR: $c does not appear in $src_table.csv\n" if (scalar (grep (/^$c$/, @{$header})) < 1);
  }

  # given the csv header, work out which columns to cut from the source data file in order to insert them in the same order as @src/dst_columns expects
  my @cut_columns;
  for my $src_c (@src_columns) {
    my $col_count = 0;
    for my $csv_c (@{$header}) {
      $col_count++;
      last if ($src_c eq $csv_c);
    }
    my $col_num_in_src = $col_count;
    push @cut_columns, $col_num_in_src;
  }

  # Because we are only cutting out a subset of the columns in the source csv files
  # we will get lots of duplicate lines, so we put them into a hash to drop the duplicates.
  my %inserts;

  # put the dbh into COPY mode
  $dbh->do("COPY $schema.$dst_table(" . join( ',', @dst_columns) . ") FROM STDIN;");

  # go through each line in the source csv file and load the data
  while (my $row = $csv->getline($src_data)) {
    # test if in hash already if it is skip else load into psql and insert into hash
    my @insert_values = cut($row, \@cut_columns);
    my $hash_key = $dst_table . join( ',', @dst_columns ) . join( ',', @insert_values);

    if (!exists $inserts{$hash_key}) {
      $dbh->pg_putcopydata(join("\t", @insert_values)."\n");

      # insert into the hash so we skip it next time
      $inserts{$hash_key} = undef;
    }
  }

  # take the dbh out of COPY mode
  $dbh->pg_putcopyend() or die $!;

  vacuum_analyze("$schema.$dst_table");

  close $src_data or warn $!;
}

# run through LINK load scripts
for my $link (@links) {
  my ($volume, $schema, $src_table, $csv_sa1_attribute, $db_sa1_table, $db_sa1_attribute, $csv_link_attribute, $db_link_attribute) = @{$link};
  $schema = 'asgs_' . $schema;

  print "-- LINK $db_sa1_table.$db_link_attribute ($src_table) ...\n";

  # open the source csv file for reading
  my $csv = Text::CSV->new();
  my $src_data;
  if ($src_table eq "Indigenous_Structure_Allocation_2011") {
    open ($src_data, '<', "$asgs_unzip_dir/127005500${volume}_${src_table}/${src_table}.csv") or die $!;
  } else {
    open ($src_data, '<', "$asgs_unzip_dir/127005500${volume}_".lc (${src_table})."_csv/".uc (${src_table}).".csv") or die $!;
  }

  my $header = $csv->getline($src_data);
  $csv->column_names ($header);
  # test key columns are actually in header
  for my $c ($csv_sa1_attribute,$csv_link_attribute) {
    die "ERROR: $c does not appear in $src_table.csv\n" if (scalar (grep (/^$c$/, @{$header})) < 1);
  }

  # prepare the insert statement
  $sth = $dbh->prepare("UPDATE $schema.$db_sa1_table SET $db_link_attribute = ? WHERE $db_sa1_attribute = ?;");

  # go through each line in the source csv file and execute the UPDATE statement
  while (my $row = $csv->getline_hr($src_data)) {
    $sth->execute($row->{$csv_link_attribute}, $row->{$csv_sa1_attribute}) or die $!;
  }

  $dbh->commit or die $!;

  vacuum_analyze("$schema.$db_sa1_table");

  close $src_data or warn $!;
}

$dbh->disconnect or warn $!;

sub cut($$) {
  my ($src_columns, $cut_columns) = @_;
  my @new_columns;

  for my $c (@{$cut_columns}) {
    push @new_columns, $src_columns->[$c-1];
  }

  return @new_columns;
}

sub vacuum_analyze($) {
  my ($schema_dot_table) = @_;

  # VACUUM ANALYZE the table (cannot be done inside a transaction)
  print "   VACUUM ANALYZE...\n";
  $dbh->{AutoCommit} = 1;
  $sth = $dbh->do("VACUUM ANALYZE $schema_dot_table;");
  $dbh->{AutoCommit} = 0;
}
