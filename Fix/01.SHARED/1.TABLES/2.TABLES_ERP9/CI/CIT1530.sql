---- Create by Nhật Thanh on 26/04/2023
---- Ví chiết khấu tích lũy
---- DROP TABLE CIT1530
IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CIT1530]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CIT1530]
(
	[APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
	[DivisionID] nvarchar(50) NULL,
	[ObjectID] nvarchar(50) NOT NULL,
	[ObjectName] nvarchar(250) NOT NULL,
	[SOrderID] nvarchar(50) NULL,
	[OrderDate] DateTime NULL,
	[OrderAmount] Decimal(28,8) NULL,
	[DiscountValue] Decimal(28,8) NULL,
	[DiscountRate] Decimal(28,8) NULL,
	[InventoryGiftID] nvarchar(250) NULL,
	[InventoryGiftName] nvarchar(250) NULL,
	[Notes] nvarchar(250) NULL,
	[DiscountTypeID] nvarchar(250) NULL,
	[KindDiscountID] int NOT NULL,
	[GiftDate] DateTime NULL,
	[UsedDate] DateTime NULL,
	[IsAvailable] TINYINT default 0 NULL,
	[CreateUserID] VARCHAR(50) NULL,
	[CreateDate] DATETIME NULL,
	[LastModifyUserID] VARCHAR(50) NULL,
	[LastModifyDate] DATETIME NULL
CONSTRAINT [PK_CIT1530] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CIT1530' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CIT1530' AND col.name = 'GiftQuantity') 
   ALTER TABLE CIT1530 ADD GiftQuantity INT NULL 
END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CIT1530' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CIT1530' AND col.name = 'PromoteID') 
   ALTER TABLE CIT1530 ADD PromoteID VARCHAR(50) NULL 
END
-------------06/10/2023 - Updated by Thanh Lượng: Bổ sung cột DiscountScores
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CIT1530' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CIT1530' AND col.name = 'DiscountScores') 
   ALTER TABLE CIT1530 ADD DiscountScores Decimal(28,8) NULL 
END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CIT1530' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CIT1530' AND col.name = 'APKCIT1222') 
   ALTER TABLE CIT1530 ADD APKCIT1222 VARCHAR(50) NULL  
END