INSERT INTO reconcileddatalayer.dbo.cities
    (code, name, state, country, latitude, longitude)
SELECT
    CAST(c.g_cit_code AS NVARCHAR(3)),
    CAST(c.g_cit_name AS NVARCHAR(50)),
    c.g_cit_statecode,
    c.g_cit_countrycode,
    c.g_cit_latitude,
    c.g_cit_longitude
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY g_cit_code
               ORDER BY g_cit_name
           ) AS rn
    FROM meridiano.dbo.g_cities
) c
WHERE c.rn = 1
  AND NOT EXISTS (
      SELECT 1
      FROM reconcileddatalayer.dbo.cities rdl
      WHERE rdl.code = c.g_cit_code
  );
