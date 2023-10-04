---1.List of Borrowed Books: Retrieve all books borrowed by a specific borrower, including those currently unreturned

SELECT Loans.BookId, Title, genre FROM LOANS INNER JOIN BOOKS 
ON LOANS.BookID = Books.BookId WHERE Loans.BorrowerID = 157
