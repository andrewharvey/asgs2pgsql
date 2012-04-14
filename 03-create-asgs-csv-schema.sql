
-- To the extent possible under law, the person who associated CC0
-- with this work has waived all copyright and related or neighboring
-- rights to this work.
-- http://creativecommons.org/publicdomain/zero/1.0/

-- This schema is partly derived from the ASGS structure.
-- http://www.abs.gov.au/websitedbs/D3310114.nsf/home/Australian+Statistical+Geography+Standard+%28ASGS%29

DROP SCHEMA asgs_2011 CASCADE;

CREATE SCHEMA asgs_2011;

CREATE TABLE asgs_2011.state_csv
(
  "code" smallint PRIMARY KEY,
  "name" text
);

CREATE TABLE asgs_2011.ireg_csv
(
  "code" smallint PRIMARY KEY,
  "name" text,
  "state" smallint REFERENCES asgs_2011.state_csv(code)
);

CREATE TABLE asgs_2011.iare_csv
(
  "code" integer PRIMARY KEY,
  "name" text,
  "ireg" smallint REFERENCES asgs_2011.ireg_csv(code),
  "state" smallint REFERENCES asgs_2011.state_csv(code)
);


CREATE TABLE asgs_2011.iloc_csv
(
  "code" integer PRIMARY KEY,
  "name" text,
  "iare" integer REFERENCES asgs_2011.iare_csv(code),
  "ireg" smallint REFERENCES asgs_2011.ireg_csv(code),
  "state" smallint REFERENCES asgs_2011.state_csv(code)
);

CREATE TABLE asgs_2011.gccsa_csv
(
  "code" char(5) PRIMARY KEY,
  "name" text,
  "state" smallint REFERENCES asgs_2011.state_csv(code)
);

CREATE TABLE asgs_2011.sa4_csv
(
  "code" smallint PRIMARY KEY,
  "name" text,
  "gccsa" char(5) REFERENCES asgs_2011.gccsa_csv(code),
  "state" smallint REFERENCES asgs_2011.state_csv(code)
);

CREATE TABLE asgs_2011.sa3_csv
(
  "code" integer PRIMARY KEY,
  "name" text,
  "sa4" smallint REFERENCES asgs_2011.sa4_csv(code),
  "gccsa" char(5) REFERENCES asgs_2011.gccsa_csv(code),
  "state" smallint REFERENCES asgs_2011.state_csv(code)
);

CREATE TABLE asgs_2011.tr_csv
(
  "code" char(6) PRIMARY KEY,
  "name" text
);

CREATE TABLE asgs_2011.sa2_csv
(
  "code" integer PRIMARY KEY,
  "name" text,
  "sa3" integer REFERENCES asgs_2011.sa3_csv(code),
  "sa4" smallint REFERENCES asgs_2011.sa4_csv(code),
  "gccsa" char(5) REFERENCES asgs_2011.gccsa_csv(code),
  "state" smallint REFERENCES asgs_2011.state_csv(code),
  "tr" char(6) REFERENCES asgs_2011.tr_csv(code)
);

CREATE TABLE asgs_2011.add_csv
(
  "code" char(3) PRIMARY KEY,
  "name" text
);

CREATE TABLE asgs_2011.ced_csv
(
  "code" smallint PRIMARY KEY,
  "name" text
);

CREATE TABLE asgs_2011.sed_csv
(
  "code" integer PRIMARY KEY,
  "name" text
);

CREATE TABLE asgs_2011.nrmr_csv
(
  "code" smallint PRIMARY KEY,
  "name" text
);

CREATE TABLE asgs_2011.ssc_csv
(
  "code" integer PRIMARY KEY,
  "name" text
);

CREATE TABLE asgs_2011.poa_csv
(
  "code" smallint PRIMARY KEY,
  "name" text
);

CREATE TABLE asgs_2011.lga_csv
(
  "code" integer PRIMARY KEY,
  "name" text
);

CREATE TABLE asgs_2011.sa1_csv
(
  "code" bigint PRIMARY KEY,
  "sa2" integer REFERENCES asgs_2011.sa2_csv(code),
  "sa3" integer REFERENCES asgs_2011.sa3_csv(code),
  "sa4" smallint REFERENCES asgs_2011.sa4_csv(code),
  "gccsa" char(5) REFERENCES asgs_2011.gccsa_csv(code),
  "state" smallint REFERENCES asgs_2011.state_csv(code),
  "iloc" integer REFERENCES asgs_2011.iloc_csv(code),
  "poa" smallint REFERENCES asgs_2011.poa_csv(code),
  "ssc" integer REFERENCES asgs_2011.ssc_csv(code),
  "ced" smallint REFERENCES asgs_2011.ced_csv(code),
  "sed" integer REFERENCES asgs_2011.sed_csv(code),
  "add" char(3) REFERENCES asgs_2011.add_csv(code),
  "nrmr" smallint REFERENCES asgs_2011.nrmr_csv(code)
);

CREATE TABLE asgs_2011.mb_csv
(
  "code" bigint PRIMARY KEY,
  "cat" text,
  "sa1" bigint REFERENCES asgs_2011.sa1_csv(code),
  "sa2" integer REFERENCES asgs_2011.sa2_csv(code),
  "sa3" integer REFERENCES asgs_2011.sa3_csv(code),
  "sa4" smallint REFERENCES asgs_2011.sa4_csv(code),
  "gccsa" char(5) REFERENCES asgs_2011.gccsa_csv(code),
  "state" smallint REFERENCES asgs_2011.state_csv(code),
  "lga" integer REFERENCES asgs_2011.lga_csv(code)
);

