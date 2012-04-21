About
=======

These scripts are designed to load the Australian Bureau of Statistics
[ASGS](http://www.abs.gov.au/websitedbs/D3310114.nsf/home/Australian+Statistical+Geography+Standard+(ASGS\)) into a PostgreSQL database. Both the data from the CSV files and spatial
geometries from the SHAPE files are loaded together.

Once the ABS releases the 2011 Census data, I hope to produce similar scripts
to load that data into PostgreSQL referencing this ASGS schema.

The ASGS consists of Volumes 1-5. Publications 1270.0.55.001 - 1270.0.55.005.
Only Volumes 1-3 have been release and as such these scripts just process 1-3.

Copyright
=======
The ABS ASGS data is Copyright (c) Commonwealth of Australia and as per 
http://www.abs.gov.au/websitedbs/D3310114.nsf/Home/©+Copyright?opendocument
it is released under the [Creative Commons Attribution 2.5 Australia license](http://creativecommons.org/licenses/by/2.5/au/).

Thanks to the ABS for releasing this data under a free and open license.

All the files within this asgs2pgsql repository are released under the
[CC0](http://creativecommons.org/publicdomain/zero/1.0/) license by
Andrew Harvey <andrew.harvey4@gmail.com>. Although not required, I would prefer
you give Attribution and release derived works or modifications under the same
CC0 license.

    To the extent possible under law, the person who associated CC0
    with this work has waived all copyright and related or neighboring
    rights to this work.
    http://creativecommons.org/publicdomain/zero/1.0/

Before You Start
=======
Running these scripts is akin to building software from source. If you just
want a copy of the database without needing to "build" it from source skip to
the [last two lines of this README](#prebuilt_dump).

Requirements
=======

Debian Dependencies: `gdal-bin (>= 1.7.0), libdbd-pg-perl,
  postgresql-9.1-postgis, libtext-csv-perl, unzip, wget`

The scripts assume you have a PostgreSQL database up and running and you have
configured it such that you can connect to the database either without
authentication or password authentication.

For example by adding the following line to `/etc/postgresql/9.*/main/pg_hba.conf`

    local   abs   abs      trust

the database named abs can be accessed by the database user abs without
authentication.

You could substitute trust with ident if you create the user abs on your system
and run these scripts as that user.

Running the Scripts
=======
<a id="createdb"/>
If you don't already have a database and database user set up and you haven't
loaded the PostGIS extensions into that database, then you can set up the user,
database and PostGIS extensions on Debian using,

    sudo su - postgres
    createuser --no-createdb --no-createrole --superuser abs
    createdb --owner=abs abs
    psql --username abs -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql abs
    exit

Once that is set up, the rest of the process is as follows.

You need to set up and export some PG environment variables otherwise the
PostgreSQL defaults will be used. For example,

    export PGHOST=localhost
    export PGDATABASE=abs
    export PGUSER=abs

Refer to the [PostgreSQL documentation](http://www.postgresql.org/docs/current/static/libpq-envars.html)
for details on the environment variables which you can set.

Currently the download parameters are hard configured within `01-download-asgs.sh`
these were created using the script `00-make-download-code.sh`. I'm still not sure
if this is the best approach or if the download parameters should be parsed from
the source HTML file at each call of `01-download-asgs.sh`. For now you should be
able to run,

    ./01-download-asgs.sh
    ./02-unzip-asgs.sh

Which should download and unzip the ASGS Volume 1-5 files.

If this step has been broken due to a change on the abs.gov.au web server,
because the source datasets are CC-BY 2.5 licensed, I host a copy of the results
after the `01-download-asgs.sh` step at http://tianjara.net/data/asgs2pgsql/01-ASGS-ZIP/

Next we create the database schema and _csv tables using,

    psql -f 03-create-asgs-csv-schema.sql

Next we load the flat data from the CSV files into PostgreSQL with,

    ./04-load-csv-data.pl < csv2psql.map

The filename/table name and attribute mappings are defined in `csv2pgsql.map`.

Next we load geometries into _ogr tables from the SHAPE files using,

    ./05-load-geom.pl < shp2pgsql.map

Again the schema mapping is controlled by the `shp2pgsql.map` file.

By default the geometries are loaded into PostGIS using the same coordinate
system as the source shape files. If you would prefer the OSM Slippy Map
coordinate system (EPSG:3857) add the -use_osm_coordsys option, eg.

    ./05-load-geom.pl -use_osm_coordsys < shp2pgsql.map

By now we have the csv data in the _csv tables and shp file data in _ogr tables.
We then use the 06 script generated from 05 to correct column types in the _ogr
tables so we can then join them using the common key using,

    psql -f 06-cast-ogr.sql

Next to join the csv and ogr tables together we run,

    psql -f 07-create-asgs-schema.sql

And finally fixup the geometry_columns table and cleanup the _ogr and _csv
tables leaving just the final joined tables with,

    psql -f 08-clean-ogr.sql

Producing PG Dump files
=======
Once everything has been loaded into PostgreSQL using these scripts you can
create a PostgreSQL dump file using,

    pg_dump --format plain --verbose --schema "asgs_2011" --username "abs" "abs" | xz > asgs_2011.sql.xz

<a id="prebuilt_dump"/>
I host a copy of this file at http://tianjara.net/data/asgs2pgsql/. After
creating the abs user and database (with the PostGIS extensions) as described
in the [first chunck of code under the Running the Scripts section](#createdb),
you can load the database dump using,

    xzcat asgs_2011.sql.xz | psql -f - abs abs

Because I'm unsure how to install PostGIS into a schema other than public with
PostGIS 1.4, the geometry_columns and spatial_ref_sys tables aren't included in
the DB dump. I believe PostGIS 2.0 makes it easier to install the extension in
another schema, so this issue should be resolved when PostGIS 2.0 is packaged
for Debian and I'm able to load the PostGIS exentions into the asgs_2011
schema.
