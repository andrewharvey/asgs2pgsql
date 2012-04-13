
-- To the extent possible under law, the person who associated CC0
-- with this work has waived all copyright and related or neighboring
-- rights to this work.
-- http://creativecommons.org/publicdomain/zero/1.0/

-- This schema is partly derived from the ASGS structure.
-- http://www.abs.gov.au/websitedbs/D3310114.nsf/home/Australian+Statistical+Geography+Standard+%28ASGS%29

DROP SCHEMA asgs_2011 CASCADE;

CREATE SCHEMA asgs_2011;

CREATE TABLE asgs_2011.state
(
  "code" smallint PRIMARY KEY,
  "name" text,
  "geom" geometry
);

CREATE TABLE asgs_2011.ireg
(
  "code" smallint PRIMARY KEY,
  "name" text,
  "state" smallint REFERENCES asgs_2011.state(code),
  "geom" geometry
);

CREATE TABLE asgs_2011.iare
(
  "code" integer PRIMARY KEY,
  "name" text,
  "ireg" smallint REFERENCES asgs_2011.ireg(code),
  "state" smallint REFERENCES asgs_2011.state(code),
  "geom" geometry
);


CREATE TABLE asgs_2011.iloc
(
  "code" integer PRIMARY KEY,
  "name" text,
  "iare" integer REFERENCES asgs_2011.iare(code),
  "ireg" smallint REFERENCES asgs_2011.ireg(code),
  "state" smallint REFERENCES asgs_2011.state(code),
  "geom" geometry
);

CREATE TABLE asgs_2011.gccsa
(
  "code" char(5) PRIMARY KEY,
  "name" text,
  "state" smallint REFERENCES asgs_2011.state(code),
  "geom" geometry
);

CREATE TABLE asgs_2011.sa4
(
  "code" smallint PRIMARY KEY,
  "name" text,
  "gccsa" char(5) REFERENCES asgs_2011.gccsa(code),
  "state" smallint REFERENCES asgs_2011.state(code),
  "geom" geometry
);

CREATE TABLE asgs_2011.sa3
(
  "code" integer PRIMARY KEY,
  "name" text,
  "sa4" smallint REFERENCES asgs_2011.sa4(code),
  "gccsa" char(5) REFERENCES asgs_2011.gccsa(code),
  "state" smallint REFERENCES asgs_2011.state(code),
  "geom" geometry
);

CREATE TABLE asgs_2011.tr
(
  "code" char(6) PRIMARY KEY,
  "name" text,
  "geom" geometry
);

CREATE TABLE asgs_2011.sa2
(
  "code" integer PRIMARY KEY,
  "name" text,
  "sa3" integer REFERENCES asgs_2011.sa3(code),
  "sa4" smallint REFERENCES asgs_2011.sa4(code),
  "gccsa" char(5) REFERENCES asgs_2011.gccsa(code),
  "state" smallint REFERENCES asgs_2011.state(code),
  "tr" char(6) REFERENCES asgs_2011.tr(code),
  "geom" geometry
);

CREATE TABLE asgs_2011.add
(
  "code" char(3) PRIMARY KEY,
  "name" text,
  "geom" geometry
);

CREATE TABLE asgs_2011.ced
(
  "code" smallint PRIMARY KEY,
  "name" text,
  "geom" geometry
);

CREATE TABLE asgs_2011.sed
(
  "code" integer PRIMARY KEY,
  "name" text,
  "geom" geometry
);

CREATE TABLE asgs_2011.nrmr
(
  "code" smallint PRIMARY KEY,
  "name" text,
  "geom" geometry
);

CREATE TABLE asgs_2011.ssc
(
  "code" integer PRIMARY KEY,
  "name" text,
  "geom" geometry
);

CREATE TABLE asgs_2011.poa
(
  "code" smallint PRIMARY KEY,
  "name" text,
  "geom" geometry
);

CREATE TABLE asgs_2011.lga
(
  "code" integer PRIMARY KEY,
  "name" text,
  "geom" geometry
);

CREATE TABLE asgs_2011.sa1
(
  "code" bigint PRIMARY KEY,
  "sa2" integer REFERENCES asgs_2011.sa2(code),
  "sa3" integer REFERENCES asgs_2011.sa3(code),
  "sa4" smallint REFERENCES asgs_2011.sa4(code),
  "gccsa" char(5) REFERENCES asgs_2011.gccsa(code),
  "state" smallint REFERENCES asgs_2011.state(code),
  "iloc" integer REFERENCES asgs_2011.iloc(code),
  "poa" smallint REFERENCES asgs_2011.poa(code),
  "ssc" integer REFERENCES asgs_2011.ssc(code),
  "ced" smallint REFERENCES asgs_2011.ced(code),
  "sed" integer REFERENCES asgs_2011.sed(code),
  "add" char(3) REFERENCES asgs_2011.add(code),
  "nrmr" smallint REFERENCES asgs_2011.nrmr(code),
  "geom" geometry
);

