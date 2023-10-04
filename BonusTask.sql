-- Bouns.Weekly peak days

WITH frequencyDays AS 
(
SELECT DATENAME(WEEKDAY, [Date Borrowed]) AS [day], COUNT(*) AS [total]
FROM loans GROUP BY DATENAME(WEEKDAY, [Date Borrowed])
),
totalSum(total) AS 
( 
SELECT SUM(total) FROM frequencyDays
)
SELECT TOP 3 [Day], CAST( ([total] / (SELECT CAST( (SELECT total FROM totalSum) AS FLOAT))) * 100 
AS DECIMAL(12,2)) AS [Percentage of Loans] FROM frequencyDays ORDER BY total DESC;
