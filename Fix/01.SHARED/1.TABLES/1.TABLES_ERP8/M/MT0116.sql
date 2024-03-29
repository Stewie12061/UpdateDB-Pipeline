-- <Summary>
---- Bảng giá vốn sản phẩm - Detail [Customize Index: 36 - Sài Gòn Petro]
-- <History>
---- Create on 24/09/2014 by Lê Thị Hạnh 
---- Modified on 14/01/2015 by Lê Thị Hạnh: Bổ sung các trường phục vụ thay đổi cách tính giá vốn [Pharse02]
---- Modified on 13/04/2015 by Lê Thị Hạnh: Bổ sung lưu số lượng cho bao bì
---- Modified on 13/04/2015 by Lê Thị Hạnh: Bổ sung lưu Inherit cho bảng giá vốn
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MT0116]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[MT0116]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [VoucherID] NVARCHAR(50) NOT NULL,
      [TransactionID] NVARCHAR(50) NOT NULL,
      [MaterialID] NVARCHAR(50) NULL,
      [TypeID] TINYINT NOT NULL, -- 1: BaseOil - dầu gốc , 2: Additive - phụ gia, 3: Packings - Bao bì
      [Orders] INT NULL,
      [UnitPrice] DECIMAL(28,8) NULL,
      [VATImPercent] DECIMAL(28,8) NULL,
      [VATPercent] DECIMAL(28,8) NULL,
      [ConvertedAmount] DECIMAL(28,8) NULL
    CONSTRAINT [PK_MT0116] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [TransactionID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
---- Add Columns
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT0116' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT0116' AND col.name='Quantity')
		ALTER TABLE MT0116 ADD Quantity DECIMAL(28,8) NULL
	END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT0116' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT0116' AND col.name='InheritTableID')
		ALTER TABLE MT0116 ADD InheritTableID NVARCHAR(50) NULL
	END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT0116' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT0116' AND col.name='InheritVoucherID')
		ALTER TABLE MT0116 ADD InheritVoucherID NVARCHAR(50) NULL
	END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT0116' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT0116' AND col.name='InheritTransactionID')
		ALTER TABLE MT0116 ADD InheritTransactionID NVARCHAR(50) NULL
	END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT0116' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT0116' AND col.name='InheritPCID')
		ALTER TABLE MT0116 ADD InheritPCID NVARCHAR(50) NULL
	END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT0116' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT0116' AND col.name='InheritAnaID')
		ALTER TABLE MT0116 ADD InheritAnaID NVARCHAR(50) NULL
	END

		---- Add Columns Huỳnh Thử [25/07/2020]-- Fix lỗi chạy tool run all Fix
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT0116' AND xtype='U')
	BEGIN

		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT0116' AND col.name='Orders')
		ALTER TABLE MT0116 ADD Orders INT  NULL

	END
