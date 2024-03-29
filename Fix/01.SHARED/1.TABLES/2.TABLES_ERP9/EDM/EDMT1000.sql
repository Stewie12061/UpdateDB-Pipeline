﻿---- Create by Nguyễn Thị Minh Hòa on 29/8/2018 2:29:31 PM
---- Danh mục khối 

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[EDMT1000]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[EDMT1000]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [LevelID] VARCHAR(50) NOT NULL,
  [GradeID] VARCHAR(50) NOT NULL,
  [GradeName] NVARCHAR(250) NULL,
  [Notes] NVARCHAR(250) NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL,
  [Disabled] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_EDMT1000] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [GradeID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END



