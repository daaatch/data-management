USE DimensionalFactModel
GO
SET LANGUAGE English;
DECLARE @StartDate DATE = '2000-01-01';
DECLARE @EndDate DATE = '2049-12-31';
WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO Dim_Date (
        Date_ID, 
        Full_Date, 
        [Year], 
        [Month], 
        Month_Name, 
        [Day], 
        Day_Of_Week, 
        Day_Name, 
        [Quarter], 
        Is_Weekend
    )
    SELECT 
        CAST(FORMAT(@StartDate, 'yyyyMMdd') AS INT) AS Date_ID,
        @StartDate AS Full_Date,
        YEAR(@StartDate) AS [Year],
        MONTH(@StartDate) AS [Month],
        DATENAME(MONTH, @StartDate) AS Month_Name, 
        DAY(@StartDate) AS [Day],
        DATEPART(WEEKDAY, @StartDate) AS Day_Of_Week,
        DATENAME(WEEKDAY, @StartDate) AS Day_Name,  
        DATEPART(QUARTER, @StartDate) AS [Quarter],
        CASE 
            WHEN DATEPART(WEEKDAY, @StartDate) IN (1, 7) THEN 1 
            ELSE 0 
        END AS Is_Weekend;
    SET @StartDate = DATEADD(DAY, 1, @StartDate);
END;