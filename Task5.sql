---5.Stored Procedure - Add New Borrowers.

DROP PROCEDURE IF EXISTS sp_AddNewBorrower;

CREATE PROCEDURE sp_AddNewBorrower(@FirstName VARCHAR(50), @LastName VARCHAR(50), @email VARCHAR(50), @DateOfBirth DATE, @MembershipDate DATE)
AS
BEGIN;
	DECLARE @invalidOperation INT;
	SET @invalidOperation = 50001;
	IF EXISTS (SELECT Email FROM Borrowers WHERE Borrowers.email = @email)
		THROW @invalidOperation, 'Email Already Exists.', 1;
	ELSE
		BEGIN;
			INSERT INTO Borrowers([First Name], [Last Name], Email, [Date of Birth], [Membership Date])
			VALUES(@FirstName, @LastName, @email, @DateOfBirth, @MembershipDate);
			PRINT 'Successful Borrower Insertion';
		END;
END;

EXEC sp_AddNewBorrower
@FirstName = 'obada',
@LastName = 'yahya',
@email='obadayahya@gmail.com',
@DateOfBirth = '2001-8-22',
@MembershipDate = '2017-8-22';