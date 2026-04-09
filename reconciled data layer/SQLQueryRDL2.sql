INSERT INTO ReconciledDataLayer.dbo.Areas (code, description, tour, package, convention, catalog, study)
SELECT 
	CAST(Conti.AREE_COD AS nvarchar(3)), 
	CAST(Conti.AREE_DES AS nvarchar(100)),
	CAST(
		CASE 
			WHEN Conti.AREE_TOUR = 'T' THEN 1 ELSE 0
		END
	AS BIT),
	CAST(
		CASE 
			WHEN Conti.AREE_PACC = 'P' THEN 1 ELSE 0
		END
	AS BIT),
	Conti.AREE_CONG,
	Conti.AREE_CATALOGO,
	Conti.AREE_VIAGGISTUDIO
FROM ContiTravel.dbo.AREE AS Conti
WHERE LEN(Conti.AREE_COD) = 3
	AND NOT EXISTS (
	SELECT 1
	FROM ReconciledDataLayer.dbo.Areas AS RDL
	WHERE RDL.code = Conti.AREE_COD
	);