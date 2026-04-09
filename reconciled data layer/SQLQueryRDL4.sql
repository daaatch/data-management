INSERT INTO ReconciledDataLayer.dbo.Nations (code, description, area, currency, initials, isocode)
SELECT
	CAST(n.NAZIONI_COD AS nvarchar(3)),
	CAST(n.NAZIONI_DES AS nvarchar(50)),
	CAST(n.NAZIONI_AREE AS nvarchar(3)),
	CAST(n.NAZIONI_VAL AS nvarchar(3)),
	CAST(n.NAZIONI_SIGLA AS nvarchar(2)),
	CAST(n.NAZIONI_ISO_COUNTRY_CODE AS nvarchar(3))
FROM Meridiano.dbo.NAZIONI AS n
WHERE LEN(n.NAZIONI_COD) = 3
AND NOT EXISTS (
	SELECT 1
	FROM ReconciledDataLayer.dbo.Nations AS RDL
	WHERE RDL.code = n.NAZIONI_COD
	);