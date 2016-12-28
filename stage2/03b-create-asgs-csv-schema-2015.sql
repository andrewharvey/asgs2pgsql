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

CREATE UNLOGGED TABLE asgs_2015.tr_csv
(
  "code" asgs.tr_code PRIMARY KEY,
  "name" text
);

CREATE UNLOGGED TABLE asgs_2015.lga_csv
(
  "code" asgs.lga_code PRIMARY KEY,
  "name" text,
  "ste" asgs.ste_code REFERENCES asgs_2011.ste_csv(code)
);

