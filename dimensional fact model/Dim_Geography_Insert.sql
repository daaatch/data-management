USE DimensionalFactModel
GO
-- Municipalities insert (Italy only)
INSERT INTO Dim_Geography (
    Location_Type, Location_Code_BK, City_Name, 
    Province_Code, Province_Name, 
    Region_Code, Region_Name, 
    Country_Code_Alpha2, Country_Code_Alpha3, Country_Name
)
SELECT 
    'Municipality' AS Location_Type,
    TRIM(m.istat) AS Location_Code_BK,
    TRIM(m.name) AS City_Name,
    TRIM(p.code) AS Province_Code,
    TRIM(p.name) AS Province_Name,    
    TRIM(r.code) AS Region_Code,
    TRIM(r.name) AS Region_Name,    
    TRIM(c.initials) AS Country_Code_Alpha2,
    TRIM(c.code) AS Country_Code_Alpha3,
    TRIM(c.description) AS Country_Name
FROM [ReconciledDataLayer].[dbo].[Municipalities] m
LEFT JOIN [ReconciledDataLayer].[dbo].[Provinces] p ON TRIM(m.province) = TRIM(p.code)
LEFT JOIN [ReconciledDataLayer].[dbo].[Regions] r ON TRIM(p.region) = TRIM(r.code)
LEFT JOIN [ReconciledDataLayer].[dbo].[Countries] c ON TRIM(r.country) = TRIM(c.code);

-- Cities insert (Region = NULL for non-italian cities)
INSERT INTO Dim_Geography (
    Location_Type, Location_Code_BK, City_Name, 
    Province_Code, Province_Name, 
    Country_Code_Alpha2, Country_Code_Alpha3, Country_Name
)
SELECT 
    'City' AS Location_Type,
    TRIM(ci.code) AS Location_Code_BK,
    TRIM(ci.name) AS City_Name,   
    TRIM(ci.state) AS Province_Code,    
    TRIM(ci.state) AS Province_Name,   
    TRIM(c.initials) AS Country_Code_Alpha2,
    TRIM(c.code) AS Country_Code_Alpha3,
    TRIM(c.description) AS Country_Name
FROM [ReconciledDataLayer].[dbo].[Cities] ci
LEFT JOIN [ReconciledDataLayer].[dbo].[Countries] c ON TRIM(ci.country) = TRIM(c.initials);