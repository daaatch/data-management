USE DimensionalFactModel;
GO
INSERT INTO Dim_Accommodation (
    Accommodation_Code_BK, 
    Accommodation_Description
)
SELECT DISTINCT 
    a.code, 
    a.description
FROM ReconciledDataLayer.dbo.Accommodations as a