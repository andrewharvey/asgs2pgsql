# About
This project provides the Australian Bureau of Statistics
[Australian Statistical Geography
Standard](http://www.abs.gov.au/websitedbs/D3310114.nsf/home/Australian+Statistical+Geography+Standard+(ASGS))
(ASGS) in a PostgreSQL database using the PostGIS extension to store the
geospatial data.

You may either use these scripts to [build your own database from source data](#build-from-source), or pg_restore a [pre-built database dump](#loading-an-existing-db-dump).

The ASGS is published as a combination of non-spatial CSV files and
spatial SHAPE files. Both of these files are used in this loader and
combined together to form this (unofficial) ASGS PostgreSQL schema.

You may also be interested in the corresponding [abs2pgsql loader scripts](https://github.com/andrewharvey/abs2pgsql)
which will load the ABS 2011 Census of Population and Housing into
PostgreSQL, making use of this ASGS schema to provide the geographic
standard to those statistics.

# About the ASGS
The ASGS consists of around 22 individual structures which are classified into ABS Structures and Non-ABS
Structures [as shown in this
diagram](http://www.abs.gov.au/websitedbs/D3310114.nsf/4a256353001af3ed4b2562bb00121564/c453c497aadde71cca2576d300026a38/$FILE/ASGS%202011%20Structure%20and%20Summary.pdf).

The ASGS consists of Volumes 1-5.

* Volume 1 - 1270.0.55.001 consists of the Main Structure and Greater Capital City Statistical Areas ([documentation](http://www.abs.gov.au/ausstats/subscriber.nsf/log?openagent&1270055001_july%202011.pdf&1270.0.55.001&Publication&D3DC26F35A8AF579CA257801000DCD7D&&July%202011&23.12.2010&Latest))
* Volume 2 - 1270.0.55.002 consists of the Indigenous Structure ([documentation](http://www.abs.gov.au/AUSSTATS/subscriber.nsf/log?openagent&1270055002_july%202011.pdf&1270.0.55.002&Publication&FE2D2D707996F20ACA25791000152669&&July%202011&20.09.2011&Previous))
* Volume 3 - 1270.0.55.003 consists of the Non-ABS Structures ([documentation](http://www.abs.gov.au/AUSSTATS/subscriber.nsf/log?openagent&1270055003_oct%202011.pdf&1270.0.55.003&Publication&469CDA45CE2B94CCCA257937000D966F&&July%202011&31.10.2011&Previous))
* Volume 4 - 1270.0.55.004 consists of the Significant Urban Areas and Section of State/Urban Centres and Localities Structure (SUA, SOS/UCL) ([documentation](http://www.abs.gov.au/AUSSTATS/subscriber.nsf/log?openagent&1270055004_july%202011.pdf&1270.0.55.004&Publication&1080B7CB374FC771CA257A980013D404&&July%202011&16.10.2012&Latest))
* Volume 5 - 1270.0.55.005 consists of the Remoteness Structure ([documentation](http://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/1270.0.55.005July%202011?OpenDocument))
* Correspondences - 1270.0.55.006 provides correspondences between the older ASGC and the newer ASGS [documentation](http://www.abs.gov.au/AUSSTATS/abs@.nsf/productsbyCatalogue/A08009E6A2BA5ABBCA257A2900197A49?OpenDocument))

The ABS Structures (vol 1, 2, 4, 5) are usually updated for each Census and
the Non-ABS Structures (vol 3) are updated annually as required (so not all
volume 3 structures are updated each year)

### Schema
#### Codes
Primary key codes for the ASGS structures are generally made unique by
concatenating the code with the code of the parent structure which it
was built from. For example the S/T structure is built up from the SA4
structure. That is S/T's are built up from one or more SA4's.

This means that the unique code for SA4's is only unique within its S/T,
so to obtain a globally unique code for that SA4 you need to prepend the
S/T code.

So for example SA1's are unique with respect to their 11 digit code.
However that 11 digit code is made up of S/T . SA4 . SA4 . SA3 . SA2 . SA1.

# Copyright
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

# Build from Source
Running these scripts is akin to building software from source. If you just
want a copy of the database without needing to "build" it from source skip to
the [last section of this README](#loading-an-existing-db-dump).

## Requirements
Debian dependencies: `make, gdal-bin (>= 1.7.0), libdbd-pg-perl, (postgis >= 2.1), libtext-csv-perl, libtext-csv-xs-perl, unzip, wget`

The scripts assume you have a PostgreSQL database up and running. We leave
authentication to this database your responsibility through the PostgreSQL
environment variables which are described in the next section. I also describe
creating a database in the next section if you don't know how to set one up.

The simplest authentication setup is to allow local unauthenticated access to
your database. You can do this by adding the following example line to
`/etc/postgresql/9.*/main/pg_hba.conf`

    local   abs   abs      trust

This allows the database named `abs` to be accessed by the database user `abs`
without authentication via local socket connections.

## Setting up the database environment
You need to set up and export some PG environment variables otherwise the
PostgreSQL defaults will be used. For example,

    export PGHOST=localhost # not necessary if localhost
    export PGDATABASE=abs
    export PGUSER=abs

Refer to the [PostgreSQL documentation](http://www.postgresql.org/docs/current/static/libpq-envars.html)
for details on the environment variables which you can set.

If you don't already have a database and database user set up, then on Debian you could:

    sudo su - postgres
    createuser --no-createdb --no-createrole --superuser YOUR_DB_USER
    createdb --owner=YOUR_DB_USER YOUR_DB
    exit

## Stage 1: Downloading the source ASGS data
The download parameters are hard configured within `01-download-asgs.sh`. These were created using the script `00-make-download-code.sh`. You should run:

    make download

This should download and unzip the ASGS Volume 1-6 files.

## Stage 2: Loading the ASGS data into the database schema
This stage assumes you have the 02-ASGS-UNZIP directory from stage 1. With this
just run,

    make

### Coordinate Systems
When you load geographic data into PostgreSQL using the PostGIS extension
you must define the coordinate system of that data. The coordinate system
you should use depends on what you are most likely to use the data for.

For instance if you are going to be rendering web maps from the data it
would make sense to store the data in PostGIS as the
[EPSG:900913](http://wiki.openstreetmap.org/wiki/EPSG:3857) coordinate
system.

If you want to do lots of analysis and calculations based on the areas of
the regions it makes sense to load the data in the GDA94 / Australian
Albers coordinate system ([EPSG:3577](http://spatialreference.org/ref/epsg/3577/))
as that will give you the best area values.

If you don't have any
specific needs it would be fine to leave it in the same coordinate system
as the original shape files, unprojected lat longs in the GDA94 datum.

To switch the coordinate system which we load the data into check out the
configuration section at the top of the `Makefile`.

## Stage 3: Materialised Pyramids of Generalised Geometries (Optional)
You can optionally produce materialised pyramid tables of the generalised
geometries,

    make generalization_pyramid

# PG Dump
## Producing a new db dump
Once everything has been loaded into PostgreSQL using these scripts you can
create a PostgreSQL dump file using,

    pg_dump --format plain --schema "asgs_2011" --no-owner | xz > asgs_2011.sql.xz
    pg_dump --format plain --schema "asgs_2015" --no-owner | xz > asgs_2015.sql.xz
    pg_dump --format plain --schema "asgs_2016" --no-owner | xz > asgs_2016.sql.xz

## Loading an existing db dump
I host a copy of these files at http://tianjara.net/data/asgs2pgsql/. After
setting your PG* environment variables and creating a database (with the
PostGIS extensions loaded) as described [above](#setting-up-the-database-environment),
you can load the database dumps using,

    xzcat asgs_2011.sql.xz | psql -f -
    xzcat asgs_2015.sql.xz | psql -f -
    xzcat asgs_2016.sql.xz | psql -f -

# Known Issues
* You may run into the issue [described here](http://postgis.org/documentation/manual-2.0/ch07.html#id575278).

# How to use the resulting database
Some examples of scripts you can run to pull intelligence from the resulting
asgs2pgsql schema are included in the examples directory.
