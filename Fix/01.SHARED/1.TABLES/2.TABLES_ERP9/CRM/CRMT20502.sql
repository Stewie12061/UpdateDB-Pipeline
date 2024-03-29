﻿---- Create by Đình Hòa 10/12/2020
---- Lưu lại các giai đoạn của cơ hội

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CRMT20502]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CRMT20502]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [APKMaster] UNIQUEIDENTIFIER NULL,
  [StageID] VARCHAR(50) NULL,
  [Rate] DECIMAL(28,8) NULL,
  [ExpectAmount] DECIMAL(28,8) NULL,
  [CauseID] VARCHAR(50) NULL,
  [CampaignID] VARCHAR(50) NULL,
  [SourceID] VARCHAR(50) NULL,
  [AssignedToUserID] VARCHAR(50) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_CRMT20502] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END