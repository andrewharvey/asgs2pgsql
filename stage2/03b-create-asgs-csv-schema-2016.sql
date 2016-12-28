
-- To the extent possible under law, the person who associated CC0
-- with this work has waived all copyright and related or neighboring
-- rights to this work.
-- http://creativecommons.org/publicdomain/zero/1.0/

-- This schema is partly derived from the ASGS structure.
-- http://www.abs.gov.au/websitedbs/D3310114.nsf/home/Australian+Statistical+Geography+Standard+%28ASGS%29

--
-- Now create the tables
--

-- They are created as UNLOGGED which speeds up loading data into them
-- but they are not crash-safe.

CREATE UNLOGGED TABLE asgs_2016.ste_csv
(
  "code" asgs.ste_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2016.ireg_csv
(
  "code" asgs.ireg_code PRIMARY KEY,
  "name" text,
  "ste" asgs.ste_code REFERENCES asgs_2016.ste_csv(code)
);

CREATE UNLOGGED TABLE asgs_2016.iare_csv
(
  "code" asgs.iare_code PRIMARY KEY,
  "name" text,
  "ireg" asgs.ireg_code REFERENCES asgs_2016.ireg_csv(code),
  "ste" asgs.ste_code REFERENCES asgs_2016.ste_csv(code)
);

CREATE UNLOGGED TABLE asgs_2016.iloc_csv
(
  "code" asgs.iloc_code PRIMARY KEY,
  "name" text,
  "iare" asgs.iare_code REFERENCES asgs_2016.iare_csv(code),
  "ireg" asgs.ireg_code REFERENCES asgs_2016.ireg_csv(code),
  "ste" asgs.ste_code REFERENCES asgs_2016.ste_csv(code)
);

CREATE UNLOGGED TABLE asgs_2016.gccsa_csv
(
  "code" asgs.gccsa_code PRIMARY KEY,
  "name" text,
  "ste" asgs.ste_code REFERENCES asgs_2016.ste_csv(code)
);

CREATE UNLOGGED TABLE asgs_2016.sua_csv
(
  "code" asgs.sua_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2016.sos_csv
(
  "code" asgs.sos_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2016.sosr_csv
(
  "code" asgs.sosr_code PRIMARY KEY,
  "name" text,
  "sos" asgs.sos_code REFERENCES asgs_2016.sos_csv(code)
);

CREATE UNLOGGED TABLE asgs_2016.ucl_csv
(
  "code" asgs.ucl_code PRIMARY KEY,
  "name" text,
  "sosr" asgs.sosr_code REFERENCES asgs_2016.sosr_csv(code)
);

CREATE UNLOGGED TABLE asgs_2016.sa4_csv
(
  "code" asgs.sa4_code PRIMARY KEY,
  "name" text,
  "gccsa" asgs.gccsa_code REFERENCES asgs_2016.gccsa_csv(code),
  "ste" asgs.ste_code REFERENCES asgs_2016.ste_csv(code)
);

CREATE UNLOGGED TABLE asgs_2016.sa3_csv
(
  "code" asgs.sa3_code PRIMARY KEY,
  "name" text,
  "sa4" asgs.sa4_code REFERENCES asgs_2016.sa4_csv(code),
  "gccsa" asgs.gccsa_code REFERENCES asgs_2016.gccsa_csv(code),
  "ste" asgs.ste_code REFERENCES asgs_2016.ste_csv(code)
);

CREATE UNLOGGED TABLE asgs_2016.tr_csv
(
  "code" asgs.tr_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2016.sa2_csv
(
  "code" asgs.sa2_code PRIMARY KEY,
  "name" text,
  "sa3" asgs.sa3_code REFERENCES asgs_2016.sa3_csv(code),
  "sa4" asgs.sa4_code REFERENCES asgs_2016.sa4_csv(code),
  "gccsa" asgs.gccsa_code REFERENCES asgs_2016.gccsa_csv(code),
  "ste" asgs.ste_code REFERENCES asgs_2016.ste_csv(code),
  "tr" asgs.tr_code REFERENCES asgs_2016.tr_csv(code),
  "sua" asgs.sua_code REFERENCES asgs_2016.sua_csv(code)
);

CREATE UNLOGGED TABLE asgs_2016.add_csv
(
  "code" asgs.add_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2016.ced_csv
(
  "code" asgs.ced_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2016.sed_csv
(
  "code" asgs.sed_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2016.nrmr_csv
(
  "code" asgs.nrmr_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2016.ssc_csv
(
  "code" asgs.ssc_code PRIMARY KEY,
  "name" text,
  "confidence" asgs.ssc_confidence
);

CREATE UNLOGGED TABLE asgs_2016.poa_csv
(
  "code" asgs.poa_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2016.lga_csv
(
  "code" asgs.lga_code PRIMARY KEY,
  "name" text,
  "ste" asgs.ste_code REFERENCES asgs_2016.ste_csv(code)
);

CREATE UNLOGGED TABLE asgs_2016.ra_csv
(
  "code" asgs.ra_code PRIMARY KEY,
  "name" text,
  "ste" asgs.ste_code REFERENCES asgs_2016.ste_csv(code)
);

CREATE UNLOGGED TABLE asgs_2016.sa1_csv
(
  "code" asgs.sa1_code PRIMARY KEY,
  "sa2" asgs.sa2_code REFERENCES asgs_2016.sa2_csv(code),
  "sa3" asgs.sa3_code REFERENCES asgs_2016.sa3_csv(code),
  "sa4" asgs.sa4_code REFERENCES asgs_2016.sa4_csv(code),
  "gccsa" asgs.gccsa_code REFERENCES asgs_2016.gccsa_csv(code),
  "ste" asgs.ste_code REFERENCES asgs_2016.ste_csv(code),
  "iloc" asgs.iloc_code REFERENCES asgs_2016.iloc_csv(code),
  "poa" asgs.poa_code REFERENCES asgs_2016.poa_csv(code),
  "ssc" asgs.ssc_code REFERENCES asgs_2016.ssc_csv(code),
  "ced" asgs.ced_code REFERENCES asgs_2016.ced_csv(code),
  "sed" asgs.sed_code REFERENCES asgs_2016.sed_csv(code),
  "add" asgs.add_code REFERENCES asgs_2016.add_csv(code),
  "nrmr" asgs.nrmr_code REFERENCES asgs_2016.nrmr_csv(code),
  "ucl" asgs.ucl_code REFERENCES asgs_2016.ucl_csv(code),
  "ra" asgs.ra_code REFERENCES asgs_2016.ra_csv(code)
);

CREATE UNLOGGED TABLE asgs_2016.mb_csv
(
  "code" asgs.mb_code PRIMARY KEY,
  "category" asgs.landuse,
  "sa1" asgs.sa1_code REFERENCES asgs_2016.sa1_csv(code),
  "sa2" asgs.sa2_code REFERENCES asgs_2016.sa2_csv(code),
  "sa3" asgs.sa3_code REFERENCES asgs_2016.sa3_csv(code),
  "sa4" asgs.sa4_code REFERENCES asgs_2016.sa4_csv(code),
  "gccsa" asgs.gccsa_code REFERENCES asgs_2016.gccsa_csv(code),
  "ste" asgs.ste_code REFERENCES asgs_2016.ste_csv(code),
  "lga" asgs.lga_code REFERENCES asgs_2016.lga_csv(code)
);
