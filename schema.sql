CREATE DATABASE [Tech Lib];

USE [Tech Lib];

CREATE TABLE Books(
	BookId INT IDENTITY PRIMARY KEY,
	Title VARCHAR(100) NOT NULL,
	Author VARCHAR(100) NOT NULL,
	ISBN VARCHAR(13) NOT NULL UNIQUE,
	[Published date] DATE NOT NULL,
	Genre VARCHAR(20) NOT NULL,
	[Shelf Location] VARCHAR(10) NOT NULL,
	[Current Status] VARCHAR(10) NOT NULL CHECK ([Current Status] IN ('Available', 'Borrowed'))
);

CREATE TABLE Borrowers(
	BorrowerId INT IDENTITY PRIMARY KEY,
	[First Name] VARCHAR(50) NOT NULL,
	[Last Name] VARCHAR(50) NOT NULL,
	[Email] VARCHAR(50) NOT NULL UNIQUE,
	[Date of Birth] DATE NOT NULL,
	[Membership Date] DATE NOT NULL
)

CREATE TABLE Loans(
	LoanId INT IDENTITY PRIMARY KEY,
	BookId INT NOT NULL,
	BorrowerId INT NOT NULL,
	[Date Borrowed] DATE NOT NULL,
	[Due Date] DATE NOT NULL,
	[Date Returned] DATE,
	CONSTRAINT Fk_Loans_Books FOREIGN KEY (BookId)
	REFERENCES Books(BookId) ON DELETE CASCADE,
	CONSTRAINT Fk_Loans_Borrowers FOREIGN KEY (BorrowerId)
	REFERENCES Borrowers(BorrowerId) ON DELETE CASCADE
)

CREATE TABLE AuditLog(
BookId INT PRIMARY KEY,
StatusChange VARCHAR(10) NOT NULL CHECK (StatusChange in ('Available', 'Borrowed')),
ChangeDate DATE NOT NULL
)