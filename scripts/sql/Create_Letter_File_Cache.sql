CREATE TABLE Medhok.Letter_File_Cache
(
	LetterName VARCHAR(133) NOT NULL,
	LetterPath VARCHAR(1024) NOT NULL DEFAULT 'Unknown'
);
GO
IF EXISTS(SELECT name FROM sys.indexes WHERE name = 'idx_letter_file_cache__letter_name') BEGIN
	DROP INDEX idx_letter_file_cache__letter_name ON Medhok.Letter_File_Cache;
END;
GO
CREATE CLUSTERED INDEX idx_letter_file_cache__letter_name
	ON Medhok.Letter_File_Cache (LetterName);
GO