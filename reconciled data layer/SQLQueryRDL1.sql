INSERT INTO ReconciledDataLayer.dbo.Airports (code, description, area, nation)
SELECT 
	CAST(Meri.AEROPORTI_COD AS nvarchar(3)), 
	CAST(Meri.AEROPORTI_DES AS nvarchar(50)),
	CAST(Meri.AEROPORTI_AREE AS nvarchar(3)), 
	CAST(Meri.AEROPORTI_NAZIONI AS nvarchar(3))
FROM Meridiano.dbo.AEROPORTI AS Meri
WHERE LEN(Meri.AEROPORTI_COD) = 3
	AND NOT NULL = Meri.AEROPORTI_AREE
	AND NOT EXISTS (
	SELECT 1
	FROM ReconciledDataLayer.dbo.Airports AS RDL
	WHERE RDL.code = Meri.AEROPORTI_COD
	);