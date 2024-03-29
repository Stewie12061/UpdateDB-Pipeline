---- Create by Phan thanh hoàng vũ on 3/7/2018 3:17:33 PM
---- Khuyến mãi tặng hàng theo hóa đơn (Detail 02)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CT0151]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CT0151]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [PromoteID] VARCHAR(50) NOT NULL,
  [VoucherID] UNIQUEIDENTIFIER NOT NULL,
  [InventoryID] VARCHAR(50) NOT NULL,
  [InventoryName] NVARCHAR(250) NOT NULL,
  [UnitID] VARCHAR(50) NULL,
  [IsGift] TINYINT DEFAULT (0) NULL,
  [Quantity] DECIMAL(28,8) NULL
CONSTRAINT [PK_CT0151] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [PromoteID],
  [VoucherID],
  [InventoryID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CT0151' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CT0151' AND col.name = 'OrderNo') 
   ALTER TABLE CT0151 ADD OrderNo INT NULL 
END

/*===============================================END OrderNo===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CT0151' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CT0151' AND col.name = 'IsDefault') 
   ALTER TABLE CT0151 ADD IsDefault TINYINT NULL 
END

/*===============================================END IsDefault===============================================*/