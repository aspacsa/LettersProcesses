CREATE TABLE Medhok.Letter_Copy
(
	ID INT IDENTITY(1,1) NOT NULL
		CONSTRAINT idx_letter_copy__id
			PRIMARY KEY CLUSTERED (ID),
	LetterID INT NOT NULL
		CONSTRAINT letter_copy__fkey__letter_id
			FOREIGN KEY(LetterID)
			REFERENCES Medhok.Letter (LetterID)
				ON DELETE CASCADE
				ON UPDATE CASCADE,	
	LetterName VARCHAR(133) NOT NULL,
	InboundDirection BIT NOT NULL DEFAULT 0,
	MovedTo VARCHAR(1024) NOT NULL DEFAULT 'Unknown',
);
GO