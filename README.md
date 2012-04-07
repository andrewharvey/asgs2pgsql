About
=======

These scripts are designed to load the Australian Bureau of Statistics
[ASGS](http://www.abs.gov.au/websitedbs/D3310114.nsf/home/Australian+Statistical+Geography+Standard+(ASGS\)) into a PostgreSQL database. Both the data from the CSV files and spatial
geometries from the SHAPE files are loaded together.

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


Requirements
=======

Debian Dependencies: `gdal-bin, libdbd-pg-perl, postgresql-9.1-postgis,
  libtext-csv-perl, unzip, wget`

The scripts assume you have a PostgreSQL database up and running with a user of
name `abs` and a database owned by `abs` called `abs` which you can connect to
without authentication.

I plan to allow control of the postgres host and port using the PGHOST and
PGPORT environment variables, in a later release.

Running the Scripts
=======

You can set up the user and database with,

    $ sudo su - postgres
    $ createuser --no-createdb --no-createrole --superuser abs
    $ createdb --owner=abs abs
    $ psql --username abs -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql abs
    $ exit

Once that is set up, the rest of the process is as follows.

Currently the download paramaters are hard configured within `01-download-asgs.sh`
these were created using the script `00-make-download-code.sh`. I'm still not sure
if this is the best approach or if the download paramaters should be parsed from
the source HTML file at each call of `01-download-asgs.sh`. For now you should be
able to run,

    ./01-download-asgs.sh
    ./02-unzip-asgs.sh

Which should download and unzip the ASGS Volume 1-5 files.

If this step has been broken due to a change on the abs.gov.au web server,
because the source datasets are CC-BY 2.5 licensed, I host a copy of the results
after the `01-download-asgs.sh` step at http://tianjara.net/data/abs2pgsql/01-ASGS-ZIP/

Next we create the database schema using,

    psql --username abs -f 03-create-asgs-schema.sql abs

Next we load the flat data from the CSV files into PostgreSQL with,

    ./04-load-csv-data.pl < csv2psql.map

The filename/table name and attribute mappings are defined in `csv2pgsql.map`.
This step still needs some extra touches to load the I* references.

Next we load the geometries into these PostgreSQL tables from the SHAPE files
using,

    ./05-load-geom.pl < shp2pgsql.map

Again the schema mapping is controlled by the `shp2pgsql.map` file.

Please note that these scripts are still a work in progress and should be
considered EXPERIMENTAL. Use at your own risk.

