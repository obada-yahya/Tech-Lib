--10.Genre Preference by Age using Group By and Having: Determine the preferred genre of different age groups of borrowers. (Groups are (0,10), (11,20), (21,30)…)

DROP FUNCTION IF EXISTS getGroupRange;

CREATE FUNCTION getGroupRange(@birth DATE) 
RETURNS VARCHAR(10) AS 
BEGIN;
	DECLARE @ageGroup INT;
	SET @ageGroup = (DATEDIFF(YEAR, @birth, GETDATE()) - 1) / 10;
	RETURN '(' + CAST ( ( 10 * (@ageGroup - 1) + 1) AS VARCHAR(5)) + ',' + CAST ( 10 * @ageGroup AS VARCHAR(5)) + ')';
END;

WITH GenreGroups AS
(
SELECT Genre, dbo.getGroupRange([Date of Birth]) AS [Age Range]
FROM loans 
INNER JOIN Books ON Books.BookId = loans.BookId
INNER JOIN Borrowers ON Borrowers.BorrowerId = loans.BorrowerId
),
GenreFreq AS
(
SELECT Genre, [Age Range], COUNT(*) AS total 
FROM GenreGroups 
GROUP BY Genre, [Age Range]
),
MaximumForEachGroup AS
(
SELECT GenreFreq.[Age Range], MAX(GenreFreq.total) AS [Maximum Count]
FROM GenreFreq 
GROUP BY [Age Range]
)
SELECT GenreFreq.[Age Range], MIN(Genre) AS [Popular Genre] FROM GenreFreq 
INNER JOIN MaximumForEachGroup ON GenreFreq.[Age Range] = MaximumForEachGroup.[Age Range] 
AND GenreFreq.total = MaximumForEachGroup.[Maximum Count]
GROUP BY GenreFreq.[Age Range];