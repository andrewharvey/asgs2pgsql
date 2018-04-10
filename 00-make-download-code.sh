#!/bin/bash

# To the extent possible under law, the person who associated CC0
# with this work has waived all copyright and related or neighboring
# rights to this work.
# http://creativecommons.org/publicdomain/zero/1.0/

for i in {1..6}
do
  echo "# ASGS Volume $i"
  echo "# ABS Publication: 1270.0.55.00$i"
  for year in 2011 2012 2013 2014 2015 2016 2017 2018
  do
      curl -o - "http://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/1270.0.55.00${i}July%20${year}?OpenDocument" 2> /dev/null | grep --binary-files=text --ignore-case --only-matching '/ausstats[^"]*' | grep -E '(Latest|Previous)$' | grep \.zip | grep --invert-match 'midmif\.zip' | cut -d'&' -f2,5,7,8,9 | sed 's/&/" "/g' | sed 's/$/"/' | sed "s/^127005500${i}_/download ${i} \"/" | sed "s/^cg_/download cg \"/"
    echo ""
  done
done

