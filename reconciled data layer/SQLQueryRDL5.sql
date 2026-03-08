UPDATE ReconciledDataLayer.dbo.Nations 
SET
    currency = CASE 
        WHEN (RDL.currency IS NULL OR RDL.currency = '')
             AND (n.NAZIONI_VAL IS NOT NULL)
        THEN CAST(n.NAZIONI_VAL AS NVARCHAR(3))
        ELSE RDL.currency
    END,

    initials = CASE 
        WHEN (RDL.initials IS NULL OR RDL.initials = '')
             AND (n.NAZIONI_SIGLA IS NOT NULL)
        THEN CAST(n.NAZIONI_SIGLA AS NVARCHAR(2))
        ELSE RDL.initials
    END,

    isocode = CASE 
        WHEN (RDL.isocode IS NULL OR RDL.isocode = '')
             AND (n.NAZIONI_ISO_COUNTRY_CODE IS NOT NULL) 
        THEN CAST(n.NAZIONI_ISO_COUNTRY_CODE AS NVARCHAR(3))
        ELSE RDL.isocode
    END
FROM ReconciledDataLayer.dbo.Nations AS RDL
JOIN ContiTravel.dbo.NAZIONI AS n
    ON RDL.code = n.NAZIONI_COD
WHERE LEN(n.NAZIONI_COD) = 3;