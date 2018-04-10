# List SSC's (State Suburbs) within POA (Postal Areas)

    SELECT
        poa.name AS poa_name,
        array_agg(asgs_2016.remove_ssc_qualifier(ssc.name)) AS ssc_names
    FROM
        asgs_2016.poa AS poa,
        asgs_2016.ssc AS ssc
    WHERE
        ST_Contains(poa.geom, ssc.geom)
    GROUP BY poa.name;

# Exporting results to CSV

     psql --no-align --field-separator=',' -c "SELECT ...;"

# Exporting results to JSON

     SELECT json_agg(t) FROM (...) AS t;
