--7.Database Function - Book Borrowing Frequency:

DROP FUNCTION IF EXISTS fn_BookBorrowingFrequency 

CREATE FUNCTION fn_BookBorrowingFrequency (@BookId INT)
RETURNS INT AS
BEGIN;
	DECLARE @total INT;
	SELECT @total = COUNT(*) FROM loans WHERE BookId = @BookId;
	RETURN @total;
END;

SELECT [dbo].fn_BookBorrowingFrequency(4) AS Total;