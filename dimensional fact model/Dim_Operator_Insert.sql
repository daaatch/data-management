USE DimensionalFactModel
GO
INSERT INTO Dim_Operator (
    Source_Operator_ID, 
    Source_System,      
    Original_ID,        
    Operator_Name, 
    Corporation, 
    Email, 
    Geography_ID,
    Date_ID
)
SELECT 
    TRIM(SUBSTRING(o.operatorcode, 3, LEN(o.operatorcode))) AS Source_Operator_ID,
    CASE 
        WHEN o.id LIKE 'M-%' THEN 'Meridiano'
        WHEN o.id LIKE 'C-%' THEN 'ContiTravel'
    END AS Source_System,
    TRIM(SUBSTRING(o.id, 3, LEN(o.id))) AS Original_ID, 
    TRIM(o.name) AS Operator_Name,
    TRIM(o.corporation) AS Corporation,
    TRIM(o.email) AS Email,
    g.Geography_ID,
    d.Date_ID
FROM [ReconciledDataLayer].[dbo].[Operators] o
LEFT JOIN Dim_Geography g 
    ON TRIM(o.city) = g.City_Name 
    AND TRIM(o.province) = g.Province_Code
LEFT JOIN Dim_Date d 
    ON CAST(o.dateins as DATE) = d.Full_Date;