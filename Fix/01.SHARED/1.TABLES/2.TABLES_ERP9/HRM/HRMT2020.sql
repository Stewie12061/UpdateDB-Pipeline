﻿---- Create by Nguyễn Hoàng Bảo Thy on 8/14/2017 1:55:05 PM
---- Đợt tuyển dụng: Thông tin TD

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HRMT2020]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[HRMT2020]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [RecruitPeriodID] VARCHAR(50) NOT NULL,
  [RecruitPeriodName] NVARCHAR(1000) NULL,
  [RecruitPlanID] VARCHAR(50) NULL,
  [DepartmentID] VARCHAR(50) NULL,
  [DutyID] VARCHAR(50) NULL,
  [PeriodFromDate] DATETIME NULL,
  [PeriodToDate] DATETIME NULL,
  [ReceiveFromDate] DATETIME NULL,
  [ReceiveToDate] DATETIME NULL,
  [RecruitQuantity] DECIMAL(28,8) NULL,
  [WorkPlace] NVARCHAR(1000) NULL,
  [WorkType] VARCHAR(50) NULL,
  [RequireDate] DATETIME NULL,
  [Cost] DECIMAL(28,8) NULL,
  [Note] NVARCHAR(1000) NULL,
  [TotalLevel] INT NULL,
  [InheritRecruitPeriodID] VARCHAR(50) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_HRMT2020] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [RecruitPeriodID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

--- 12/10/2023 - Phương Thảo: Bổ sung cột DeleteFlg
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='HRMT2020' AND xtype='U')
	BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='HRMT2020' AND col.name='DeleteFlg')
		ALTER TABLE HRMT2020 ADD DeleteFlg TINYINT DEFAULT (0) NULL
	END
