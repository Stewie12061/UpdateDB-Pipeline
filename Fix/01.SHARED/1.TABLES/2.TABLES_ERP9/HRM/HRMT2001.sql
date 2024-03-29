﻿---- Create by Nguyễn Hoàng Bảo Thy on 7/27/2017 5:09:25 PM
---- Kế hoạch tuyển dụng (Detail)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HRMT2001]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[HRMT2001]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [RecruitPlanID] VARCHAR(50) NOT NULL,
  [DutyID] VARCHAR(50) NOT NULL,
  [WorkPlace] NVARCHAR(1000) NULL,
  [Quantity] INT NULL,
  [WorkType] VARCHAR(5) NULL,
  [RecruitCost] DECIMAL(28,8) NULL,
  [RequireDate] DATETIME NULL,
  [Note] NVARCHAR(250) NULL,
  [Status] TINYINT DEFAULT (0) NULL
CONSTRAINT [PK_HRMT2001] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [RecruitPlanID],
  [DutyID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

---------------- 05/10/2022 - Tấn Lộc: Update độ dài dữ liệu cột Note ----------------
IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'HRMT2001' AND col.name = 'Note')
BEGIN
	ALTER TABLE HRMT2001 ALTER COLUMN Note NVARCHAR(MAX) NULL
END