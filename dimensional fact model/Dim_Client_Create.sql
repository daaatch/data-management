USE DimensionalFactModel
GO
CREATE TABLE Dim_Client (
    Client_ID INT IDENTITY(1,1) PRIMARY KEY,
    Source_Client_ID NVARCHAR(50) NOT NULL, 
    Source_System NVARCHAR(50) NOT NULL,      
    Original_ID NVARCHAR(50), 
    Client_Name NVARCHAR(255),
    Corporation NVARCHAR(255),
    Email NVARCHAR(255),
    Geography_ID INT,
    Date_ID INT -- Client insert date
);