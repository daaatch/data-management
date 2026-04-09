USE DimensionalFactModel
GO
CREATE TABLE Fact_Ticket (
	Ticket_ID INT IDENTITY(1,1) PRIMARY KEY,
	Source_Ticket_ID NVARCHAR(50) NOT NULL,
	Source_System_ID NVARCHAR(50) NOT NULL,
	Ticket_Client_ID INT,
	Ticket_Operator_ID INT,
	Ticket_Departure_ID INT,
	Ticket_Arrival_ID INT,
	Ticket_Date_ID INT,
	Ticket_Amount FLOAT,
	Ticket_Commission FLOAT,
	Ticket_Carrier NVARCHAR(50)
);