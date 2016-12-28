
-- To the extent possible under law, the person who associated CC0
-- with this work has waived all copyright and related or neighboring
-- rights to this work.
-- http://creativecommons.org/publicdomain/zero/1.0/

-- This schema is partly derived from the ASGS structure.
-- http://www.abs.gov.au/websitedbs/D3310114.nsf/home/Australian+Statistical+Geography+Standard+%28ASGS%29

CREATE SCHEMA asgs;
CREATE SCHEMA asgs_2011;
CREATE SCHEMA asgs_2015;
CREATE SCHEMA asgs_2016;

CREATE EXTENSION postgis SCHEMA asgs;
CREATE EXTENSION postgis SCHEMA asgs_2011;
CREATE EXTENSION postgis SCHEMA asgs_2015;
CREATE EXTENSION postgis SCHEMA asgs_2016;


--
-- CREATE DOMAINS
--

CREATE DOMAIN asgs.ste_code AS char(1)
CHECK (
  VALUE ~ E'^\\d$'
);

CREATE DOMAIN asgs.gccsa_code AS char(5)
CHECK (
  VALUE ~ E'^\\d\\w{4}$'
);

CREATE DOMAIN asgs.sa4_code AS char(3)
CHECK (
  VALUE ~ E'^\\d{3}$'
);

CREATE DOMAIN asgs.sa3_code AS char(5)
CHECK (
  VALUE ~ E'^\\d{5}$'
);

CREATE DOMAIN asgs.sa2_code AS char(9)
CHECK (
  VALUE ~ E'^\\d{9}$'
);

CREATE DOMAIN asgs.sa1_code AS char(11)
CHECK (
  VALUE ~ E'^\\d{11}$'
);

CREATE DOMAIN asgs.sa1_code_7digit AS char(7)
CHECK (
  VALUE ~ E'^\\d{7}$'
);

CREATE DOMAIN asgs.mb_code AS char(11)
CHECK (
  VALUE ~ E'^\\d{11}$'
);

CREATE DOMAIN asgs.add_code AS char(3)
CHECK (
  VALUE ~ E'^D\\d{2}$'
);

CREATE DOMAIN asgs.poa_code AS char(4)
CHECK (
  VALUE ~ E'^\\d{4}$'
);

CREATE DOMAIN asgs.ssc_code AS char(5)
CHECK (
  VALUE ~ E'^\\d{5}$'
);

CREATE DOMAIN asgs.ced_code AS char(3)
CHECK (
  VALUE ~ E'^\\d{3}$'
);

CREATE DOMAIN asgs.sed_code AS char(5)
CHECK (
  VALUE ~ E'^\\d{5}$'
);

CREATE DOMAIN asgs.nrmr_code AS char(3)
CHECK (
  VALUE ~ E'^\\d{3}$'
);

CREATE DOMAIN asgs.lga_code AS char(5)
CHECK (
  VALUE ~ E'^\\d{5}$'
);

CREATE DOMAIN asgs.tr_code AS char(5)
CHECK (
  VALUE ~ E'^\\d\\w{4}$'
);
CREATE DOMAIN asgs.iloc_code AS char(8)
CHECK (
  VALUE ~ E'^\\d{8}$'
);

CREATE DOMAIN asgs.iare_code AS char(6)
CHECK (
  VALUE ~ E'^\\d{6}$'
);

CREATE DOMAIN asgs.ireg_code AS char(3)
CHECK (
  VALUE ~ E'^\\d{3}$'
);

CREATE DOMAIN asgs.sua_code AS char(4)
CHECK (
  VALUE ~ E'^\\d{4}$'
);

CREATE DOMAIN asgs.ucl_code AS char(6)
CHECK (
  VALUE ~ E'^\\d{6}$'
);

CREATE DOMAIN asgs.sosr_code AS char(3)
CHECK (
  VALUE ~ E'^\\d{3}$'
);

CREATE DOMAIN asgs.sos_code AS char(2)
CHECK (
  VALUE ~ E'^\\d{2}$'
);

CREATE DOMAIN asgs.ra_code AS char(2)
CHECK (
  VALUE ~ E'^\\d{2}$'
);


CREATE TYPE asgs.landuse AS ENUM (
  'Residential',
  'Education',
  'Industrial',
  'Transport',
  'Other',
  'OFFSHORE',
  'NOUSUALRESIDENCE',
  'Parkland',
  'Hospital/Medical',
  'Water',
  'SHIPPING',
  'ANTARCTICA',
  'Agricultural',
  'Commercial',
  'MIGRATORY',
  'Primary Production'
);

CREATE TYPE asgs.ssc_confidence AS ENUM (
  'Very good',
  'Good',
  'Acceptable',
  'Poor',
  'Very poor',
  'NA'
);



--
-- Create functions to extract higher level codes from the code of lower level codes
--

