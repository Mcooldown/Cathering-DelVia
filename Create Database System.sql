-- Project Database B (Create DDL)

CREATE DATABASE CateringdelVia

-- Create Position Table
CREATE TABLE Position (
	[ID] VARCHAR(5),
	[Name] VARCHAR(255) NOT NULL,
	PRIMARY KEY(ID),
	CONSTRAINT id_format CHECK ([ID] LIKE 'SP[0-9][0-9][0-9]')
)

--Create Ingredients Table
CREATE TABLE Ingredients (
	ID VARCHAR(5),
	[Name] VARCHAR(255) NOT NULL,
	Stock INT NOT NULL,
	Price INT NOT NULL,
	PRIMARY KEY (ID),
	CONSTRAINT id_format_ing CHECK ([ID] LIKE 'ID[0-9][0-9][0-9]')
)

--Create Vendor Table
CREATE TABLE Vendor (
	ID VARCHAR(5),
	[Name] VARCHAR(255) NOT NULL,
	PhoneNumber VARCHAR(15) NOT NULL,
	[Address] VARCHAR(255) NOT NULL,
	PRIMARY KEY (ID),
	CONSTRAINT id_format_vendor CHECK ([ID] LIKE 'VE[0-9][0-9][0-9]'),
	CONSTRAINT vendor_name_format CHECK ([Name] LIKE 'PT. %'),
	CONSTRAINT phone_vendor CHECK (ISNUMERIC(PhoneNumber) = 1 AND PhoneNumber LIKE '08%')
)

--Create Menu Table
CREATE TABLE Menu (
	ID VARCHAR(5),
	[Name] VARCHAR(255) NOT NULL,
	[Description] VARCHAR(255) NOT NULL,
	Price INT NOT NULL,
	PRIMARY KEY (ID),
	CONSTRAINT id_format_menu CHECK ([ID] LIKE 'ME[0-9][0-9][0-9]'),
	CONSTRAINT menu_name CHECK (LEN([Name])>5 )
)

--Create Customer Table
CREATE TABLE Customer (
	ID VARCHAR(5),
	[Name] VARCHAR(255) NOT NULL,
	PhoneNumber VARCHAR(15) NOT NULL,
	[Address] VARCHAR(255) NOT NULL,
	Gender VARCHAR(255) NOT NULL,
	Email VARCHAR(255) NOT NULL,
	PRIMARY KEY(ID),
	CONSTRAINT id_format_customer CHECK ([ID] LIKE 'CU[0-9][0-9][0-9]'),
	CONSTRAINT phone_customer CHECK (ISNUMERIC(PhoneNumber) = 1 AND PhoneNumber LIKE '08%'),
	CONSTRAINT email_customer CHECK (Email NOT LIKE '@%' AND 
	(Email LIKE '%@gmail.com' OR Email LIKE '%@yahoo.com' OR Email LIKE '%@yahoo.co.id')
	)
)

--Create Staff Table
CREATE TABLE Staff (
	ID VARCHAR(5),
	[Name] VARCHAR(255) NOT NULL,
	Gender VARCHAR(255) NOT NULL,
	Email VARCHAR(255) NOT NULL,
	PhoneNumber VARCHAR(15) NOT NULL,
	[Address] VARCHAR(255) NOT NULL,
	Salary INT NOT NULL,
	PositionID VARCHAR(5) NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY (PositionID) REFERENCES Position(ID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT id_format_staff CHECK ([ID] LIKE 'ST[0-9][0-9][0-9]'),
	CONSTRAINT phone_staff CHECK (ISNUMERIC(PhoneNumber) = 1 AND PhoneNumber LIKE '08%'),
	CONSTRAINT email_staff CHECK (Email NOT LIKE '@%' AND 
	(Email LIKE '%@gmail.com' OR Email LIKE '%@yahoo.com' OR Email LIKE '%@yahoo.co.id')
	),
	CONSTRAINT staff_salary CHECK (Salary BETWEEN 500000 AND 5000000)
)

--Create Header Purchase Transaction Table
CREATE TABLE HeaderPurchaseTransaction (
	ID VARCHAR(5),
	StaffID VARCHAR(5) NOT NULL,
	VendorID VARCHAR(5) NOT NULL,
	PurchaseDate DATE NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (StaffID) REFERENCES Staff(ID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (VendorID) REFERENCES Vendor(ID) ON UPDATE CASCADE ON DELETE CASCADE, 
	CONSTRAINT id_format_purchase CHECK ([ID] LIKE 'PU[0-9][0-9][0-9]'),
)

--Create Detail Purchase Transaction Table
CREATE TABLE DetailPurchaseTransaction (
	PurchaseID VARCHAR(5),
	IngredientsID VARCHAR(5),
	PRIMARY KEY (PurchaseID, IngredientsID),
	IngredientsQuantity INT NOT NULL,
	FOREIGN KEY (PurchaseID) REFERENCES HeaderPurchaseTransaction(ID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (IngredientsID) REFERENCES Ingredients(ID) ON UPDATE CASCADE ON DELETE CASCADE
)

--Create Header Service Transaction Table
CREATE TABLE HeaderServiceTransaction (
	ID VARCHAR(5),
	StaffID VARCHAR(5),
	CustomerID VARCHAR(5),
	TransactionDate DATE NOT NULL,
	ReservationType VARCHAR(255) NOT NULL,
	ReservationAddress VARCHAR(255) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (StaffID) REFERENCES Staff(ID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (CustomerID) REFERENCES Customer(ID) ON UPDATE CASCADE ON DELETE CASCADE
)

--Create Detail Service Transaction Table
CREATE TABLE DetailServiceTransaction (
	TransactionID VARCHAR(5),
	MenuID VARCHAR(5),
	MenuQuantity INT NOT NULL,
	PRIMARY KEY (TransactionID, MenuID),
	FOREIGN KEY (TransactionID) REFERENCES HeaderServiceTransaction(ID)
	ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (MenuID) REFERENCES Menu(ID) ON UPDATE CASCADE ON DELETE CASCADE
)
