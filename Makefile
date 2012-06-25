# Author: Andrew Harvey (http://andrewharvey4.wordpress.com/)
#
# To the extent possible under law, the person who associated CC0
# with this work has waived all copyright and related or neighboring
# rights to this work.
# http://creativecommons.org/publicdomain/zero/1.0/

# Configuration

# Target coordinate to use for the geospatial data in PostgreSQL. The
# source data will be reprojected if required. Use one of the following:
# 1. No reprojection
#t_srs=
# 2. GDA94 LL (no reprojection needed as source files are in this already)
t_srs="EPSG:4283"
# 2. Spherical Mercator (OSM/Google Maps web tiles)
#t_srs="EPSG:3857"
# 3. GDA94 / Australian Albers coordinate system
#t_srs="EPSG:3577"

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
	# t_srs is passed as an argument which can specify the target coordinate system
	./stage2/05-load-geom.pl $t_srs < shp2pgsql.map
	
	# by now we have the csv data in the _csv tables and shp file data in _ogr
	# tables. We then use the 06 script generated from 05 to correct column
	# types in the _ogr tables so we can then join them using the common key
	psql -f stage2/06-cast-ogr.sql
	
	# join the csv and ogr tables together,
	psql -f stage2/07-create-asgs-schema.sql
	
	# fixup the geometry_columns table and cleanup the _ogr and _csv tables
	# leaving just the final joined tables
	psql -f stage2/08-clean-ogr.sql
	
	# alter the sa1 table to include a materialised 7-digit code to supplement the 11-digit PRIMARY KEY code
	psql -f stage2/09-sa1-7digit.sql
	
	# load the aust table (not part of official ASGS 2011, but referenced in the 2011 Census)
	psql -f stage2/10-australia-hack.sql
	
	# load extra ASGS related functions
	psql -f stage2/98-load-extra-asgs-functions.sql
	
	# load extra views which provided added value to the standard ASGS schema
	psql -f stage2/99-create-extra-views.sql

generalization_pyramid :
	# the arguments given are the levels of the pyramid to create (1 table for each argument)
	# they are used as the PostGIS ST_SimplifyPreserveTopology tolerance parameter
	# and are in the spatial reference system units (so if using -use_osm_coordsys
	# for 05-load-geom.pl then will be in meters, otherwise decimal degrees)
	# for meters, a good rule of thumb is f(z) = 2^(-z) * 102400
	# i.e. at zoom 10 use a tolerance of 100, at zoom 11 use a tolerance of 50, etc.
	./stage3/09-generalization-pyramid.sh 5 12 25 50 100 200 400 800 1600 3200

drop_generalization_pyramid :
	psql -f stage3/drop-generalization-pyramid.sql

dump :
	pg_dump --format plain --schema "asgs_2011" --no-owner | xz > asgs_2011.sql.xz
