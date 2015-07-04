#!/bin/sh

rm -rf output/geojson output/topojson
mkdir -p output/geojson output/topojson

#for table in `psql --no-align --tuples-only --quiet -c "SELECT table_name FROM information_schema.tables WHERE table_schema = 'asgs_2011';"`; do
for table in lga ; do
    ogr2ogr -f GeoJSON -where "ste = '1'" output/geojson/asgs_2011.${table}.geojson PG:dbname=$dbname asgs_2011.$table
    ~/node_modules/topojson/bin/topojson --quantization 80000 --simplify-proportion 0.5 --id-property code -o output/topojson/asgs_2011.${table}.topo.json output/geojson/asgs_2011.${table}.geojson
done
