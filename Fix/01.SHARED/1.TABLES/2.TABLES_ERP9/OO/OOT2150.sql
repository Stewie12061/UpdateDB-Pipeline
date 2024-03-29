﻿---- Create by Đắc Luân on 10/31/2019 5:43:04 PM
---- Đánh giá dự án

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[OOT2150]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[OOT2150]
(
	[APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
	[APKMaster] UNIQUEIDENTIFIER NOT NULL,
	[DivisionID] VARCHAR(50) NULL,
	[ProjectID] VARCHAR(50) NULL,
	[LeaderID] VARCHAR(250) NULL,
	[StatusID] VARCHAR(50) NULL,
	[CreateDate] DATETIME NULL,
	[CreateUserID] VARCHAR(50) NULL,
	[LastModifyDate] DATETIME NULL,
	[LastModifyUserID] VARCHAR(50) NULL,
	[Mark] INT NULL,
	[Note] NVARCHAR(500) NULL,
	[AssessUserID] VARCHAR(50) NULL,
	[TargetsGroupID] VARCHAR(50) NULL,
	[AssessRequired] TINYINT NULL,
	[AssessOrder] INT NULL,
	[ProjectName] NVARCHAR(250) NULL,
	[ProjectType] INT NULL,
	[ProjectDescription] NVARCHAR(max) NULL,
	[StartDate] DATETIME NULL,
	[EndDate] DATETIME NULL,
CONSTRAINT [PK_OOT2150] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

