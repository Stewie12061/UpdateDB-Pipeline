﻿---- Create by Thái Huỳnh Khả Vi on 12/18/2017 11:55:56 AM
---- Danh sách báo cáo 

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[BT8888]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[BT8888]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [ReportID] VARCHAR(50) NOT NULL,
  [ReportName] NVARCHAR(250) NULL,
  [ReportNameE] NVARCHAR(250) NULL,
  [Title] NVARCHAR(250) NULL,
  [TitleE] NVARCHAR(250) NULL,
  [Description] NVARCHAR(250) NULL,
  [DescriptionE] NVARCHAR(250) NULL,
  [GroupID] NVARCHAR(250) NULL,
  [Type] TINYINT NULL,
  [SQLstring] NVARCHAR(4000) NULL,
  [Orderby] NVARCHAR(1000) NULL,
  [Disabled] TINYINT DEFAULT 0 NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL
CONSTRAINT [PK_BT8888] PRIMARY KEY CLUSTERED
(
  [ReportID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END