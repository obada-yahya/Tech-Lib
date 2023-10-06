---6.Database Function - Calculate Overdue Fees.

DROP FUNCTION IF EXISTS fn_CalculateOverdueFees;

CREATE FUNCTION fn_CalculateOverdueFees(@loanId INT)
RETURNS DECIMAL AS 
BEGIN
	DECLARE @totalFees DECIMAL, @returnedDate DATE,
	@DueDate DATE, @totalDays INT;
	SET @totalFees = 0; 
	SET @totalDays = 0;
	SELECT @returnedDate = [Date Returned], @DueDate = [Due Date] FROM loans WHERE LoanId = @loanId;
	IF @returnedDate is NULL 
		SELECT @returnedDate = GetDate();

	IF @DueDate >= GETDATE() OR @returnedDate <= @DueDate RETURN 0;
	SET @totalDays = DATEDIFF(day, @DueDate, @returnedDate)
	SELECT @totalFees = least(30, @totalDays);

	SET @totalDays -= @totalFees;
	SET @totalFees += @totalDays * 2;

	RETURN @totalFees;
END;

SELECT dbo.fn_CalculateOverdueFees(86) AS [Total Fees];