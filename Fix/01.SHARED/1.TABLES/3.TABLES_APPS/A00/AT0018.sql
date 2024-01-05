﻿---- Create by Đoàn Duy on 10/02/2021
---- 1BOSS Quan hệ Gói - Module lẻ (AT0016 - AT1302)
IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT0018]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[AT0018]
(
  [InventoryID] VARCHAR(50) NOT NULL,
  [PackageID] NVARCHAR(50) NOT NULL, 
  [IsStandard] TINYINT DEFAULT 0 NULL,

CONSTRAINT [AT0018_PK] PRIMARY KEY CLUSTERED
(
  [InventoryID],[PackageID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

---------------- 25/03/2022 - Hoài Bảo: Bổ sung cột APK ----------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'AT0018' AND col.name = 'APK')
BEGIN
	ALTER TABLE AT0018 ADD APK UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL
END