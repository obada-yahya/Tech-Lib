--4.Popular Genre Analysis using Joins and Window Functions: Identify the most popular genre for a given month.

WITH TotalGenresCount AS 
(
SELECT Genre, MONTH([Date Borrowed]) AS MON, COUNT(*) AS total
FROM loans INNER JOIN BOOKS ON Books.BookId = Loans.BookId 
GROUP BY Genre, MONTH([Date Borrowed])),
PopularGenres AS (SELECT Genre, Mon, ROW_NUMBER() OVER(PARTITION BY Mon ORDER BY total DESC) AS [order] FROM TotalGenresCount
)
SELECT Genre FROM PopularGenres WHERE MON = 3 AND [order] = 1

