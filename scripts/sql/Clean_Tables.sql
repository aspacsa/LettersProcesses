ALTER TABLE Medhok.Batch_Exception DROP CONSTRAINT batch_exception__fkey__letter_id;
TRUNCATE TABLE Medhok.Batch_Exception;
DBCC CHECKIDENT('Medhok.Batch_Exception');
GO

ALTER TABLE Medhok.Letter_Exception DROP CONSTRAINT letter_exception__fkey__letter_id;
TRUNCATE TABLE Medhok.Letter_Exception;
DBCC CHECKIDENT('Medhok.Letter_Exception');
GO

ALTER TABLE Medhok.Letter_Copy DROP CONSTRAINT letter_copy__fkey__letter_id;
TRUNCATE TABLE Medhok.Letter_Copy;
DBCC CHECKIDENT('Medhok.Letter_Copy');
GO

ALTER TABLE Medhok.Letter DROP CONSTRAINT idx_letter__letter_id;
TRUNCATE TABLE Medhok.Letter;
DBCC CHECKIDENT('Medhok.Letter');
ALTER TABLE Medhok.Letter ADD CONSTRAINT
idx_letter__letter_id 
		PRIMARY KEY CLUSTERED (LetterID);
GO

ALTER TABLE Medhok.Letter_Exception ADD CONSTRAINT letter_exception__fkey__letter_id
		FOREIGN KEY(LetterID)
		REFERENCES Medhok.Letter (LetterID)
			ON DELETE CASCADE
			ON UPDATE CASCADE;
GO

ALTER TABLE Medhok.Batch_Exception ADD CONSTRAINT batch_exception__fkey__letter_id
		FOREIGN KEY(LetterControlRecID)
		REFERENCES Medhok.LetterControl (LetterCtrlRecID)
			ON DELETE CASCADE
			ON UPDATE CASCADE;
GO

ALTER TABLE Medhok.Letter_Copy ADD CONSTRAINT letter_copy__fkey__letter_id
			FOREIGN KEY(LetterID)
			REFERENCES Medhok.Letter (LetterID)
				ON DELETE CASCADE
				ON UPDATE CASCADE;
GO

TRUNCATE TABLE Medhok.CM_Manifest_Cache;
TRUNCATE TABLE Medhok.Letter_File_Cache;
GO
--------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
