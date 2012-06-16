# About
This project provides the Australian Bureau of Statistics
[Australian Statistical Geography Standard](http://www.abs.gov.au/websitedbs/D3310114.nsf/home/Australian+Statistical+Geography+Standard+(ASGS\))
(ASGS) in a PostgreSQL database using the PostGIS extension to store the
geospatial data.

This project provides the scripts to load the source data as provided by
the ABS into PostgreSQL (building from source) but also provides a
database dump of the loaded data (using the pre-built package).

The ASGS is published as a combination of non-spatial CSV files and
spatial SHAPE files. Both of these files are used in this loader and
combined together to form this (unofficial) ASGS PostgreSQL schema.

You may also be interested in the corresponding [abs2pgsql loader scripts](https://github.com/andrewharvey/abs2pgsql)
which will load the ABS 2011 Census of Population and Housing into
PostgreSQL, making use of this ASGS schema to provide the geographic
standard to those statistics.

# About the ASGS
The ASGS consists of around 22 individual structures which are classified into ABS Structures and Non-ABS
Structures [as shown in this diagram](http://www.abs.gov.au/websitedbs/D3310114.nsf/4a256353001af3ed4b2562bb00121564/c453c497aadde71cca2576d300026a38/$FILE/ASGS%20Structure%20and%20Summary.pdf).

The 2011 release of the ASGS consists of Volumes 1-5. Volumes 4 and 5
have not yet been released and as such these scripts just process volumes
1-3.

* Volume 1 - 1270.0.55.001 consists of the Main Structure and Greater Capital City Statistical Areas ([documentation](http://www.abs.gov.au/ausstats/subscriber.nsf/log?openagent&1270055001_july%202011.pdf&1270.0.55.001&Publication&D3DC26F35A8AF579CA257801000DCD7D&&July%202011&23.12.2010&Latest))
* Volume 2 - 1270.0.55.002 consists of the Indigenous Structure ([documentation](http://www.abs.gov.au/AUSSTATS/subscriber.nsf/log?openagent&1270055002_july%202011.pdf&1270.0.55.002&Publication&FE2D2D707996F20ACA25791000152669&&July%202011&20.09.2011&Previous))
* Volume 3 - 1270.0.55.003 consists of the Non-ABS Structures ([documentation](http://www.abs.gov.au/AUSSTATS/subscriber.nsf/log?openagent&1270055003_oct%202011.pdf&1270.0.55.003&Publication&469CDA45CE2B94CCCA257937000D966F&&July%202011&31.10.2011&Previous))
* Volume 4 - 1270.0.55.004 consists of the Significant Urban Areas and Section of State/Urban Centres and Localities Structure (SUA, SOS/UCL)
* Volume 5 - 1270.0.55.005 consists of the Remoteness Structure

The ABS Structures (vol 1, 2, 4, 5) will not change until the next Census
in 2016, however the Non-ABS Structures (vol 3) will be updated annually.

For now the scripts load all the volumes into the asgs_2011 schema,
although in the future this will need a rethink to address the annual
updates and 5 year census updates.

## About the target schema
The target PostgreSQL schema which stores the ASGS aims to be true to and
consistent with the standard, however there is still room for flexibility
and there are many different ways you could structure the target schema.

### Versioning and Stable Releases
The current schema isn't fixed and I'm happy to make modifications if
there are valid reasons. You may consider the current state of the schema
an RC release. It can and may change. I hope to release stable versions
of this loader and the dumps with a release version, but as of yet no
stable release has been made. If significant architectural changes are
made to the schema I will ensure I at least tag the current state before
moving direction.

### PostGIS Topology support
One future direction is to use [PostGIS Topology](http://www.postgis.org/documentation/manual-svn/Topology.html)
support. As all of the ASGS structures are built up from Mesh Blocks we
could elegantly model the ASGS as PostGIS topologies built up as
aggregates of the Mesh Blocks.

### Current Schema
#### Codes
Primary key codes for the ASGS structures are generally made unique by
concatenating the code with a the code of the parent structure which it
was built from. For example the S/T structure is built up from the SA4
structure. That is S/T's are built up from one or more SA4's.

This means that the unique code for SA4's is only unique within its S/T,
so to obtain a globally unique code for that SA4 you need to prepend the
S/T code.

So for example SA1's are unique with respect to their 11 digit code.
However that 11 digit code is made up of S/T . SA4 . SA4 . SA3 . SA2 . SA1.

Currently the schema will store the materialised 11 digit SA1 code. A
potential modification to the schema could store only the 2 digit SA1
code and rely on an accompanying SA2 foreign key to provide the globally
unique primary key.

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

# Before You Start
Running these scripts is akin to building software from source. If you just
want a copy of the database without needing to "build" it from source skip to
the [last section of this README](#loading-an-existing-db-dump).

# Requirements
Debian Dependencies: `gdal-bin (>= 1.7.0), libdbd-pg-perl,
  postgresql-9.1-postgis, libtext-csv-perl, unzip, wget`

The scripts assume you have a PostgreSQL database up and running. We leave
authentication to this database your responsibility through the PostgreSQL
environment variables which are described in the next section. I also describe
creating a database in the next section if you don't know how to set one up.

The simplest authentication setup is to allow local unauthenticated access to
your database. You can do this by adding the following example line to
`/etc/postgresql/9.*/main/pg_hba.conf`

    local   abs   abs      trust

This allows the database named `abs` to be accessed by the database user `abs`
without authentication.

You could substitute trust with ident if you create the user `abs` on your
system and run these scripts as that user.

# Running the Scripts
## Setting up the database environment
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

Once that is set up, the rest of the process is as follows.

## Stage 1: Downloading the source ASGS data
Currently the download parameters are hard configured within
`01-download-asgs.sh`. These were created using the script
`00-make-download-code.sh`. I'm still not sure if this is the best approach or
if the download parameters should be parsed from the source HTML file at each
call of `01-download-asgs.sh`. For now you should be able to just run,

    make download

which should download and unzip the ASGS Volume 1-5 files.

If this step has been broken due to a change on the abs.gov.au web server
(because the source datasets are CC-BY 2.5 licensed) I host a copy of the
results after the `01-download-asgs.sh` step at http://tianjara.net/data/asgs2pgsql/01-ASGS-ZIP/
Just download this directory then run 02-unzip-asgs.sh.

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
as that will give you the best area values. If you don't have any
specific need it would be fine to leave it in the same coordinate system
as the original shape files, unprojected lat longs in the GDA94 datum.

I have deliberated over which coordinate system should be the default,
but have ultimately decided to respect the ASGS standard and use the same
coordinate system as the source data from the ABS.

I present the common alternatives as user options. Though there are
problems with supporting many different configurations including different
pg_dumps need to be generated, the options add confusion to non-experts,
makes it harder for other applications to rely on the one standard ASGS
PostgreSQL schema if there are several different versions.

You can always do on the fly re-projection in PostGIS but quite often you
will want to load the data in the coordinate system you wish to use it in
to avoid performance issues associated with on the fly re-projection.

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

## Loading an existing db dump
I host a copy of this file at http://tianjara.net/data/asgs2pgsql/. After
setting your PG* environment variables and creating a database (with the
PostGIS extensions loaded) as described [above](#setting-up-the-database-environment),
you can load the database dump using,

    xzcat asgs_2011.sql.xz | psql -f -

Because I'm unsure how to install PostGIS into a schema other than public with
PostGIS 1.4, the geometry_columns and spatial_ref_sys tables aren't included in
the DB dump. I believe PostGIS 2.0 makes it easier to install the extension in
another schema, so this issue should be resolved when PostGIS 2.0 is packaged
for Debian and I'm able to load the PostGIS extensions into the asgs_2011
schema.

# Known Issues
* You may run into issue [described here](http://postgis.org/documentation/manual-2.0/ch07.html#id2823352).
