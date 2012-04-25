#!/bin/sh

# also using this statement to clear out an old file since we just append to it later in this script
echo "-- drop all tables which are part of the generalization pyramid" > drop-generalization-pyramid.sql

for i in $@
do
  cat generalization-pyramid-template.sql | sed "s/\$i/$i/g" | psql -f -

  for s in mb sa1 sa2 sa3 sa4 gccsa state iloc iare ireg tr poa ssc ced sed add nrmr lga
  do
    echo "DROP TABLE asgs_2011.${s}_$i CASCADE;" >> drop-generalization-pyramid.sql
  done
  echo "DELETE FROM geometry_columns WHERE (f_table_schema = 'asgs_2011' AND f_table_name LIKE '%\_$i');" >> drop-generalization-pyramid.sql
  echo "" >> drop-generalization-pyramid.sql
done

