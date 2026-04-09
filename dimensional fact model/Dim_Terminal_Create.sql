USE DimensionalFactModel
GO
CREATE TABLE Dim_Terminal (
    Terminal_ID INT IDENTITY(1,1) PRIMARY KEY,
    -- Terminal type: Airport/Train Station
    Terminal_Type NVARCHAR(50),      
    Terminal_Code_BK NVARCHAR(50),   
    Terminal_Name NVARCHAR(255),
    Geography_ID INT
);