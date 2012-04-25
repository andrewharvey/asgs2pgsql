-- create new tables with generalised geometries
CREATE TABLE asgs_2011.state_$i
(
  "code" smallint PRIMARY KEY REFERENCES asgs_2011.state(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'state_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.state_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.state
);

CREATE TABLE asgs_2011.ireg_$i
(
  "code" smallint PRIMARY KEY REFERENCES asgs_2011.ireg(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'ireg_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.ireg_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.ireg
);

CREATE TABLE asgs_2011.iare_$i
(
  "code" integer PRIMARY KEY REFERENCES asgs_2011.iare(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'iare_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.iare_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.iare
);


CREATE TABLE asgs_2011.iloc_$i
(
  "code" integer PRIMARY KEY REFERENCES asgs_2011.iloc(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'iloc_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.iloc_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.iloc
);

CREATE TABLE asgs_2011.gccsa_$i
(
  "code" char(5) PRIMARY KEY REFERENCES asgs_2011.gccsa(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'gccsa_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.gccsa_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.gccsa
);

CREATE TABLE asgs_2011.sa4_$i
(
  "code" smallint PRIMARY KEY REFERENCES asgs_2011.sa4(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'sa4_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.sa4_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.sa4
);

CREATE TABLE asgs_2011.sa3_$i
(
  "code" integer PRIMARY KEY REFERENCES asgs_2011.sa3(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'sa3_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.sa3_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.sa3
);

CREATE TABLE asgs_2011.tr_$i
(
  "code" char(6) PRIMARY KEY REFERENCES asgs_2011.tr(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'tr_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.tr_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.tr
);

CREATE TABLE asgs_2011.sa2_$i
(
  "code" integer PRIMARY KEY REFERENCES asgs_2011.sa2(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'sa2_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.sa2_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.sa2
);

CREATE TABLE asgs_2011.add_$i
(
  "code" char(3) PRIMARY KEY REFERENCES asgs_2011.add(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'add_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.add_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.add
);

CREATE TABLE asgs_2011.ced_$i
(
  "code" smallint PRIMARY KEY REFERENCES asgs_2011.ced(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'ced_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.ced_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.ced
);

CREATE TABLE asgs_2011.sed_$i
(
  "code" integer PRIMARY KEY REFERENCES asgs_2011.sed(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'sed_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.sed_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.sed
);

CREATE TABLE asgs_2011.nrmr_$i
(
  "code" smallint PRIMARY KEY REFERENCES asgs_2011.nrmr(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'nrmr_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.nrmr_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.nrmr
);

CREATE TABLE asgs_2011.ssc_$i
(
  "code" integer PRIMARY KEY REFERENCES asgs_2011.ssc(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'ssc_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.ssc_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.ssc
);

CREATE TABLE asgs_2011.poa_$i
(
  "code" smallint PRIMARY KEY REFERENCES asgs_2011.poa(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'poa_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.poa_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.poa
);

CREATE TABLE asgs_2011.lga_$i
(
  "code" integer PRIMARY KEY REFERENCES asgs_2011.lga(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'lga_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.lga_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.lga
);

CREATE TABLE asgs_2011.sa1_$i
(
  "code" bigint PRIMARY KEY REFERENCES asgs_2011.sa1(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'sa1_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.sa1_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.sa1
);

CREATE TABLE asgs_2011.mb_$i
(
  "code" bigint PRIMARY KEY REFERENCES asgs_2011.mb(code),
  "geom" geometry
);

-- SELECT AddGeometryColumn('asgs_2011', 'mb_$i', 'geom', 1, 'MULTIPOLYGON', 2);

INSERT INTO asgs_2011.mb_$i (
  SELECT
    code,
    ST_SimplifyPreserveTopology(geom, $i) as geom
  FROM asgs_2011.mb
);

-- create index on geom
CREATE INDEX mb_$i_geom_idx
  ON asgs_2011.mb_$i
  USING gist
  (geom);

CREATE INDEX sa1_$i_geom_idx
  ON asgs_2011.sa1_$i
  USING gist
  (geom);

CREATE INDEX sa2_$i_geom_idx
  ON asgs_2011.sa2_$i
  USING gist
  (geom);

CREATE INDEX sa3_$i_geom_idx
  ON asgs_2011.sa3_$i
  USING gist
  (geom);

CREATE INDEX sa4_$i_geom_idx
  ON asgs_2011.sa4_$i
  USING gist
  (geom);

CREATE INDEX gccsa_$i_geom_idx
  ON asgs_2011.gccsa_$i
  USING gist
  (geom);

CREATE INDEX state_$i_geom_idx
  ON asgs_2011.state_$i
  USING gist
  (geom);



CREATE INDEX iloc_$i_geom_idx
  ON asgs_2011.iloc_$i
  USING gist
  (geom);

CREATE INDEX iare_$i_geom_idx
  ON asgs_2011.iare_$i
  USING gist
  (geom);

CREATE INDEX ireg_$i_geom_idx
  ON asgs_2011.ireg_$i
  USING gist
  (geom);



CREATE INDEX tr_$i_geom_idx
  ON asgs_2011.tr_$i
  USING gist
  (geom);

CREATE INDEX poa_$i_geom_idx
  ON asgs_2011.poa_$i
  USING gist
  (geom);

CREATE INDEX ssc_$i_geom_idx
  ON asgs_2011.ssc_$i
  USING gist
  (geom);

CREATE INDEX ced_$i_geom_idx
  ON asgs_2011.ced_$i
  USING gist
  (geom);

CREATE INDEX sed_$i_geom_idx
  ON asgs_2011.sed_$i
  USING gist
  (geom);

CREATE INDEX add_$i_geom_idx
  ON asgs_2011.add_$i
  USING gist
  (geom);

CREATE INDEX nrmr_$i_geom_idx
  ON asgs_2011.nrmr_$i
  USING gist
  (geom);

CREATE INDEX lga_$i_geom_idx
  ON asgs_2011.lga_$i
  USING gist
  (geom);

-- update geometry_columns
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'mb_$i', 'geom', '2', '1', 'MULTIPOLYGON');
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'sa1_$i', 'geom', '2', '1', 'MULTIPOLYGON');
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'sa2_$i', 'geom', '2', '1', 'MULTIPOLYGON');
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'sa3_$i', 'geom', '2', '1', 'MULTIPOLYGON');
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'sa4_$i', 'geom', '2', '1', 'MULTIPOLYGON');
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'gccsa_$i', 'geom', '2', '1', 'MULTIPOLYGON');
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'state_$i', 'geom', '2', '1', 'MULTIPOLYGON');
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'iloc_$i', 'geom', '2', '1', 'MULTIPOLYGON');
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'iare_$i', 'geom', '2', '1', 'MULTIPOLYGON');
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'ireg_$i', 'geom', '2', '1', 'MULTIPOLYGON');
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'tr_$i', 'geom', '2', '1', 'MULTIPOLYGON');
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'poa_$i', 'geom', '2', '1', 'MULTIPOLYGON');
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'ssc_$i', 'geom', '2', '1', 'MULTIPOLYGON');
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'ced_$i', 'geom', '2', '1', 'MULTIPOLYGON');
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'sed_$i', 'geom', '2', '1', 'MULTIPOLYGON');
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'add_$i', 'geom', '2', '1', 'MULTIPOLYGON');
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'nrmr_$i', 'geom', '2', '1', 'MULTIPOLYGON');
INSERT INTO geometry_columns VALUES ('', 'asgs_2011', 'lga_$i', 'geom', '2', '1', 'MULTIPOLYGON');

