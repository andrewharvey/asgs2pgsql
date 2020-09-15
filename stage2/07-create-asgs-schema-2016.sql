
-- To the extent possible under law, the person who associated CC0
-- with this work has waived all copyright and related or neighboring
-- rights to this work.
-- http://creativecommons.org/publicdomain/zero/1.0/

-- This schema is partly derived from the ASGS structure.
-- http://www.abs.gov.au/websitedbs/D3310114.nsf/home/Australian+Statistical+Geography+Standard+%28ASGS%29


CREATE TABLE asgs_2016.ste AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.ste_csv csv LEFT JOIN asgs_2016.ste_ogr ogr USING (code)
);

CREATE TABLE asgs_2016.ireg AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.ireg_csv csv LEFT JOIN asgs_2016.ireg_ogr ogr USING (code)
);

CREATE TABLE asgs_2016.iare AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.iare_csv csv LEFT JOIN asgs_2016.iare_ogr ogr USING (code)
);


CREATE TABLE asgs_2016.iloc AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.iloc_csv csv LEFT JOIN asgs_2016.iloc_ogr ogr USING (code)
);

CREATE TABLE asgs_2016.gccsa AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.gccsa_csv csv LEFT JOIN asgs_2016.gccsa_ogr ogr USING (code)
);

CREATE TABLE asgs_2016.sa4 AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.sa4_csv csv LEFT JOIN asgs_2016.sa4_ogr ogr USING (code)
);

CREATE TABLE asgs_2016.sa3 AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.sa3_csv csv LEFT JOIN asgs_2016.sa3_ogr ogr USING (code)
);

CREATE TABLE asgs_2016.tr AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.tr_csv csv LEFT JOIN asgs_2016.tr_ogr ogr USING (code)
);

CREATE TABLE asgs_2016.sa2 AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.sa2_csv csv LEFT JOIN asgs_2016.sa2_ogr ogr USING (code)
);

CREATE TABLE asgs_2016.add AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.add_csv csv LEFT JOIN asgs_2016.add_ogr ogr USING (code)
);

CREATE TABLE asgs_2016.ced AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.ced_csv csv LEFT JOIN asgs_2016.ced_ogr ogr USING (code)
);

CREATE TABLE asgs_2016.sed AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.sed_csv csv LEFT JOIN asgs_2016.sed_ogr ogr USING (code)
);

CREATE TABLE asgs_2016.nrmr AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.nrmr_csv csv LEFT JOIN asgs_2016.nrmr_ogr ogr USING (code)
);

CREATE TABLE asgs_2016.ssc AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.ssc_csv csv LEFT JOIN asgs_2016.ssc_ogr ogr USING (code)
);

CREATE TABLE asgs_2016.poa AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.poa_csv csv LEFT JOIN asgs_2016.poa_ogr ogr USING (code)
);

CREATE TABLE asgs_2016.lga AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.lga_csv csv LEFT JOIN asgs_2016.lga_ogr ogr USING (code)
);

CREATE TABLE asgs_2016.sa1 AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.sa1_csv csv LEFT JOIN asgs_2016.sa1_ogr ogr USING (code)
);

CREATE TABLE asgs_2016.mb AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2016.mb_csv csv LEFT JOIN asgs_2016.mb_ogr ogr USING (code)
);

-- Set primary key constraints

ALTER TABLE IF EXISTS asgs_2016.ste
  ADD CONSTRAINT ste_pkey PRIMARY KEY (code);

ALTER TABLE IF EXISTS asgs_2016.ireg
  ADD CONSTRAINT ireg_pkey PRIMARY KEY (code);

ALTER TABLE IF EXISTS asgs_2016.iare
  ADD CONSTRAINT iare_pkey PRIMARY KEY (code);

ALTER TABLE IF EXISTS asgs_2016.iloc
  ADD CONSTRAINT iloc_pkey PRIMARY KEY (code);

ALTER TABLE IF EXISTS asgs_2016.gccsa
  ADD CONSTRAINT gccsa_pkey PRIMARY KEY (code);

