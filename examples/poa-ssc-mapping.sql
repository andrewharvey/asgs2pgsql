-- This script will produce a mapping of which Postal Areas overlap with with
-- State Suburbs and vice versa.

-- To the extent possible under law, the person who associated CC0
-- with this work has waived all copyright and related or neighboring
-- rights to this work.
-- http://creativecommons.org/publicdomain/zero/1.0/

SELECT
  poa.name AS poa_name,
  ssc.code AS ssc_code,
  ssc.name AS ssc_name
FROM asgs_2011.poa AS poa
  JOIN asgs_2011.ssc AS ssc
    ON ST_Intersects(poa.geom, ssc.geom) AND
       ST_Relate(poa.geom, ssc.geom, 'T********'); -- interiors intersect
