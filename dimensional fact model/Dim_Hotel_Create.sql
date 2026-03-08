USE DimensionalFactModel
GO
CREATE TABLE Dim_Hotel (
    Hotel_ID INT IDENTITY(1,1) PRIMARY KEY,
    -- Business Key composed by original id + source
    Source_Hotel_ID NVARCHAR(50),    
    Source_System NVARCHAR(50),       
    Hotel_Code NVARCHAR(50),           
    Hotel_Name NVARCHAR(255),
    Hotel_Address NVARCHAR(255),
    Email NVARCHAR(255),
    Postal_Code NVARCHAR(50),
    Category NVARCHAR(50),
    Phone NVARCHAR(50),
    -- Link to Dim_Geography
    Geography_ID INT,
    -- Link to Dim_Date
    Date_ID INT
);