#!/usr/bin/perl

while (<STDIN>) {
  if ($_ =~ /\$gen/) {
    for my $i (@ARGV) {
      $newline = $_;
      $newline =~ s/\$gen/$i/g;
      print "$newline";
    }
  } else {
    print "$_";
  }
}
