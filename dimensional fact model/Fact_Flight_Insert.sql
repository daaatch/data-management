USE DimensionalFactModel;
GO
INSERT INTO Fact_Flight (
    Source_Flight_ID,
    Source_System,
    Date_ID,
    Client_ID,
    Operator_ID,
    Airline_ID,
    Amount,
    Tax,
    Commission,
    Segment_Count
)
SELECT 
    TRIM(SUBSTRING(f.id, 3, LEN(f.id))) AS Source_Flight_ID,
    f.src AS Source_System,
    d.Date_ID,
    c.Client_ID,
    o.Operator_ID,
    a.Airline_ID,
    f.amount AS Amount,
    f.tax AS Tax,
    f.commission AS Commission,
    f.segments AS Segment_Count

FROM ReconciledDataLayer.dbo.Flights f
LEFT JOIN Dim_Client AS c 
    ON TRIM(SUBSTRING(f.clientcode, 3, LEN(f.clientcode))) = c.Source_Client_ID AND f.src = c.Source_System
LEFT JOIN Dim_Operator AS o 
    ON TRIM(SUBSTRING(f.operator, 3, LEN(f.operator))) = o.Source_Operator_ID AND f.src = o.Source_System
LEFT JOIN Dim_Airline AS a 
    ON f.airline = a.Airline_Code_IATA
LEFT JOIN Dim_Date AS d 
    ON CAST(f.date as DATE) = d.Full_Date;