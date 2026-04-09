USE [DimensionalFactModel]
GO
INSERT INTO [dbo].[Fact_Ticket] (
    Source_Ticket_ID,
    Source_System_ID,
    Ticket_Client_ID,
    Ticket_Operator_ID,
    Ticket_Departure_ID,
    Ticket_Arrival_ID,
    Ticket_Date_ID,
    Ticket_Amount,
    Ticket_Commission,
    Ticket_Carrier
)
SELECT 
    TRIM(SUBSTRING(T.id, 3, LEN(T.id))),
    T.src,
    C.Client_ID,
    O.Operator_ID,
    D.Terminal_ID,
    A.Terminal_ID,
    DD.Date_ID,
    T.amount,
    T.commission,
    T.carrier
FROM 
    [ReconciledDataLayer].[dbo].[Tickets] T
LEFT JOIN 
    [dbo].[Dim_Client] C ON TRIM(SUBSTRING(T.clientcode, 3, LEN(T.clientcode))) = C.Source_Client_ID AND T.src = C.Source_System
LEFT JOIN 
    [dbo].[Dim_Operator] O ON TRIM(SUBSTRING(T.operator, 3, LEN(T.operator)))  = O.Source_Operator_ID AND T.src = O.Source_System
LEFT JOIN 
    [dbo].[Dim_Terminal] D ON T.departure = D.Terminal_Name
LEFT JOIN 
    [dbo].[Dim_Terminal] A ON T.arrival = A.Terminal_Name
LEFT JOIN 
    [dbo].[Dim_Date] DD ON CAST(T.date AS DATE) = DD.Full_Date;