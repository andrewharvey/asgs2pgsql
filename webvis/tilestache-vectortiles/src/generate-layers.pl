#!/usr/bin/perl -w

# To the extent possible under law, the person who associated CC0
# with this work has waived all copyright and related or neighboring
# rights to this work.
# http://creativecommons.org/publicdomain/zero/1.0/

use strict;
use warnings;

my $dbname = $ENV{PGDATABASE};
my $dbuser = $ENV{PGUSER};

my $low_bound = 14;

while (<>) {
    if ($_ =~ /^(\w+)\s*([^\s]*)/) {
        my ($structure, $properties) = ($1, $2);
        my @properties = split /,/, $properties;

        # generate the whitelist syntax
        for (@properties) {
            $_ = '"' . $_ . '"'; 
        }
        my $property_whitelist = '[' . join(',', @properties) . ']';
        
        # use the first property in the whitelist as the ID
        my $id_property = $properties[0];

        `cat layer-template.json | \
        sed 's/\\\$STRUCTURE/$structure/g' | \
        sed 's/\\\$DBNAME/$dbname/g' | \
        sed 's/\\\$DBUSER/$dbuser/g' | \
        sed 's/\\\$ID_PROPERTY/$id_property/g' | \
        sed 's/\\\$PROPERTIES/$property_whitelist/g' | \
        sed 's/\\\$LOWBOUND/$low_bound/g' > layers/$structure.json`;
    }
}

`cat layers/*.json > build/tilestache-layers.json`;
