SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- Author:		Ernesto Rodriguez, System Analyst
-- Create date: 2/23/2016
-- Description:	Creates a new entry in LetterControl
--				table representing a new batch received.
-- =============================================
CREATE PROCEDURE Medhok.CreateBatchEntry
	@LetterControlId INT OUTPUT,
	@AppGenId VARCHAR(50) = NULL,
	@ExecutionLogId INT = 0,
	@Company VARCHAR(5) = NULL,
	@BatchStatus VARCHAR(50) = NULL,
	@BatchName VARCHAR(50) = NULL,
	@BatchType VARCHAR(50) = NULL,
	@BatchDate datetime2 = NULL,
	@BatchLetterCount INT = NULL,
	@ManifestName VARCHAR(100) = NULL,
	@BatchError VARCHAR(1024) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @LogCreationDate DATETIME = GETDATE();
	DECLARE @LogModificationTime DATETIME = GETDATE();
	INSERT INTO Medhok.LetterControl (
										AppGenId, 
										ExecutionLogId,
										Company,
										BatchStatus,
										BatchName,
										BatchType,
										BatchDate,
										BatchLetterCount,
										ManifestName,
										BatchError,
										LogCreationDate,
										LogModificationDate
									 ) VALUES (
										@AppGenId,
										@ExecutionLogId,
										@Company,
										@BatchStatus,
										@BatchName,
										@BatchType,
										@BatchDate,
										@BatchLetterCount,
										@ManifestName,
										@BatchError,
										@LogCreationDate,
										@LogModificationTime
									 );
	SET @LetterControlId = SCOPE_IDENTITY();
END
GO