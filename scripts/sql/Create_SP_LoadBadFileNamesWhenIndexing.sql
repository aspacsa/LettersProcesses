USE testdb;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		Ernesto Rodriguez, System Analyst
-- Create date: 4/7/2016
-- Description:	Receives a collection of file names
--				that failed indexing process
--				and register them in Medhok.Letter_Exception. 
-- =============================================
CREATE PROCEDURE [Medhok].[LoadBadFileNamesWhenIndexing]
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
		   'Error indexing letter.',
		   'Unable to index [' + b.Name + '] file. Wrong file name format.'
	FROM Medhok.Letter AS l INNER JOIN @File_Name_Exception AS b
		ON l.LetterName = b.Name;

END
GO

