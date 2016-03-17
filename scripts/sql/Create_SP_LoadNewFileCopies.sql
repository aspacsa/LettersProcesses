SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ernesto Rodriguez, System Analyst
-- Create date: 3/14/2016
-- Description:	Receives a collection of file names
--				and stores them into the table
--				Medhok.Letter_Copy in order to 
--				register new name of files copies.
-- =============================================
CREATE PROCEDURE Medhok.LoadNewFileCopies
	@New_File_copy AS Good_File_Copy READONLY
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Medhok.Letter_Copy (
									LetterID,
									LetterName
							       )
	SELECT l.LetterID, c.NewFileName
	FROM Medhok.Letter AS l INNER JOIN @New_File_copy AS c
		ON l.LetterName = c.PreviousFileName;

END
GO