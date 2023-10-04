--12.Trigger Implementation
DROP TRIGGER IF EXISTS CheckBookStatusChange;

CREATE TRIGGER CheckBookStatusChange ON Books
AFTER UPDATE AS
BEGIN;
	IF UPDATE([Current Status])
		BEGIN;
			INSERT INTO AuditLog(BookId, StatusChange, ChangeDate) 
			SELECT inserted.BookId, inserted.[Current Status], GETDATE() FROM inserted;
		END;
END;


UPDATE Books SET [Current Status] = 'Borrowed' WHERE BookId = 5;
SELECT * FROM AuditLog;