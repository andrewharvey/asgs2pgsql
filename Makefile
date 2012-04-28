# Author: Andrew Harvey (http://andrewharvey4.wordpress.com/)
#
# To the extent possible under law, the person who associated CC0
# with this work has waived all copyright and related or neighboring
# rights to this work.
# http://creativecommons.org/publicdomain/zero/1.0/


all : clean load

clean :
	psql -c "DROP SCHEMA IF EXISTS asgs_2011 CASCADE;"
	psql -c "DELETE FROM geometry_columns WHERE (f_table_schema = 'asgs_2011');"

download :
	./01-download-asgs.sh
	./02-unzip-asgs.sh

load :
	# create the database schema and _csv tables
	psql -f stage2/03-create-asgs-csv-schema.sql
	
	# load the flat data from the CSV files into PostgreSQL
	# the filename/table name and attribute mappings are defined in csv2pgsql.map
	./stage2/04-load-csv-data.pl < csv2psql.map
	
	# load geometries into _ogr tables from the SHAPE files
	# the schema mapping is controlled by the shp2pgsql.map file
	# by default the geometries are loaded into PostGIS using the same
	# coordinate system as the source shape files. If you would prefer the OSM
	# Slippy Map coordinate system (EPSG:3857) add the -use_osm_coordsys option
	./stage2/05-load-geom.pl -use_osm_coordsys < shp2pgsql.map
	
	# by now we have the csv data in the _csv tables and shp file data in _ogr
	# tables. We then use the 06 script generated from 05 to correct column
	# types in the _ogr tables so we can then join them using the common key
	psql -f stage2/06-cast-ogr.sql
	
	# join the csv and ogr tables together,
	psql -f stage2/07-create-asgs-schema.sql
	
	# fixup the geometry_columns table and cleanup the _ogr and _csv tables
	# leaving just the final joined tables
	psql -f stage2/08-clean-ogr.sql
	
	# load extra ASGS related functions
	psql -f stage2/99-load-extra-asgs-functions.sql

generalization_pyramid :
	# the arguments given are the levels of the pyramid to create (1 table for each argument)
	# they are used as the PostGIS ST_SimplifyPreserveTopology tolerance parameter
	# and are in the spatial reference system units (so if using -use_osm_coordsys
	# for 05-load-geom.pl then will be in meters, otherwise decimal degrees)
	./09-generalization-pyramid.sh 5 25 50

drop_generalization_pyramid :
	psql -f drop-generalization-pyramid.sql