ALTER TABLE IF EXISTS asgs_2016.sa4
  ADD CONSTRAINT sa4_pkey PRIMARY KEY (code);

ALTER TABLE IF EXISTS asgs_2016.sa3
  ADD CONSTRAINT sa3_pkey PRIMARY KEY (code);

ALTER TABLE IF EXISTS asgs_2016.tr
  ADD CONSTRAINT tr_pkey PRIMARY KEY (code);

ALTER TABLE IF EXISTS asgs_2016.sa2
  ADD CONSTRAINT sa2_pkey PRIMARY KEY (code);

ALTER TABLE IF EXISTS asgs_2016.add
  ADD CONSTRAINT add_pkey PRIMARY KEY (code);

ALTER TABLE IF EXISTS asgs_2016.ced
  ADD CONSTRAINT ced_pkey PRIMARY KEY (code);

ALTER TABLE IF EXISTS asgs_2016.sed
  ADD CONSTRAINT sed_pkey PRIMARY KEY (code);

ALTER TABLE IF EXISTS asgs_2016.nrmr
  ADD CONSTRAINT nrmr_pkey PRIMARY KEY (code);

ALTER TABLE IF EXISTS asgs_2016.ssc
  ADD CONSTRAINT ssc_pkey PRIMARY KEY (code);

ALTER TABLE IF EXISTS asgs_2016.poa
  ADD CONSTRAINT poa_pkey PRIMARY KEY (code);

ALTER TABLE IF EXISTS asgs_2016.lga
  ADD CONSTRAINT lga_pkey PRIMARY KEY (code);

ALTER TABLE IF EXISTS asgs_2016.sa1
  ADD CONSTRAINT sa1_pkey PRIMARY KEY (code);

ALTER TABLE IF EXISTS asgs_2016.mb
  ADD CONSTRAINT mb_pkey PRIMARY KEY (code);

