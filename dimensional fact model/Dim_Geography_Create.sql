USE DimensionalFactModel
GO
CREATE TABLE Dim_Geography (
    -- Data Warehouse Surrogate Key (Int, not Varchar!)
    Geography_ID INT IDENTITY(1,1) PRIMARY KEY,

    -- Data Origin (Municipality and Provinces are for Italy only!)
    Location_Type NVARCHAR(50), 
    Location_Code_BK NVARCHAR(50),

    -- Area table has been bypassed (it mixes geography and events PLUS I'm not gonna need it in the DFM)
    City_Name NVARCHAR(255),
    Province_Code NVARCHAR(50),
    Province_Name NVARCHAR(255),
    Region_Code NVARCHAR(50),
    Region_Name NVARCHAR(255),
    Country_Code_Alpha2 NVARCHAR(50),
    Country_Code_Alpha3 NVARCHAR(50),
    Country_Name NVARCHAR(255)
);