-- From the GCCSA code extract the STE code
CREATE FUNCTION asgs.gccsa_ste(asgs.gccsa_code) RETURNS asgs.ste_code AS $$
  SELECT substring($1 from 1 for 1)::asgs.ste_code;
$$ LANGUAGE SQL;

-- From the SA4 code extract the STE code
CREATE FUNCTION asgs.sa4_ste(asgs.sa4_code) RETURNS asgs.ste_code AS $$
  SELECT substring($1 from 1 for 1)::asgs.ste_code;
$$ LANGUAGE SQL;

-- From the SA3 code extract the SA4 code
CREATE FUNCTION asgs.sa3_sa4(asgs.sa3_code) RETURNS asgs.sa4_code AS $$
  SELECT substring($1 from 1 for 3)::asgs.sa4_code;
$$ LANGUAGE SQL;

-- From the SA2 code extract the SA3 code
CREATE FUNCTION asgs.sa2_sa3(asgs.sa2_code) RETURNS asgs.sa3_code AS $$
  SELECT substring($1 from 1 for 5)::asgs.sa3_code;
$$ LANGUAGE SQL;

-- From the SA1 code extract the SA2 code
CREATE FUNCTION asgs.sa1_sa2(asgs.sa1_code) RETURNS asgs.sa2_code AS $$
  SELECT substring($1 from 1 for 9)::asgs.sa2_code;
$$ LANGUAGE SQL;

-- From the MB code extract the STE code
CREATE FUNCTION asgs.mb_ste(asgs.mb_code) RETURNS asgs.ste_code AS $$
  SELECT substring($1 from 1 for 1)::asgs.ste_code;
$$ LANGUAGE SQL;

-- From the ILOC code extract the IARE code
CREATE FUNCTION asgs.iloc_iare(asgs.iloc_code) RETURNS asgs.iare_code AS $$
  SELECT substring($1 from 1 for 5)::asgs.iare_code;
$$ LANGUAGE SQL;

-- From the IARE code extract the IREG code
CREATE FUNCTION asgs.iare_ireg(asgs.iare_code) RETURNS asgs.ireg_code AS $$
  SELECT substring($1 from 1 for 3)::asgs.ireg_code;
$$ LANGUAGE SQL;

-- From the IREG code extract the STE code
CREATE FUNCTION asgs.ireg_ste(asgs.ireg_code) RETURNS asgs.ste_code AS $$
  SELECT substring($1 from 1 for 1)::asgs.ste_code;
$$ LANGUAGE SQL;

-- From the LGA code extract the STE code
CREATE FUNCTION asgs.lga_ste(asgs.lga_code) RETURNS asgs.ste_code AS $$
  SELECT substring($1 from 1 for 1)::asgs.ste_code;
$$ LANGUAGE SQL;

-- From the NRMR code extract the STE code
CREATE FUNCTION asgs.nrmr_ste(asgs.nrmr_code) RETURNS asgs.ste_code AS $$
  SELECT substring($1 from 1 for 1)::asgs.ste_code;
$$ LANGUAGE SQL;

-- From the CED code extract the STE code
CREATE FUNCTION asgs.ced_ste(asgs.ced_code) RETURNS asgs.ste_code AS $$
  SELECT substring($1 from 1 for 1)::asgs.ste_code;
$$ LANGUAGE SQL;

-- From the TR code extract the STE code
CREATE FUNCTION asgs.tr_ste(asgs.tr_code) RETURNS asgs.ste_code AS $$
  SELECT substring($1 from 1 for 1)::asgs.ste_code;
$$ LANGUAGE SQL;

-- From the UCL code extract the SOSR code
CREATE FUNCTION asgs.ucl_sosr(asgs.ucl_code) RETURNS asgs.sosr_code AS $$
  SELECT substring($1 from 1 for 3)::asgs.sosr_code;
$$ LANGUAGE SQL;

-- From the SOS code extract the STE code
CREATE FUNCTION asgs.sos_ste(asgs.sos_code) RETURNS asgs.ste_code AS $$
  SELECT substring($1 from 1 for 1)::asgs.ste_code;
$$ LANGUAGE SQL;

-- From the SOS code extract the SOS Identifier
CREATE FUNCTION asgs.sos_identifier(asgs.sos_code) RETURNS char(1) AS $$
  SELECT substring($1 from 2 for 1);
$$ LANGUAGE SQL;

-- From the SOSR code extract the SOS code
CREATE FUNCTION asgs.sosr_sos(asgs.sosr_code) RETURNS asgs.sos_code AS $$
  SELECT substring($1 from 1 for 2)::asgs.sos_code;
$$ LANGUAGE SQL;

-- From the RA code extract the STE code
CREATE FUNCTION asgs.ra_ste(asgs.ra_code) RETURNS asgs.ste_code AS $$
  SELECT substring($1 from 1 for 1)::asgs.ste_code;
$$ LANGUAGE SQL;
