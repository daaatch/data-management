USE DimensionalFactModel
GO
CREATE TABLE Dim_Date (
    -- Formato YYYY/MM/DD
    Date_ID INT PRIMARY KEY,           
    Full_Date DATE NOT NULL,           
    [Year] INT NOT NULL,           
    [Month] INT NOT NULL,          
    Month_Name NVARCHAR(50),      
    [Day] INT NOT NULL,           
    Day_Of_Week INT NOT NULL,     
    Day_Name NVARCHAR(50),         
    [Quarter] INT NOT NULL,        
    Is_Weekend BIT NOT NULL        
);