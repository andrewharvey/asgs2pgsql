-- create new table with generalised geometries pyramid and Albers Area for statistical purposes
CREATE TABLE asgs_2011.$table_pyramid
(
  "code" asgs_2011.$table_code PRIMARY KEY REFERENCES asgs_2011.$table(code),
  "name" text,
  "area" double precision
);

-- use the PostGIS function to add geometry column
SELECT AddGeometryColumn( 'asgs_2011', '$table_pyramid', 'geom_$gen', 900913, 'GEOMETRY', 2);

-- populate the new table
INSERT INTO asgs_2011.$table_pyramid (
  SELECT
    code,
    name,
    ST_Area(ST_Transform(geom,3577)) as area,
    ST_SetSRID(ST_SimplifyPreserveTopology(geom, $gen),900913) as geom_$gen,
  FROM asgs_2011.$table
);

-- create geom indexes so that rendering engines can speadily extract a single tile
CREATE INDEX $table_pyramid_geom_$gen_idx ON asgs_2011.$table_pyramid USING gist (geom_$gen);

