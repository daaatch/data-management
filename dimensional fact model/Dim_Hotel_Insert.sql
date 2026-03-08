USE DimensionalFactModel
GO
INSERT INTO Dim_Hotel (
    Source_Hotel_ID, 
    Source_System,
    Hotel_Code, 
    Hotel_Name, 
    Hotel_Address, 
    Email,
    Postal_Code, 
    Category, 
    Phone, 
    Geography_ID,
    Date_ID
)
SELECT 
    SUBSTRING(TRIM(h.id), CHARINDEX('-', TRIM(h.id)) + 1, LEN(TRIM(h.id))) AS Source_Hotel_ID,
    TRIM(h.src) AS Source_System,
    TRIM(h.code) AS Hotel_Code,
    TRIM(h.name) AS Hotel_Name,
    TRIM(h.address) AS Hotel_Address,
    TRIM(h.email) AS Email,
    TRIM(h.postalcode) AS Postal_Code,
    TRIM(h.category) AS Category,
    TRIM(h.phone) AS Phone,
    g.Geography_ID,
    d.Date_ID
FROM [ReconciledDataLayer].[dbo].[Hotels] h
LEFT JOIN Dim_Geography g 
    ON TRIM(h.city) = g.Location_Code_BK 
    AND g.Location_Type = 'City'
LEFT JOIN Dim_Date d 
    ON CAST(h.insertdate as DATE) = d.Full_Date;