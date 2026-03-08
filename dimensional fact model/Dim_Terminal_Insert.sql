USE DimensionalFactModel
GO
-- Airports identified by IATA code
INSERT INTO Dim_Terminal (
    Terminal_Type, 
    Terminal_Code_BK, 
    Terminal_Name,
    Geography_ID
)
SELECT 
    'Airport' AS Terminal_Type,
    TRIM(iata) AS Terminal_Code_BK,    
    TRIM(name) AS Terminal_Name,
    g1.Geography_ID
FROM [ReconciledDataLayer].[dbo].[Airports] as a
LEFT JOIN Dim_Geography as g1 
    ON TRIM(a.city) = g1.City_Name
    AND g1.Location_Type = 'City';


-- Stations identified by name (note: Italy only)
INSERT INTO Dim_Terminal (
    Terminal_Type, 
    Terminal_Code_BK, 
    Terminal_Name,
    Geography_ID
)
SELECT 
    'Station' AS Terminal_Type,
    TRIM(name) AS Terminal_Code_BK,    
    TRIM(name) AS Terminal_Name,
    g2.Geography_ID
FROM [ReconciledDataLayer].[dbo].[Stations] as s
LEFT JOIN Dim_Geography as g2
    ON TRIM(s.city) = g2.City_Name
    AND g2.Location_Type = 'City';
