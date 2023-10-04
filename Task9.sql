--9.Author Popularity using Aggregation: Rank authors by the borrowing frequency of their books.

WITH BooksBorrowingFreq(BookId,total) AS 
(
SELECT BookId, COUNT(*) FROM Loans 
GROUP BY BookId
),
AuthorsTotalBorrowingBooks AS 
(
SELECT Author, SUM(total) AS total FROM Books 
INNER JOIN BooksBorrowingFreq ON BooksBorrowingFreq.BookId = Books.BookId 
GROUP BY Author 
)
SELECT Author, DENSE_RANK() OVER (ORDER BY total DESC) AS [Borrowing Rank] 
FROM AuthorsTotalBorrowingBooks;
