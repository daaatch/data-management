USE DimensionalFactModel
GO
CREATE TABLE Fact_Flight (
    Fact_Flight_ID INT IDENTITY(1,1) PRIMARY KEY,
    Source_Flight_ID NVARCHAR(50) NOT NULL,
    Source_System NVARCHAR(50) NOT NULL,   
    Date_ID INT,
    Client_ID INT,
    Operator_ID INT,
    Airline_ID INT,             
    Amount FLOAT,
    Tax FLOAT,
    Commission FLOAT,
    Segment_Count INT
);