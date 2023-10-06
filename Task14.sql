--14.SQL Stored Procedure with Temp Table:

DROP PROCEDURE IF EXISTS sp_GetOverDueBooks;

CREATE PROCEDURE sp_GetOverDueBooks AS
BEGIN;
	WITH borrowersOverDueBooks AS
	(
	SELECT loans.BorrowerId,BookId, [First Name], [Last Name] FROM loans 
	INNER JOIN Borrowers ON Borrowers.BorrowerId = loans.BorrowerId
	WHERE [Date Returned] > [Due Date] OR ([Date Returned] IS NULL AND GETDATE() > [Due Date])
	)
	SELECT [First Name], [Last Name], borrowersOverDueBooks.BorrowerId, Books.Title 
	FROM borrowersOverDueBooks INNER JOIN Books ON books.BookId = borrowersOverDueBooks.BookId
END;

EXEC sp_GetOverDueBooks;