CREATE TABLE Medhok.Batch_Process
(
	ExecutionLogId INT NOT NULL
		CONSTRAINT pkey__batch_process__execution_log_id
			PRIMARY KEY CLUSTERED,
	Name VARCHAR(53) NOT NULL,
	Successful BIT NOT NULL DEFAULT 0,
	ErrorMessage VARCHAR(1024) DEFAULT 'None',
	StartedAt DATETIME2 NOT NULL DEFAULT(SYSDATETIME()),
	EndedAt DATETIME2 NULL
);
GO