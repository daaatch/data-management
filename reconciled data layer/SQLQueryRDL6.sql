INSERT INTO ReconciledDataLayer.dbo.Airlines (code, description, bsp)
SELECT
	CAST(v.VETTORI_COD AS nvarchar(3)),
	CAST(v.VETTORI_DES AS nvarchar(50)),
	CAST(
        CASE 
            WHEN v.VETTORI_BSP = 'E' THEN 1
            ELSE 0
        END 
    AS BIT) AS bsp
FROM Meridiano.dbo.Vettori AS v
WHERE NOT EXISTS (
	SELECT 1
	FROM ReconciledDataLayer.dbo.Airlines AS RDL
	WHERE RDL.code = v.VETTORI_COD
	);