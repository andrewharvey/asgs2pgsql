
-- create the lga_extras view which adds value on top of the base ASGS
CREATE OR REPLACE VIEW asgs_2011.lga_extras AS
  SELECT code, ste, name, asgs_2011.shorten_lga_name(name) as short_name, asgs_2011.lga_status_type_code(name) as status_code, asgs_2011.lga_status_type_code_to_name(asgs_2011.lga_status_type_code(name)) as status_name
  FROM asgs_2011.lga;
