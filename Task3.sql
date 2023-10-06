---3.Borrowing Frequency using Window Functions: Rank borrowers based on borrowing frequency.

WITH BorrowersTotalBorrowedBooks AS
(
SELECT BorrowerID AS id, COUNT(*) AS Total 
FROM Loans GROUP BY BorrowerID
),
BorrwersInfo AS
(
SELECT BorrowerID, [first name], [last name], [total] 
FROM BorrowersTotalBorrowedBooks 
INNER JOIN Borrowers ON Borrowers.BorrowerID = BorrowersTotalBorrowedBooks.id
)

SELECT BorrowerID, [first name], [last name], DENSE_RANK() 
OVER(ORDER BY Total DESC) AS [Freq rank] 
FROM BorrwersInfo ORDER BY [Freq rank];