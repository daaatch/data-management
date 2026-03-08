USE DimensionalFactModel
GO
CREATE TABLE Dim_Airline (
	Airline_ID INT IDENTITY(1,1) PRIMARY KEY,
	Airline_Code_IATA NVARCHAR(50),
	Airline_Name NVARCHAR(255)
);