CREATE TABLE asgs_2011.mb
(
  "code" bigint PRIMARY KEY,
  "cat" text,
  "sa1" bigint REFERENCES asgs_2011.sa1(code),
  "sa2" integer REFERENCES asgs_2011.sa2(code),
  "sa3" integer REFERENCES asgs_2011.sa3(code),
  "sa4" smallint REFERENCES asgs_2011.sa4(code),
  "gccsa" char(5) REFERENCES asgs_2011.gccsa(code),
  "state" smallint REFERENCES asgs_2011.state(code),
  "lga" integer REFERENCES asgs_2011.lga(code),
  "geom" geometry
);

-- Create hash index on the primary key column. Although the PostgreSQL
-- documentation discourages use of the hash index, it seems like the best
-- choice in this situation (For this data, I can only imagine one using the
-- equality operator on the primary key hence a hash is perfect).

CREATE INDEX mb_code_idx
  ON asgs_2011.mb
  USING hash
  (code);

CREATE INDEX sa1_code_idx
  ON asgs_2011.sa1
  USING hash
  (code);

CREATE INDEX sa2_code_idx
  ON asgs_2011.sa2
  USING hash
  (code);

CREATE INDEX sa3_code_idx
  ON asgs_2011.sa3
  USING hash
  (code);

CREATE INDEX sa4_code_idx
  ON asgs_2011.sa4
  USING hash
  (code);

CREATE INDEX gccsa_code_idx
  ON asgs_2011.gccsa
  USING hash
  (code);

CREATE INDEX state_code_idx
  ON asgs_2011.state
  USING hash
  (code);



CREATE INDEX iloc_code_idx
  ON asgs_2011.iloc
  USING hash
  (code);

CREATE INDEX iare_code_idx
  ON asgs_2011.iare
  USING hash
  (code);

CREATE INDEX ireg_code_idx
  ON asgs_2011.ireg
  USING hash
  (code);



CREATE INDEX tr_code_idx
  ON asgs_2011.tr
  USING hash
  (code);

CREATE INDEX poa_code_idx
  ON asgs_2011.poa
  USING hash
  (code);

CREATE INDEX ssc_code_idx
  ON asgs_2011.ssc
  USING hash
  (code);

CREATE INDEX ced_code_idx
  ON asgs_2011.ced
  USING hash
  (code);

CREATE INDEX sed_code_idx
  ON asgs_2011.sed
  USING hash
  (code);

CREATE INDEX add_code_idx
  ON asgs_2011.add
  USING hash
  (code);

CREATE INDEX nrmr_code_idx
  ON asgs_2011.nrmr
  USING hash
  (code);

CREATE INDEX lga_code_idx
  ON asgs_2011.lga
  USING hash
  (code);


-- Create GIST indexes on the geom column

CREATE INDEX mb_geom_idx
  ON asgs_2011.mb
  USING gist
  (geom);

CREATE INDEX sa1_geom_idx
  ON asgs_2011.sa1
  USING gist
  (geom);

CREATE INDEX sa2_geom_idx
  ON asgs_2011.sa2
  USING gist
  (geom);

CREATE INDEX sa3_geom_idx
  ON asgs_2011.sa3
  USING gist
  (geom);

CREATE INDEX sa4_geom_idx
  ON asgs_2011.sa4
  USING gist
  (geom);

CREATE INDEX gccsa_geom_idx
  ON asgs_2011.gccsa
  USING gist
  (geom);

CREATE INDEX state_geom_idx
  ON asgs_2011.state
  USING gist
  (geom);



CREATE INDEX iloc_geom_idx
  ON asgs_2011.iloc
  USING gist
  (geom);

CREATE INDEX iare_geom_idx
  ON asgs_2011.iare
  USING gist
  (geom);

CREATE INDEX ireg_geom_idx
  ON asgs_2011.ireg
  USING gist
  (geom);



CREATE INDEX tr_geom_idx
  ON asgs_2011.tr
  USING gist
  (geom);

CREATE INDEX poa_geom_idx
  ON asgs_2011.poa
  USING gist
  (geom);

CREATE INDEX ssc_geom_idx
  ON asgs_2011.ssc
  USING gist
  (geom);

CREATE INDEX ced_geom_idx
  ON asgs_2011.ced
  USING gist
  (geom);

CREATE INDEX sed_geom_idx
  ON asgs_2011.sed
  USING gist
  (geom);

CREATE INDEX add_geom_idx
  ON asgs_2011.add
  USING gist
  (geom);

CREATE INDEX nrmr_geom_idx
  ON asgs_2011.nrmr
  USING gist
  (geom);

CREATE INDEX lga_geom_idx
  ON asgs_2011.lga
  USING gist
  (geom);

