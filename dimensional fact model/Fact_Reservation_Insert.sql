USE [DimensionalFactModel]
GO
INSERT INTO [dbo].[Fact_Reservation] (
    Source_Reservation_ID,
    Source_System_ID,
    Reservation_Client_ID,
    Reservation_Operator_ID,
    Reservation_Hotel_ID,
    Reservation_Accommodation_ID,
    Date_Insert_ID,
    Date_From_ID,
    Date_To_ID,
    Reservation_Amount,
    Reservation_Commission,
    Reservation_Guests,
    Reservation_Nights
)
SELECT 
    TRIM(SUBSTRING(R.id, 3, LEN(R.id))) AS Source_Reservation_ID,
    R.src,
    DC.Client_ID,
    DO.Operator_ID,
    DH.Hotel_ID,
    DA.Accommodation_ID,
    DI.Date_ID, 
    DF.Date_ID,  
    DT.Date_ID, 
    R.amount,
    R.commission,
    R.guests,
    R.nights
FROM 
    [ReconciledDataLayer].[dbo].[Reservations] R
LEFT JOIN [dbo].[Dim_Client] DC ON R.clientcode = DC.Source_Client_ID AND R.src = DC.Source_System
LEFT JOIN [dbo].[Dim_Operator] DO ON TRIM(SUBSTRING(R.operator, 3, LEN(R.operator))) = DO.Source_Operator_ID AND R.src = DO.Source_System
LEFT JOIN [dbo].[Dim_Hotel] DH ON R.hotel = DH.Hotel_Code
LEFT JOIN [dbo].[Dim_Accommodation] DA ON R.accommodation = DA.Accommodation_Code_BK
LEFT JOIN [dbo].[Dim_Date] DI ON CAST(R.dateinsert AS DATE) = DI.Full_Date
LEFT JOIN [dbo].[Dim_Date] DF ON CAST(R.datefrom AS DATE) = DF.Full_Date
LEFT JOIN [dbo].[Dim_Date] DT ON CAST(R.dateto AS DATE) = DT.Full_Date;