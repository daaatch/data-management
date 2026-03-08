USE [DimensionalFactModel]
GO
INSERT INTO [dbo].[Fact_Segment] (
    Flight_ID,
    Departure_ID,
    Arrival_ID,
    Segment_Number
)
SELECT 
    F.Fact_Flight_ID,
    TD.Terminal_ID,
    TA.Terminal_ID,
    S.segment
FROM 
    [ReconciledDataLayer].[dbo].[Segments] S
LEFT JOIN 
    [dbo].[Fact_Flight] F ON (
        TRIM(SUBSTRING(s.flight, 3, LEN(s.flight))) = F.Source_Flight_ID
        AND s.src = F.Source_System)
LEFT JOIN 
    [dbo].[Dim_Terminal] TD ON S.departure = TD.Terminal_Code_BK
LEFT JOIN 
    [dbo].[Dim_Terminal] TA ON S.arrival = TA.Terminal_Code_BK;