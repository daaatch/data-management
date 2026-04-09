USE DimensionalFactModel
GO
-- STEP 3: ROLL-UP (Quarter -> Year, City -> Country) + Accommodation comparison
SELECT 
    a.Accommodation_Description, 
    d.[Year], 
    AVG(f.Reservation_Amount / NULLIF(f.Reservation_Nights, 0)) AS Avg_Price_Per_Night
FROM Fact_Reservation f
JOIN Dim_Hotel h ON f.Reservation_Hotel_ID = h.Hotel_ID
JOIN Dim_Geography g ON h.Geography_ID = g.Geography_ID
JOIN Dim_Date d ON f.Date_From_ID = d.Date_ID
JOIN Dim_Accommodation a ON f.Reservation_Accommodation_ID = a.Accommodation_ID
WHERE g.Country_Name = 'ITALIA'
GROUP BY 
    a.Accommodation_Description, 
    d.[Year]
ORDER BY 
    a.Accommodation_Description, 
    d.[Year];