﻿---- Create by Nguyễn Hoàng Bảo Thy on 8/24/2017 2:12:40 PM
---- Kết quả phỏng vấn chi tiết

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HRMT2042]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[HRMT2042]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [APKMaster] VARCHAR(50) NOT NULL,
  [ReAPK] VARCHAR(50) NOT NULL,
  [InterviewTypeID] VARCHAR(50) NULL,
  [DetailTypeID] VARCHAR(50) NULL,
  [InterviewResult] NVARCHAR(2000) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_HRMT2042] PRIMARY KEY CLUSTERED
(
  [APK],
  [DivisionID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END