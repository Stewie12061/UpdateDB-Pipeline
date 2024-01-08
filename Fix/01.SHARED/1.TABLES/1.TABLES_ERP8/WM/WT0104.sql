﻿---- Create by Cao Thị Phượng on 12/7/2017 2:47:22 PM
---- Khai báo số serial (OKIA)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[WT0104]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[WT0104]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [InventoryID] VARCHAR(50) NOT NULL,
  [SerialNo] VARCHAR(50) NOT NULL,
  [Orders] INT NULL,
  [ReleaseDate] DATETIME NULL,
  [IsUsed] TINYINT DEFAULT (0) NULL,
  [CreateDate] DATETIME NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL
CONSTRAINT [PK_WT0104] PRIMARY KEY CLUSTERED
(
  [InventoryID],
  [SerialNo]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END