#!/bin/sh

rm -rf output/geojson
mkdir -p output/geojson

for year in 2011 2015 2016 ; do
    for table in `psql --no-align --tuples-only --quiet -c "SELECT table_name FROM information_schema.tables WHERE table_schema = 'asgs_${year}';"`; do
        echo asgs_${year}.${table}
        ogr2ogr -f GeoJSON -t_srs 'EPSG:4326' -lco COORDINATE_PRECISION=5 -lco RFC7946=YES output/geojson/asgs_${year}.${table}.geojson PG:dbname=$dbname asgs_$year.$table
        #pxz output/geojson/asgs_${year}.${table}.geojson
    done
done
