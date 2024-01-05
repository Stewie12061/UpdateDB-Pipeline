﻿---- Create by Le Hoang on 24/11/2020
---- Bảng thiet lap ky

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[QCT9999]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[QCT9999](
	APK	UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
	DivisionID	VARCHAR(50) NOT NULL,
	TranMonth	INT	NULL,	
	TranYear	INT	NULL,	
	Closing		TINYINT	NULL DEFAULT (0),
	BeginDate	DATETIME NULL,
	EndDate		DATETIME NULL	
 CONSTRAINT [PK_QCT9999] PRIMARY KEY CLUSTERED 
(
	[APK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
