---- Create by Phan thanh hoàng vũ on 7/26/2017 3:48:10 PM
---- Cập nhật bảng giá bán OUT (Minhsang)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[OT1302_MS]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[OT1302_MS]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [DetailID] VARCHAR(50) NOT NULL,
  [ID] VARCHAR(50) NOT NULL,
  [InventoryID] VARCHAR(50) NULL,
  [UnitID] VARCHAR(50) NULL,
  [RecievedPrice] DECIMAL(28,8) NULL,
  [RecievedPriceIN] DECIMAL(28,8) NULL,
  [Shifts] DECIMAL(28,8) NULL,
  [ShiftsAmount] DECIMAL(28,8) NULL,
  [CA] DECIMAL(28,8) NULL,
  [CAPrice] DECIMAL(28,8) NULL,
  [CAAmount] DECIMAL(28,8) NULL,
  [GiftPrice] DECIMAL(28,8) NULL,
  [GiftAmount] DECIMAL(28,8) NULL,
  [CalcUnitPrice] DECIMAL(28,8) NULL,
  [RealUnitPrice] DECIMAL(28,8) NULL,
  [NetProfit] DECIMAL(28,8) NULL,
  [RealCA] DECIMAL(28,8) NULL,
  [InstallmentPrice] DECIMAL(28,8) NULL,
  [OrderNo] INT NULL
CONSTRAINT [PK_OT1302_MS] PRIMARY KEY CLUSTERED
(
  [DetailID],
  [ID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'OT1302_MS' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'OT1302_MS' AND col.name = 'InstallmentPrice') 
   ALTER TABLE OT1302_MS ADD InstallmentPrice DECIMAL(28,8) NULL 
END