CREATE TABLE Medhok.Letter
(
	LetterID   INT IDENTITY(1,1) NOT NULL
		CONSTRAINT idx_letter__letter_id 
		PRIMARY KEY CLUSTERED (LetterID),
	LetterCtrlRecId INT NOT NULL
	CONSTRAINT letter__fkey__letter_ctrl_rec_id
		FOREIGN KEY (LetterCtrlRecId) 
		REFERENCES Medhok.LetterControl (LetterCtrlRecId)
			ON DELETE CASCADE
			ON UPDATE CASCADE,	
	LetterName VARCHAR(133) NOT NULL,
	LetterType VARCHAR(47) NOT NULL,
	Received BIT NOT NULL DEFAULT 0,
	Moved BIT NOT NULL DEFAULT 0,
	InboundDirection BIT NOT NULL DEFAULT 0,
	OriginFolder VARCHAR(1024) NOT NULL DEFAULT 'Unknown',
	MovedTo VARCHAR(1024) NOT NULL DEFAULT 'Unknown'
);
GO