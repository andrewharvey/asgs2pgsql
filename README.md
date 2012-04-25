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
===================
Setting up the database environment
-------------------------------------
First you need to set up and export some PG environment variables otherwise the
PostgreSQL defaults will be used. For example,

    export PGHOST=localhost
    export PGDATABASE=abs
    export PGUSER=abs

Refer to the [PostgreSQL documentation](http://www.postgresql.org/docs/current/static/libpq-envars.html)
for details on the environment variables which you can set.

If you don't already have a database and database user set up and you haven't
loaded the PostGIS extensions into that database, then you can set up the user,
database and PostGIS extensions on Debian using (replacing YOUR_DB and YOUR_DB_USER),

    sudo su - postgres
    createuser --no-createdb --no-createrole --superuser YOUR_DB
    createdb --owner=YOUR_DB_USER YOUR_DB
    exit
    # then with your PG* environment variables set load the postgis extensions
    psql -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql

Once that is set up, the rest of the process can be divided into two stages.

Stage 1 involves obtaining a local copy of the source ASGS data, and stage 2
involves loading this data into the PostgreSQL schema.

Stage 1: Downloading the source ASGS data
-------------------------------------
Currently the download parameters are hard configured within `01-download-asgs.sh`
these were created using the script `00-make-download-code.sh`. I'm still not sure
if this is the best approach or if the download parameters should be parsed from
the source HTML file at each call of `01-download-asgs.sh`. For now you should be
able to just run,

    make download

, which should download and unzip the ASGS Volume 1-5 files.

If this step has been broken due to a change on the abs.gov.au web server
(because the source datasets are CC-BY 2.5 licensed) I host a copy of the results
after the `01-download-asgs.sh` step at http://tianjara.net/data/asgs2pgsql/01-ASGS-ZIP/
Just download this directory then run 02-unzip-asgs.sh.

Stage 2: Loading the ASGS data into the database schema
-------------------------------------
This stage assumes you have the 02-ASGS-UNZIP directory from stage 1. With this
just run,

    make

By default the geometries are loaded into PostGIS using the OSM Slippy Map
coordinate system (EPSG:3857) (by using the -use_osm_coordsys option when 
calling ./stage2/05-load-geom.pl from the Makefile). To use the same coordinate
system as the source shape files, remove this option.

Stage 3: Materialised Pyramids of Generalised Geometries (Optional)
-------------------------------------
You can optionally produce materialised pyramid tables of the generalised geometries,

    make generalization_pyramid

Producing PG Dump files
=======
Once everything has been loaded into PostgreSQL using these scripts you can
create a PostgreSQL dump file using,

    pg_dump --format plain --schema "asgs_2011" --no-owner | xz > asgs_2011.sql.xz

<a id="prebuilt_dump"/>
I host a copy of this file at http://tianjara.net/data/asgs2pgsql/. After
creating the abs user and database (with the PostGIS extensions) as described
in the [first chunck of code under the Running the Scripts section](#createdb),
you can load the database dump using,

    xzcat asgs_2011.sql.xz | psql -f -

Because I'm unsure how to install PostGIS into a schema other than public with
PostGIS 1.4, the geometry_columns and spatial_ref_sys tables aren't included in
the DB dump. I believe PostGIS 2.0 makes it easier to install the extension in
another schema, so this issue should be resolved when PostGIS 2.0 is packaged
for Debian and I'm able to load the PostGIS exentions into the asgs_2011
schema.
