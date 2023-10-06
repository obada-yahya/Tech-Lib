CREATE INDEX idx_Loans_BookId ON Loans(BookId);
CREATE INDEX idx_Loans_BorrowerID ON Loans(BorrowerID);
CREATE INDEX idx_Loans_DateReturned ON Loans([Date Returned]);
CREATE INDEX idx_Borrowers_email ON Borrowers(email);