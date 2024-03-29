﻿---- Create by Trọng Kiên on 3/17/2021 3:19:27 PM
---- Đối chiếu nguyên vật liệu

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[OT2205]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[OT2205]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] NVARCHAR(50) NULL,
  [EstimateID] NVARCHAR(50) NULL,
  [TranMonth] INT NULL,
  [TranYear] INT NULL,
  [MaterialID] NVARCHAR(50) NULL,
  [MaterialQuantity] DECIMAL(28,8) NULL,
  [Orders] INT NULL,
  [WareHouseID] NVARCHAR(50) NULL,
  [AKPMaster] UNIQUEIDENTIFIER DEFAULT newid() NULL,
  [S01ID] VARCHAR(50) NULL,
  [S02ID] VARCHAR(50) NULL,
  [S03ID] VARCHAR(50) NULL,
  [S05ID] VARCHAR(50) NULL,
  [S06ID] VARCHAR(50) NULL,
  [S07ID] VARCHAR(50) NULL,
  [S08ID] VARCHAR(50) NULL,
  [S09ID] VARCHAR(50) NULL,
  [S10ID] VARCHAR(50) NULL,
  [S11ID] VARCHAR(50) NULL,
  [S12ID] VARCHAR(50) NULL,
  [S13ID] VARCHAR(50) NULL,
  [S14ID] VARCHAR(50) NULL,
  [S15ID] VARCHAR(50) NULL,
  [S16ID] VARCHAR(50) NULL,
  [S17ID] VARCHAR(50) NULL,
  [S18ID] VARCHAR(50) NULL,
  [S19ID] VARCHAR(50) NULL,
  [S20ID] VARCHAR(50) NULL,
  [S04ID] VARCHAR(50) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL,
  [UnitID] VARCHAR(50) NULL,
  [MaterialName] NVARCHAR(MAX) NULL,
  [UnitName] NVARCHAR(250) NULL,
  [SafeQuantity] DECIMAL(28,8) NULL,
  [EndQuantity] DECIMAL(28,8) NULL,
  [IntendedPickingQuantity] DECIMAL(28,8) NULL,
  [PickingQuantity] DECIMAL(28,8) NULL,
  [SuggestQuantity] DECIMAL(28,8) NULL,
  [TransactionID] VARCHAR(250) NULL,
  [APKMaster] UNIQUEIDENTIFIER DEFAULT newid() NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL
CONSTRAINT [PK_OT2205] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

-------------------- 23/03/2021 - Trọng Kiên: Bổ sung cột WareHouseName --------------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
     ON col.id = tab.id WHERE tab.name = 'OT2205' AND col.name = 'WareHouseName')
BEGIN
  ALTER TABLE OT2205 ADD WareHouseName NVARCHAR (MAX) NULL
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'OT2205' AND xtype = 'U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'OT2205' AND col.name = 'SemiProduct')
	ALTER TABLE OT2205 ADD SemiProduct VARCHAR(50) NULL
END