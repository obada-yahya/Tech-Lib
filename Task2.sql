---2.Active Borrowers with CTEs: Identify borrowers who've borrowed 2 or more books but haven't returned any using CTEs

WITH BorrowersIdHaveMoreThanOne AS
(
SELECT BorrowerID FROM Loans WHERE [Date Returned] is NULL 
GROUP BY BorrowerID HAVING COUNT(*) > 1
)
SELECT Borrowers.BorrowerID, Borrowers.[First Name], Borrowers.[Last Name]
FROM Borrowers INNER JOIN BorrowersIdHaveMoreThanOne 
ON Borrowers.BorrowerID = BorrowersIdHaveMoreThanOne.BorrowerID;