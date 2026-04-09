INSERT INTO ReconciledDataLayer.dbo.Areas (code, description, tour, package, convention, catalog, study)
SELECT 
	CAST(Meri.AREE_COD AS nvarchar(3)), 
	CAST(Meri.AREE_DES AS nvarchar(100)),
	CAST(
		CASE 
			WHEN Meri.AREE_TOUR = 'T' THEN 1 ELSE 0
		END
	AS BIT),
	CAST(
		CASE 
			WHEN Meri.AREE_PACC = 'P' THEN 1 ELSE 0
		END
	AS BIT),
	Meri.AREE_CONG,
	Meri.AREE_CATALOGO,
	Meri.AREE_VIAGGISTUDIO
FROM Meridiano.dbo.AREE AS Meri
WHERE LEN(Meri.AREE_COD) = 3
	AND NOT Meri.AREE_DES = 'NON UTILIZZARE'
	AND NOT EXISTS (
	SELECT 1
	FROM ReconciledDataLayer.dbo.Areas AS RDL
	WHERE RDL.code = Meri.AREE_COD
	);