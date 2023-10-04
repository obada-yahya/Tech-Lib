--11.Stored Procedure - Borrowed Books Report:

DROP PROCEDURE IF EXISTS sp_BorrowedBooksReport

CREATE PROCEDURE sp_BorrowedBooksReport(@StartDate DATE, @EndDate DATE)
AS 
BEGIN;
	SELECT [First Name], [Last Name], loans.BookId,loans.BorrowerId, [Date Borrowed] FROM loans
	INNER JOIN Borrowers ON Borrowers.BorrowerId = loans.BorrowerId
	INNER JOIN Books ON Books.BookId = loans.BookId
	WHERE [Date Borrowed] BETWEEN @StartDate AND @EndDate
END;


EXEC sp_BorrowedBooksReport '2023-08-20','2023-10-01';