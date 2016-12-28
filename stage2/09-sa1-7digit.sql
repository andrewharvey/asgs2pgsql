ALTER TABLE asgs_2011.sa1 ADD COLUMN code_7digit asgs.sa1_code_7digit;
UPDATE asgs_2011.sa1 SET code_7digit = overlay(code placing '' from 2 for 4);
ALTER TABLE asgs_2011.sa1 ALTER COLUMN code_7digit SET NOT NULL;
ALTER TABLE asgs_2011.sa1 ADD CONSTRAINT sa1_unique_7digit UNIQUE (code_7digit);

ALTER TABLE asgs_2016.sa1 ADD COLUMN code_7digit asgs.sa1_code_7digit;
UPDATE asgs_2016.sa1 SET code_7digit = overlay(code placing '' from 2 for 4);
ALTER TABLE asgs_2016.sa1 ALTER COLUMN code_7digit SET NOT NULL;
ALTER TABLE asgs_2016.sa1 ADD CONSTRAINT sa1_unique_7digit UNIQUE (code_7digit);
