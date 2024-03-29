﻿---- Create by Nguyễn Hoàng Bảo Thy on 8/21/2017 3:00:12 PM
---- Kết quả phỏng vấn (master)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HRMT2040]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[HRMT2040]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [CandidateID] VARCHAR(50) NOT NULL,
  [RecruitPeriodID] VARCHAR(50) NOT NULL,
  [RequireSalary] DECIMAL(28,8) NULL,
  [DealSalary] DECIMAL(28,8) NULL,
  [Startdate] DATETIME NULL,
  [TrialTime] DECIMAL(28,8) NULL,
  [TrialFromDate] DATETIME NULL,
  [TrialToDate] DATETIME NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_HRMT2040] PRIMARY KEY CLUSTERED
(
  [APK],
  [DivisionID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END
--Thu Hà Create 17/10/2023 --Bổ sung cột DeleteFlg
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name]='HRMT2040' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
	ON col.id=tab.id WHERE tab.name='HRMT2040' and col.name='DeleteFlg')
	ALTER TABLE HRMT2040 ADD DeleteFlg TINYINT DEFAULT 0 NULL
END