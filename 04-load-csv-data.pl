#!/usr/bin/perl -w

# To the extent possible under law, the person who associated CC0
# with this work has waived all copyright and related or neighboring
# rights to this work.
# http://creativecommons.org/publicdomain/zero/1.0/

use strict;
use Text::CSV;
use DBI;
use Data::Dumper;

sub cut($$);
sub prepare_n($);

my $schema = "abs_2011.";

my $asgs_unzip_dir = "02-ASGS-UNZIP";

my %table_mapping;
my %volume_mapping;
my $column_mappings = {};
my @ordered_tables;

while (<STDIN>) {
  chomp;
  next if /^#/;
  next if /^\s*$/;

  if (/([^\s]*)\s([^\.]*)\.([^\s]*)\s([^\.]*)\.(.*)/) {
    my $volume = $1;
    my $src_table = $2;
    my $src_column = $3;
    my $dst_table = $4;
    my $dst_column = $5;

    # if wildcard character exists, expand it now
    if ($src_table =~ /\*/) {
      my @glob = glob "$asgs_unzip_dir/127005500${volume}_".lc (${src_table})."_csv/";
      for my $g (@glob) {
        if ($g =~ /\/[0-9]*_(.*)_csv/) {
          my $expanded_src_table = $1;
          $volume_mapping{$expanded_src_table} = $volume;
          $table_mapping{$expanded_src_table} = $dst_table;
          $column_mappings->{$expanded_src_table}->{$src_column} = $dst_column;
          if (scalar (grep (/^$expanded_src_table$/, @ordered_tables)) == 0) {
            push @ordered_tables, $expanded_src_table;
          }
        }
      }
    }else{
      $volume_mapping{$src_table} = $volume;
      $table_mapping{$src_table} = $dst_table;
      $column_mappings->{$src_table}->{$src_column} = $dst_column;
      if (scalar (grep (/^$src_table$/, @ordered_tables)) == 0) {
        push @ordered_tables, $src_table;
      }
    }
  }else{
    print STDERR "Parse Error: $_\n";
  }
}

# set up database connection
my $dbh = DBI->connect("DBI:Pg:dbname=abs;host=localhost", 'abs', '' , {'RaiseError' => 1, AutoCommit => 0});

# truncate all tables prior to inserting values

#print Dumper (@ordered_tables);
#print Dumper(keys %table_mapping);
#exit;

for my $src_table (@ordered_tables) {
  my $dst_table = $table_mapping{$src_table};
  my $sth = $dbh->do("TRUNCATE TABLE $schema$dst_table CASCADE;");
  $dbh->commit;
}

for my $src_table (@ordered_tables) {
  my $dst_table = $table_mapping{$src_table};
  my $volume = $volume_mapping{$src_table};

  my @src_columns = keys $column_mappings->{$src_table};
  my @dst_columns = values $column_mappings->{$src_table};

  print "-- $src_table -> $schema$dst_table ...\n";

  # open the source csv file for reading
  my $csv = Text::CSV->new();
  open (my $src_data, '<', "$asgs_unzip_dir/127005500${volume}_".lc (${src_table})."_csv/".uc (${src_table}).".csv") or die $!;

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

  # prepare the insert statement
  my $sth = $dbh->prepare("INSERT INTO $schema$dst_table(" . join( ',', @dst_columns) . ") VALUES (" . prepare_n(scalar @dst_columns) . ");");

  # go through each line in the source csv file and create the INSERT statement
  while (my $row = $csv->getline($src_data)) {
    # test if in hash already if it is skip else load into psql and insert into hash
    my $hash_key = $dst_table . join( ',', @dst_columns ) . join( ',', cut($row, \@cut_columns));

    if (!exists $inserts{$hash_key}) {
      #print "INSERT INTO $schema$dst_table(" . join( ', ', @dst_columns) . ") VALUES (\"" . join( '", "', cut($row, \@cut_columns)) . "\");\n";
      $sth->execute(cut($row, \@cut_columns)) or die $!;

      # insert into the hash so we skip it next time
      $inserts{$hash_key} = undef;
    }
  }

  $dbh->commit or die $!;

  # VACUUM ANALYZE the table (cannot be done inside a transaction)
  $dbh->{AutoCommit} = 1;
  my $sth = $dbh->do("VACUUM ANALYZE $schema$dst_table;");
  $dbh->{AutoCommit} = 0;

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

sub prepare_n($) {
  my ($n) = @_;
  my $st = '';

  return '' if ($n == 0);

  for (my $i = 0; $i < ($n-1); $i++) {
    $st = $st . '?,';
  }

  $st = $st . '?';
  return $st
}
