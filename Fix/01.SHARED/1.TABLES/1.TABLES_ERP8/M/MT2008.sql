-- <Summary>
---- Quản lý Detail phiếu giao việc - Custmize Secoin = 43 
-- <History>
---- Create on 16/02/2015 by Phan thanh hoàng Vũ
---- Modified on 16/06/2015 by Hoàng Vũ, Bổ sung thêm 5 tham số
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MT2008]') AND type in (N'U'))
CREATE TABLE [dbo].[MT2008](
	[APK] [uniqueidentifier] DEFAULT NEWID(),
	[DivisionID] [nvarchar](3) NOT NULL,
	[TransactionID] [nvarchar](50) NOT NULL,
	[VoucherID] [nvarchar](50) NOT NULL,
	
	[IsPicking] tinyint Not Null,--Giữ chỗ
	[WareHouseID] [nvarchar](50) NULL,--Kho giữ chỗ
	[RInventoryID] [nvarchar](50) NULL,--Mã Rập
	[InventoryID] [nvarchar](50) NULL,--Mã hàng
	[InventoryCommonName] [nvarchar](250) NULL,
	[UnitID] [nvarchar](50) NULL,--Đơn vị tính [Mặt hàng]
	[Quantity] [decimal](28, 8) NULL,
	[ConvertedQuantity] [decimal](28, 8) NULL,
	[Orders] [int] NULL,		
	[Description] [nvarchar](250) NULL,
	[Notes01] [nvarchar](250) NULL,
	[Notes02] [nvarchar](250) NULL,
	[Notes03] [nvarchar](250) NULL,
	[Ana01ID] [nvarchar](50) NULL,
	[Ana02ID] [nvarchar](50) NULL,
	[Ana03ID] [nvarchar](50) NULL,
	[Ana04ID] [nvarchar](50) NULL,
	[Ana05ID] [nvarchar](50) NULL,
	[Ana06ID] [nvarchar](50) NULL,
	[Ana07ID] [nvarchar](50) NULL,
	[Ana08ID] [nvarchar](50) NULL,
	[Ana09ID] [nvarchar](50) NULL,
	[Ana10ID] [nvarchar](50) NULL,	
	[nvarchar01] [nvarchar](100) NULL,
	[nvarchar02] [nvarchar](100) NULL,
	[nvarchar03] [nvarchar](100) NULL,
	[nvarchar04] [nvarchar](100) NULL,
	[nvarchar05] [nvarchar](100) NULL,
	[nvarchar06] [nvarchar](100) NULL,
	[nvarchar07] [nvarchar](100) NULL,
	[nvarchar08] [nvarchar](100) NULL,
	[nvarchar09] [nvarchar](100) NULL,
	[nvarchar10] [nvarchar](100) NULL,
	[InheritTableID] [nvarchar](50) NULL, --ID kế thừa
	[InheritVoucherID] [nvarchar](50) NULL, --ID kế thừa 
	[InheritTransactionID] [nvarchar](50) NULL --ID kế thừa 
 CONSTRAINT [PK_MT2008] PRIMARY KEY NONCLUSTERED 
(
	[DivisionID],
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

----Add Columns
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT2008' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT2008' AND col.name='Parameter01')
		ALTER TABLE MT2008 ADD Parameter01 DECIMAL(28,8) NULL
	END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT2008' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT2008' AND col.name='Parameter02')
		ALTER TABLE MT2008 ADD Parameter02 DECIMAL(28,8) NULL
	END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT2008' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT2008' AND col.name='Parameter03')
		ALTER TABLE MT2008 ADD Parameter03 DECIMAL(28,8) NULL
	END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT2008' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT2008' AND col.name='Parameter04')
		ALTER TABLE MT2008 ADD Parameter04 DECIMAL(28,8) NULL
	END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT2008' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT2008' AND col.name='Parameter05')
		ALTER TABLE MT2008 ADD Parameter05 DECIMAL(28,8) NULL
	END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'MT2008' AND xtype = 'U') --Secoin Lưu thông tin mã phụ
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id = tab.id WHERE tab.name = 'MT2008' AND col.name = 'ExtraID')
		ALTER TABLE MT2008 ADD ExtraID NVARCHAR(50) NULL
	END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'MT2008' AND xtype = 'U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id = tab.id WHERE tab.name = 'MT2008' AND col.name = 'RInventoryTypeID')
		ALTER TABLE MT2008 ADD RInventoryTypeID NVARCHAR(50) NULL
	END	