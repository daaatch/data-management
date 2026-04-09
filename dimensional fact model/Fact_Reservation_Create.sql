USE DimensionalFactModel
GO
CREATE TABLE Fact_Reservation (
	Reservation_ID INT IDENTITY(1,1) PRIMARY KEY,
	Source_Reservation_ID NVARCHAR(50) NOT NULL,
	Source_System_ID NVARCHAR(50) NOT NULL,
	Reservation_Client_ID INT,
	Reservation_Operator_ID INT,
	Reservation_Hotel_ID INT,
	Reservation_Accommodation_ID INT,
	Date_Insert_ID INT,
	Date_From_ID INT,
	Date_To_ID INT,
	Reservation_Amount FLOAT,
	Reservation_Commission FLOAT,
	Reservation_Guests INT,
	Reservation_Nights INT
);