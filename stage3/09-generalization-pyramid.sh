#!/bin/bash

# This script uses the generalization-pyramid-template.sql template SQL file
# to make additional tables containing a materialised geometry generalization
# pyramid. It will also add a materialised area column.

# we need this to prepend to file references where those files are in the same
# directory as this script
cwd=`dirname $0`

# Start the drop pyramid sql file. This also clears out any file contents which
# is needed now as we just append to it later in this script.
echo "-- drop all tables which are part of the generalization pyramid" > $cwd/drop-generalization-pyramid.sql

# pull the list of generalisation tolerances to use from the program arguments
generalisation_tolerances=$@

for s in mb sa1 sa2 sa3 sa4 gccsa ste iloc iare ireg tr poa ssc ced sed add nrmr lga
do
  echo "$s";
  cp $cwd/generalization-pyramid-template.sql $cwd/gen-pyramid-staging0.sql

  # replace "$table" from template SQL
  sed -i "s/\$table/$s/g" $cwd/gen-pyramid-staging0.sql

  # replace "$gen" from template SQL
  $cwd/expand-dollar-gen.pl $generalisation_tolerances < $cwd/gen-pyramid-staging0.sql > $cwd/gen-pyramid-staging1.sql;

  # because the expand dollar duplicates lines. the last column in the select will need its trailing comma removed
  # syntax from http://stackoverflow.com/a/1252191 (Zsolt Botykai)
  sed -i ':a;N;$!ba;s/,\n  FROM/\n  FROM/g' $cwd/gen-pyramid-staging1.sql

  psql -f $cwd/gen-pyramid-staging1.sql
  rm -f $cwd/gen-pyramid-staging*

  echo "DROP TABLE asgs_2011.${s}_pyramid CASCADE;" >> $cwd/drop-generalization-pyramid.sql
done

echo "DELETE FROM geometry_columns WHERE (f_table_schema = 'asgs_2011' AND f_table_name LIKE '%\_pyramid');" >> $cwd/drop-generalization-pyramid.sql