-- Set foreign key constraints
ALTER TABLE IF EXISTS asgs_2016.ireg
  ADD CONSTRAINT ireg_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2016.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE IF EXISTS asgs_2016.iare
  ADD CONSTRAINT iare_ireg_fkey FOREIGN KEY (ireg)
    REFERENCES asgs_2016.ireg (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT iare_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2016.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE IF EXISTS asgs_2016.iloc
  ADD CONSTRAINT iloc_iare_fkey FOREIGN KEY (iare)
    REFERENCES asgs_2016.iare (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT iloc_ireg_fkey FOREIGN KEY (ireg)
    REFERENCES asgs_2016.ireg (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT iloc_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2016.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE IF EXISTS asgs_2016.gccsa
  ADD CONSTRAINT gccsa_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2016.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE IF EXISTS asgs_2016.sa4
  ADD CONSTRAINT sa4_gccsa_fkey FOREIGN KEY (gccsa)
    REFERENCES asgs_2016.gccsa (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa4_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2016.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE IF EXISTS asgs_2016.sa3
  ADD CONSTRAINT sa3_sa4_fkey FOREIGN KEY (sa4)
    REFERENCES asgs_2016.sa4 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa3_gccsa_fkey FOREIGN KEY (gccsa)
    REFERENCES asgs_2016.gccsa (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa3_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2016.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE IF EXISTS asgs_2016.sa2
  ADD CONSTRAINT sa2_sa3_fkey FOREIGN KEY (sa3)
    REFERENCES asgs_2016.sa3 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa2_sa4_fkey FOREIGN KEY (sa4)
    REFERENCES asgs_2016.sa4 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa2_gccsa_fkey FOREIGN KEY (gccsa)
    REFERENCES asgs_2016.gccsa (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa2_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2016.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa2_tr_fkey FOREIGN KEY (tr)
    REFERENCES asgs_2016.tr (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE IF EXISTS asgs_2016.lga
  ADD CONSTRAINT lga_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2016.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE IF EXISTS asgs_2016.sa1
  ADD CONSTRAINT sa1_sa2_fkey FOREIGN KEY (sa2)
    REFERENCES asgs_2016.sa2 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,  
  ADD CONSTRAINT sa1_sa3_fkey FOREIGN KEY (sa3)
    REFERENCES asgs_2016.sa3 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_sa4_fkey FOREIGN KEY (sa4)
    REFERENCES asgs_2016.sa4 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_gccsa_fkey FOREIGN KEY (gccsa)
    REFERENCES asgs_2016.gccsa (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2016.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_iloc_fkey FOREIGN KEY (iloc)
    REFERENCES asgs_2016.iloc (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_poa_fkey FOREIGN KEY (poa)
    REFERENCES asgs_2016.poa (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_ssc_fkey FOREIGN KEY (ssc)
    REFERENCES asgs_2016.ssc (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_ced_fkey FOREIGN KEY (ced)
    REFERENCES asgs_2016.ced (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_sed_fkey FOREIGN KEY (sed)
    REFERENCES asgs_2016.sed (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_add_fkey FOREIGN KEY (add)
    REFERENCES asgs_2016.add (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_nrmr_fkey FOREIGN KEY (nrmr)
    REFERENCES asgs_2016.nrmr (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE IF EXISTS asgs_2016.mb
  ADD CONSTRAINT mb_sa1_fkey FOREIGN KEY (sa1)
    REFERENCES asgs_2016.sa1 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,  
  ADD CONSTRAINT mb_sa2_fkey FOREIGN KEY (sa2)
    REFERENCES asgs_2016.sa2 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,  
  ADD CONSTRAINT mb_sa3_fkey FOREIGN KEY (sa3)
    REFERENCES asgs_2016.sa3 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT mb_sa4_fkey FOREIGN KEY (sa4)
    REFERENCES asgs_2016.sa4 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT mb_gccsa_fkey FOREIGN KEY (gccsa)
    REFERENCES asgs_2016.gccsa (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT mb_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2016.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT mb_lga_fkey FOREIGN KEY (lga)
    REFERENCES asgs_2016.lga (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


-- Create GIST indexes on the geom column

CREATE INDEX mb_geom_idx
  ON asgs_2016.mb
  USING gist
  (geom);

CREATE INDEX sa1_geom_idx
  ON asgs_2016.sa1
  USING gist
  (geom);

CREATE INDEX sa2_geom_idx
  ON asgs_2016.sa2
  USING gist
  (geom);

CREATE INDEX sa3_geom_idx
  ON asgs_2016.sa3
  USING gist
  (geom);

CREATE INDEX sa4_geom_idx
  ON asgs_2016.sa4
  USING gist
  (geom);

CREATE INDEX gccsa_geom_idx
  ON asgs_2016.gccsa
  USING gist
  (geom);

CREATE INDEX ste_geom_idx
  ON asgs_2016.ste
  USING gist
  (geom);



CREATE INDEX iloc_geom_idx
  ON asgs_2016.iloc
  USING gist
  (geom);

CREATE INDEX iare_geom_idx
  ON asgs_2016.iare
  USING gist
  (geom);

CREATE INDEX ireg_geom_idx
  ON asgs_2016.ireg
  USING gist
  (geom);



CREATE INDEX tr_geom_idx
  ON asgs_2016.tr
  USING gist
  (geom);

CREATE INDEX poa_geom_idx
  ON asgs_2016.poa
  USING gist
  (geom);

CREATE INDEX ssc_geom_idx
  ON asgs_2016.ssc
  USING gist
  (geom);

CREATE INDEX ced_geom_idx
  ON asgs_2016.ced
  USING gist
  (geom);

CREATE INDEX sed_geom_idx
  ON asgs_2016.sed
  USING gist
  (geom);

CREATE INDEX add_geom_idx
  ON asgs_2016.add
  USING gist
  (geom);

CREATE INDEX nrmr_geom_idx
  ON asgs_2016.nrmr
  USING gist
  (geom);

CREATE INDEX lga_geom_idx
  ON asgs_2016.lga
  USING gist
  (geom);

