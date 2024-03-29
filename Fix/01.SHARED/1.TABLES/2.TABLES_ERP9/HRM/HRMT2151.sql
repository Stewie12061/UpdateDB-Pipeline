﻿---- Create by Huỳnh Thử on 11/2/2020 11:28:37 AM
---- Danh sách BlackList (Detaile)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HRMT2151]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[HRMT2151]
(
  [DivisionID] VARCHAR(50) NOT NULL,
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [APKMaster] UNIQUEIDENTIFIER NULL,
  [EmployeeID] NVARCHAR(250) NULL,
  [DescriptionDetail] NVARCHAR(500) NOT NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_HRMT2151] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END