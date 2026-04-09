USE DimensionalFactModel
GO
CREATE TABLE Dim_Accommodation(
	Accommodation_ID INT IDENTITY(1,1) PRIMARY KEY,
	Accommodation_Code_BK NVARCHAR(50), 
	Accommodation_Description NVARCHAR(255)
);