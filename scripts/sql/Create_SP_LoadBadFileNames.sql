SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ernesto Rodriguez, System Analyst
-- Create date: 3/15/2016
-- Description:	Receives a collection of file names
--				that failed renaming process
--				and register them in Medhok.Letter_Exception. 
-- =============================================
CREATE PROCEDURE Medhok.LoadBadFileNames
	@File_Name_Exception AS Bad_File_Name READONLY
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Medhok.Letter_Exception (
											LetterID,
											ExceptionName,
											ExceptionDescription
										)
	SELECT l.LetterID, 
		   'Error creating new ICP letter name',
		   'Unable to change name of [' + b.Name + '] file. Wrong file name format.'
	FROM Medhok.Letter AS l INNER JOIN @File_Name_Exception AS b
		ON l.LetterName = b.Name;

END
GO