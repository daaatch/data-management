USE DimensionalFactModel
GO
INSERT INTO Dim_Airline (
	Airline_Code_IATA,
	Airline_Name
)
SELECT
	a.code,
	a.description
FROM ReconciledDataLayer.dbo.Airlines as a