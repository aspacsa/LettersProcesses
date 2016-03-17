CREATE TABLE Medhok.Batch_Exception
(
	ID INT IDENTITY(1,1) NOT NULL
		CONSTRAINT idx_batch_exception__id
		PRIMARY KEY CLUSTERED (ID),
	LetterControlRecID INT NOT NULL
		CONSTRAINT batch_exception__fkey__letter_id
		FOREIGN KEY(LetterControlRecID)
		REFERENCES Medhok.LetterControl (LetterCtrlRecID)
			ON DELETE CASCADE
			ON UPDATE CASCADE,
	ExceptionName VARCHAR(51) NOT NULL,
	ExceptionDescription VARCHAR(1024) NOT NULL
);
GO