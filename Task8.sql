---8.Overdue Analysis: List all books overdue by more than 30 days with their associated borrowers.

WITH loansWithMoreThanThirtyDays AS
(
SELECT BorrowerId,BookId FROM loans WHERE
DATEDIFF(DAY, [Due Date], LEAST([Date Returned], GETDATE())) >= 30
)

SELECT Borrowers.BorrowerId, [First Name], [Last Name], Books.BookId,Title FROM loansWithMoreThanThirtyDays 
INNER JOIN Borrowers ON Borrowers.BorrowerId = loansWithMoreThanThirtyDays.BorrowerId 
INNER JOIN Books ON Books.BookId = loansWithMoreThanThirtyDays.BookId 
ORDER BY Borrowers.BorrowerId;