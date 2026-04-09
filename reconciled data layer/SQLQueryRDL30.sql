WITH CitiesOrdered AS (
    SELECT
        CAST(concat('M-',t.Tkt_id) AS NVARCHAR(50)) AS Tkt_id,
        ROW_NUMBER() OVER (
            PARTITION BY t.Tkt_id
            ORDER BY v2.ord
        ) AS city_order
    FROM meridiano.dbo.tkt t
    INNER JOIN meridiano.dbo.vettori as v
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

INSERT INTO reconcileddatalayer.dbo.flights (
    id,
    number,
    clientcode,
    client,
    amount,
    tax,
    commission,
    airline,
    date,
    iata,
    operator,
    segments,
    src
)
SELECT
    CAST(concat('M-',t.Tkt_id) AS NVARCHAR(50)) AS id,
    CAST(t.Tkt_NTkt AS NVARCHAR(15)) AS number,
    CAST(concat('M-',t.Tkt_cli) AS NVARCHAR(10)) AS clientcode,
    CAST(t.Tkt_Nomecli AS NVARCHAR(100)) AS client,
    CAST(t.Tkt_ImpLordo AS float) AS amount,
    CAST(t.Tkt_tax AS FLOAT) AS tax,
    CAST(t.Tkt_Provvigione AS float) AS commission,
    CAST(t.Tkt_Vettore AS NVARCHAR(3)) AS airline,
    CAST(t.Tkt_datacreazione AS datetime) AS date,
    CAST(t.Tkt_Codiceiata AS NVARCHAR(50)) AS iata,
    CAST(concat('M-',t.Tkt_codoperatore) AS NVARCHAR(15)) AS operator,
    COUNT(c.city_order) - 1 AS segments,
    'Meridiano'
FROM meridiano.dbo.tkt t
INNER JOIN meridiano.dbo.vettori v
    ON t.Tkt_vettore = v.vettori_cod
LEFT JOIN CitiesOrdered c
    ON CAST(concat('M-',t.Tkt_id) AS NVARCHAR(50)) = c.Tkt_id
GROUP BY
    t.Tkt_id,
    t.Tkt_NTkt,
    t.Tkt_cli,
    t.Tkt_Nomecli,
    t.Tkt_ImpLordo,
    t.Tkt_tax,
    t.Tkt_Provvigione,
    t.Tkt_Vettore,
    t.Tkt_datacreazione,
    t.Tkt_Codiceiata,
    t.Tkt_codoperatore;