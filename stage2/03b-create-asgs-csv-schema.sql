
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

CREATE UNLOGGED TABLE asgs_2011.ste_csv
(
  "code" asgs_2011.ste_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2011.ireg_csv
(
  "code" asgs_2011.ireg_code PRIMARY KEY,
  "name" text,
  "ste" asgs_2011.ste_code REFERENCES asgs_2011.ste_csv(code)
);

CREATE UNLOGGED TABLE asgs_2011.iare_csv
(
  "code" asgs_2011.iare_code PRIMARY KEY,
  "name" text,
  "ireg" asgs_2011.ireg_code REFERENCES asgs_2011.ireg_csv(code),
  "ste" asgs_2011.ste_code REFERENCES asgs_2011.ste_csv(code)
);

CREATE UNLOGGED TABLE asgs_2011.iloc_csv
(
  "code" asgs_2011.iloc_code PRIMARY KEY,
  "name" text,
  "iare" asgs_2011.iare_code REFERENCES asgs_2011.iare_csv(code),
  "ireg" asgs_2011.ireg_code REFERENCES asgs_2011.ireg_csv(code),
  "ste" asgs_2011.ste_code REFERENCES asgs_2011.ste_csv(code)
);

CREATE UNLOGGED TABLE asgs_2011.gccsa_csv
(
  "code" asgs_2011.gccsa_code PRIMARY KEY,
  "name" text,
  "ste" asgs_2011.ste_code REFERENCES asgs_2011.ste_csv(code)
);

CREATE UNLOGGED TABLE asgs_2011.sua_csv
(
  "code" asgs_2011.sua_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2011.sos_csv
(
  "code" asgs_2011.sos_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2011.sosr_csv
(
  "code" asgs_2011.sosr_code PRIMARY KEY,
  "name" text,
  "sos" asgs_2011.sos_code REFERENCES asgs_2011.sos_csv(code)
);

CREATE UNLOGGED TABLE asgs_2011.ucl_csv
(
  "code" asgs_2011.ucl_code PRIMARY KEY,
  "name" text,
  "sosr" asgs_2011.sosr_code REFERENCES asgs_2011.sosr_csv(code)
);

CREATE UNLOGGED TABLE asgs_2011.sa4_csv
(
  "code" asgs_2011.sa4_code PRIMARY KEY,
  "name" text,
  "gccsa" asgs_2011.gccsa_code REFERENCES asgs_2011.gccsa_csv(code),
  "ste" asgs_2011.ste_code REFERENCES asgs_2011.ste_csv(code)
);

CREATE UNLOGGED TABLE asgs_2011.sa3_csv
(
  "code" asgs_2011.sa3_code PRIMARY KEY,
  "name" text,
  "sa4" asgs_2011.sa4_code REFERENCES asgs_2011.sa4_csv(code),
  "gccsa" asgs_2011.gccsa_code REFERENCES asgs_2011.gccsa_csv(code),
  "ste" asgs_2011.ste_code REFERENCES asgs_2011.ste_csv(code)
);

CREATE UNLOGGED TABLE asgs_2011.tr_csv
(
  "code" asgs_2011.tr_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2011.sa2_csv
(
  "code" asgs_2011.sa2_code PRIMARY KEY,
  "name" text,
  "sa3" asgs_2011.sa3_code REFERENCES asgs_2011.sa3_csv(code),
  "sa4" asgs_2011.sa4_code REFERENCES asgs_2011.sa4_csv(code),
  "gccsa" asgs_2011.gccsa_code REFERENCES asgs_2011.gccsa_csv(code),
  "ste" asgs_2011.ste_code REFERENCES asgs_2011.ste_csv(code),
  "tr" asgs_2011.tr_code REFERENCES asgs_2011.tr_csv(code),
  "sua" asgs_2011.sua_code REFERENCES asgs_2011.sua_csv(code)
);

CREATE UNLOGGED TABLE asgs_2011.add_csv
(
  "code" asgs_2011.add_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2011.ced_csv
(
  "code" asgs_2011.ced_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2011.sed_csv
(
  "code" asgs_2011.sed_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2011.nrmr_csv
(
  "code" asgs_2011.nrmr_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2011.ssc_csv
(
  "code" asgs_2011.ssc_code PRIMARY KEY,
  "name" text,
  "confidence" asgs_2011.ssc_confidence
);

CREATE UNLOGGED TABLE asgs_2011.poa_csv
(
  "code" asgs_2011.poa_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2011.lga_csv
(
  "code" asgs_2011.lga_code PRIMARY KEY,
  "name" text,
  "ste" asgs_2011.ste_code REFERENCES asgs_2011.ste_csv(code)
);

CREATE UNLOGGED TABLE asgs_2011.sa1_csv
(
  "code" asgs_2011.sa1_code PRIMARY KEY,
  "sa2" asgs_2011.sa2_code REFERENCES asgs_2011.sa2_csv(code),
  "sa3" asgs_2011.sa3_code REFERENCES asgs_2011.sa3_csv(code),
  "sa4" asgs_2011.sa4_code REFERENCES asgs_2011.sa4_csv(code),
  "gccsa" asgs_2011.gccsa_code REFERENCES asgs_2011.gccsa_csv(code),
  "ste" asgs_2011.ste_code REFERENCES asgs_2011.ste_csv(code),
  "iloc" asgs_2011.iloc_code REFERENCES asgs_2011.iloc_csv(code),
  "poa" asgs_2011.poa_code REFERENCES asgs_2011.poa_csv(code),
  "ssc" asgs_2011.ssc_code REFERENCES asgs_2011.ssc_csv(code),
  "ced" asgs_2011.ced_code REFERENCES asgs_2011.ced_csv(code),
  "sed" asgs_2011.sed_code REFERENCES asgs_2011.sed_csv(code),
  "add" asgs_2011.add_code REFERENCES asgs_2011.add_csv(code),
  "nrmr" asgs_2011.nrmr_code REFERENCES asgs_2011.nrmr_csv(code),
  "ucl" asgs_2011.ucl_code REFERENCES asgs_2011.ucl_csv(code)
);

CREATE UNLOGGED TABLE asgs_2011.mb_csv
(
  "code" asgs_2011.mb_code PRIMARY KEY,
  "category" asgs_2011.landuse,
  "sa1" asgs_2011.sa1_code REFERENCES asgs_2011.sa1_csv(code),
  "sa2" asgs_2011.sa2_code REFERENCES asgs_2011.sa2_csv(code),
  "sa3" asgs_2011.sa3_code REFERENCES asgs_2011.sa3_csv(code),
  "sa4" asgs_2011.sa4_code REFERENCES asgs_2011.sa4_csv(code),
  "gccsa" asgs_2011.gccsa_code REFERENCES asgs_2011.gccsa_csv(code),
  "ste" asgs_2011.ste_code REFERENCES asgs_2011.ste_csv(code),
  "lga" asgs_2011.lga_code REFERENCES asgs_2011.lga_csv(code)
);
