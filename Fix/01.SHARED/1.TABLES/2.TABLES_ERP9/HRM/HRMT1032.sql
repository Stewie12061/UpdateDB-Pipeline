﻿---- Create by Nguyễn Hoàng Bảo Thy on 7/21/2017 2:35:59 PM
---- Thông tin học vấn hồ sơ ứng viên

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HRMT1032]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[HRMT1032]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [CandidateID] VARCHAR(50) NOT NULL,
  [EducationLevelID] VARCHAR(50) NULL,
  [InformaticsLevel] VARCHAR(50) NULL,
  [PoliticsID] VARCHAR(50) NULL,
  [Language1ID] VARCHAR(50) NULL,
  [Language2ID] VARCHAR(50) NULL,
  [Language3ID] VARCHAR(50) NULL,
  [LanguageLevel1ID] VARCHAR(50) NULL,
  [LanguageLevel2ID] VARCHAR(50) NULL,
  [LanguageLevel3ID] VARCHAR(50) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_HRMT1032] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [CandidateID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

---------------- 05/10/2022 - Tấn Lộc: Update độ dài dữ liệu cột CandidateID ----------------
IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'HRMT1032' AND col.name = 'CandidateID')
BEGIN
	ALTER TABLE HRMT1032 ALTER COLUMN CandidateID VARCHAR(250) NOT NULL
END