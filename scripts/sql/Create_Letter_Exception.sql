CREATE TABLE Medhok.Letter_Exception
(
	ID INT IDENTITY(1,1) NOT NULL
		CONSTRAINT idx_letter_exception__id
		PRIMARY KEY CLUSTERED (ID),
	LetterID INT NOT NULL
		CONSTRAINT letter_exception__fkey__letter_id
		FOREIGN KEY(LetterID)
		REFERENCES Medhok.Letter (LetterID)
			ON DELETE CASCADE
			ON UPDATE CASCADE,
	ExceptionName VARCHAR(51) NOT NULL,
	ExceptionDescription VARCHAR(1024) NOT NULL
);
GO