WITH CitiesOrdered AS (
    SELECT
        CAST(concat('C-',t.Tkt_id) AS NVARCHAR(50)) AS Tkt_id,
        CAST(v2.city AS NVARCHAR(3)) AS city,
        ROW_NUMBER() OVER (
            PARTITION BY t.Tkt_id
            ORDER BY v2.ord
        ) AS city_order
    FROM contitravel.dbo.tkt t
    INNER JOIN contitravel.dbo.vettori v
        ON t.Tkt_vettore = v.vettori_cod
    CROSS APPLY (VALUES
        (1, t.Tkt_Cit1),
        (2, t.Tkt_Cit2),
        (3, t.Tkt_Cit3),
        (4, t.Tkt_Cit4),
        (5, t.Tkt_Cit5)
    ) v2(ord, city)
    WHERE v2.city IS NOT NULL
      AND LTRIM(RTRIM(v2.city)) <> ''
)

INSERT INTO reconcileddatalayer.dbo.segments (
    flight,
    segment,
    departure,
    arrival,
    src
)
SELECT
    a.Tkt_id,
    a.city_order,
    a.city,
    b.city,
    'ContiTravel'
FROM CitiesOrdered a
JOIN CitiesOrdered b
    ON a.Tkt_id = b.Tkt_id
    AND a.city_order = b.city_order - 1
ORDER BY a.Tkt_id, a.city_order;