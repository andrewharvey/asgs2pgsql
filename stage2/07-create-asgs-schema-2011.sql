
-- To the extent possible under law, the person who associated CC0
-- with this work has waived all copyright and related or neighboring
-- rights to this work.
-- http://creativecommons.org/publicdomain/zero/1.0/

-- This schema is partly derived from the ASGS structure.
-- http://www.abs.gov.au/websitedbs/D3310114.nsf/home/Australian+Statistical+Geography+Standard+%28ASGS%29


CREATE TABLE asgs_2011.ste AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.ste_csv csv LEFT JOIN asgs_2011.ste_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.ireg AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.ireg_csv csv LEFT JOIN asgs_2011.ireg_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.iare AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.iare_csv csv LEFT JOIN asgs_2011.iare_ogr ogr USING (code)
);


CREATE TABLE asgs_2011.iloc AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.iloc_csv csv LEFT JOIN asgs_2011.iloc_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.gccsa AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.gccsa_csv csv LEFT JOIN asgs_2011.gccsa_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.sa4 AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.sa4_csv csv LEFT JOIN asgs_2011.sa4_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.sa3 AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.sa3_csv csv LEFT JOIN asgs_2011.sa3_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.tr AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.tr_csv csv LEFT JOIN asgs_2011.tr_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.sa2 AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.sa2_csv csv LEFT JOIN asgs_2011.sa2_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.add AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.add_csv csv LEFT JOIN asgs_2011.add_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.ced AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.ced_csv csv LEFT JOIN asgs_2011.ced_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.sed AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.sed_csv csv LEFT JOIN asgs_2011.sed_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.nrmr AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.nrmr_csv csv LEFT JOIN asgs_2011.nrmr_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.ssc AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.ssc_csv csv LEFT JOIN asgs_2011.ssc_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.poa AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.poa_csv csv LEFT JOIN asgs_2011.poa_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.lga AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.lga_csv csv LEFT JOIN asgs_2011.lga_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.sa1 AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.sa1_csv csv LEFT JOIN asgs_2011.sa1_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.mb AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.mb_csv csv LEFT JOIN asgs_2011.mb_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.sua AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.sua_csv csv LEFT JOIN asgs_2011.sua_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.ucl AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.ucl_csv csv LEFT JOIN asgs_2011.ucl_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.sosr AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.sosr_csv csv LEFT JOIN asgs_2011.sosr_ogr ogr USING (code)
);

CREATE TABLE asgs_2011.sos AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2011.sos_csv csv LEFT JOIN asgs_2011.sos_ogr ogr USING (code)
);

-- Set primary key constraints

ALTER TABLE asgs_2011.ste
  ADD CONSTRAINT ste_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.ireg
  ADD CONSTRAINT ireg_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.iare
  ADD CONSTRAINT iare_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.iloc
  ADD CONSTRAINT iloc_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.gccsa
  ADD CONSTRAINT gccsa_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.sa4
  ADD CONSTRAINT sa4_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.sa3
  ADD CONSTRAINT sa3_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.tr
  ADD CONSTRAINT tr_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.sa2
  ADD CONSTRAINT sa2_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.add
  ADD CONSTRAINT add_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.ced
  ADD CONSTRAINT ced_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.sed
  ADD CONSTRAINT sed_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.nrmr
  ADD CONSTRAINT nrmr_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.ssc
  ADD CONSTRAINT ssc_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.poa
  ADD CONSTRAINT poa_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.lga
  ADD CONSTRAINT lga_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.sa1
  ADD CONSTRAINT sa1_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.mb
  ADD CONSTRAINT mb_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.sua
  ADD CONSTRAINT sua_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.ucl
  ADD CONSTRAINT ucl_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.sosr
  ADD CONSTRAINT sosr_pkey PRIMARY KEY (code),
  SET WITH OIDS;

ALTER TABLE asgs_2011.sos
  ADD CONSTRAINT sos_pkey PRIMARY KEY (code),
  SET WITH OIDS;



