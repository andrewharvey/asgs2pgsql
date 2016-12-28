
CREATE TABLE asgs_2015.tr AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2015.tr_csv csv LEFT JOIN asgs_2015.tr_ogr ogr USING (code)
);

CREATE TABLE asgs_2015.lga AS (
  SELECT csv.*, ogr.wkb_geometry as geom
  FROM asgs_2015.lga_csv csv LEFT JOIN asgs_2015.lga_ogr ogr USING (code)
);

