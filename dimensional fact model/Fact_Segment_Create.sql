USE DimensionalFactModel
GO
CREATE TABLE Fact_Segment (
	Fact_Segment_ID INT IDENTITY(1,1) PRIMARY KEY,
	Flight_ID INT,
	Departure_ID INT,
	Arrival_ID INT,
	Segment_Number INT
);