-- Given an ABS structure code return which ABS struture that code is for.
-- Although all ABS struture codes appear to be distinct, I'm unsure how to
-- distinguish MB codes from SA1 codes. For now all 11 digit codes are returned
-- as SA1 even if they are actually MB codes.
CREATE OR REPLACE FUNCTION asgs_2011.match_abs_structure_code(code character varying(11)) RETURNS text AS $$
BEGIN
  IF code ~ '^\d$' THEN
      return 'state';

  ELSIF code ~ '^\d{3}$' THEN
      return 'sa4';

  -- if 5 digits then is SA3
  -- UNLESS ends with 99 and 3rd last char is not a 9
  ELSIF code ~ '^\d{5}$' THEN
    IF code ~ '[0-8]99$' THEN
      return 'gccsa';
    ELSE
      return 'sa3';
    END IF;

  ELSIF code ~ '^\w{5}$' THEN
      return 'gccsa';

  ELSIF code ~ '^\d{9}$' THEN
      return 'sa2';

  ELSIF code ~ '^\d{11}$' THEN
      return 'sa1';
  END IF;
END
$$ LANGUAGE plpgsql;

-- For a given ASGS_2011.LGA name return a short version of the name
CREATE OR REPLACE FUNCTION asgs_2011.shorten_lga_name(name text) RETURNS text AS $$
BEGIN
  return regexp_replace(name, ' \(.*', '');
END
$$ LANGUAGE plpgsql;