-- Set foreign key constraints
ALTER TABLE asgs_2011.ireg
  ADD CONSTRAINT ireg_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2011.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE asgs_2011.iare
  ADD CONSTRAINT iare_ireg_fkey FOREIGN KEY (ireg)
    REFERENCES asgs_2011.ireg (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT iare_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2011.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE asgs_2011.iloc
  ADD CONSTRAINT iloc_iare_fkey FOREIGN KEY (iare)
    REFERENCES asgs_2011.iare (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT iloc_ireg_fkey FOREIGN KEY (ireg)
    REFERENCES asgs_2011.ireg (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT iloc_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2011.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE asgs_2011.gccsa
  ADD CONSTRAINT gccsa_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2011.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE asgs_2011.sa4
  ADD CONSTRAINT sa4_gccsa_fkey FOREIGN KEY (gccsa)
    REFERENCES asgs_2011.gccsa (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa4_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2011.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE asgs_2011.sa3
  ADD CONSTRAINT sa3_sa4_fkey FOREIGN KEY (sa4)
    REFERENCES asgs_2011.sa4 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa3_gccsa_fkey FOREIGN KEY (gccsa)
    REFERENCES asgs_2011.gccsa (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa3_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2011.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE asgs_2011.sa2
  ADD CONSTRAINT sa2_sa3_fkey FOREIGN KEY (sa3)
    REFERENCES asgs_2011.sa3 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa2_sa4_fkey FOREIGN KEY (sa4)
    REFERENCES asgs_2011.sa4 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa2_gccsa_fkey FOREIGN KEY (gccsa)
    REFERENCES asgs_2011.gccsa (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa2_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2011.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa2_tr_fkey FOREIGN KEY (tr)
    REFERENCES asgs_2011.tr (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa4_sua_fkey FOREIGN KEY (sua)
    REFERENCES asgs_2011.sua (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE asgs_2011.lga
  ADD CONSTRAINT lga_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2011.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE asgs_2011.sa1
  ADD CONSTRAINT sa1_sa2_fkey FOREIGN KEY (sa2)
    REFERENCES asgs_2011.sa2 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,  
  ADD CONSTRAINT sa1_sa3_fkey FOREIGN KEY (sa3)
    REFERENCES asgs_2011.sa3 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_sa4_fkey FOREIGN KEY (sa4)
    REFERENCES asgs_2011.sa4 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_gccsa_fkey FOREIGN KEY (gccsa)
    REFERENCES asgs_2011.gccsa (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2011.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_iloc_fkey FOREIGN KEY (iloc)
    REFERENCES asgs_2011.iloc (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_poa_fkey FOREIGN KEY (poa)
    REFERENCES asgs_2011.poa (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_ssc_fkey FOREIGN KEY (ssc)
    REFERENCES asgs_2011.ssc (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_ced_fkey FOREIGN KEY (ced)
    REFERENCES asgs_2011.ced (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_sed_fkey FOREIGN KEY (sed)
    REFERENCES asgs_2011.sed (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_add_fkey FOREIGN KEY (add)
    REFERENCES asgs_2011.add (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_nrmr_fkey FOREIGN KEY (nrmr)
    REFERENCES asgs_2011.nrmr (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT sa1_ucl_fkey FOREIGN KEY (ucl)
    REFERENCES asgs_2011.ucl (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE asgs_2011.mb
  ADD CONSTRAINT mb_sa1_fkey FOREIGN KEY (sa1)
    REFERENCES asgs_2011.sa1 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,  
  ADD CONSTRAINT mb_sa2_fkey FOREIGN KEY (sa2)
    REFERENCES asgs_2011.sa2 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,  
  ADD CONSTRAINT mb_sa3_fkey FOREIGN KEY (sa3)
    REFERENCES asgs_2011.sa3 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT mb_sa4_fkey FOREIGN KEY (sa4)
    REFERENCES asgs_2011.sa4 (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT mb_gccsa_fkey FOREIGN KEY (gccsa)
    REFERENCES asgs_2011.gccsa (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT mb_ste_fkey FOREIGN KEY (ste)
    REFERENCES asgs_2011.ste (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT mb_lga_fkey FOREIGN KEY (lga)
    REFERENCES asgs_2011.lga (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE asgs_2011.sosr
  ADD CONSTRAINT sosr_sos_fkey FOREIGN KEY (sos)
    REFERENCES asgs_2011.sos (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


ALTER TABLE asgs_2011.ucl
  ADD CONSTRAINT ucl_sosr_fkey FOREIGN KEY (sosr)
    REFERENCES asgs_2011.sosr (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;


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

CREATE INDEX ste_geom_idx
  ON asgs_2011.ste
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

