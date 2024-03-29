-- <Summary>
---- Bảng giá vốn sản phẩm - Master [Customize Index: 36 - Sài Gòn Petro]
-- <History>
---- Create on 24/09/2014 by Lê Thị Hạnh 
---- Modified on 14/01/2015 by Lê Thị Hạnh: Bổ sung các trường phục vụ thay đổi cách tính giá vốn [Pharse02]
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MT0115]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[MT0115]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [VoucherID] NVARCHAR(50) NOT NULL,
      [TranMonth] INT NULL,
      [TranYear] INT NULL,
      [VoucherTypeID] NVARCHAR(50) NULL,
      [VoucherNo] NVARCHAR(50) NULL,
      [VoucherDate] DATETIME NULL,
      [CostAmount] DECIMAL(28,8) NULL,
      [CurrencyID] NVARCHAR(50) NULL,
      [ExchangeRate] DECIMAL(28,8) NULL,
      [PMID] NVARCHAR(50) NULL,
      [PriceListID] NVARCHAR(50) NULL,
      [ProductID] NVARCHAR(50) NULL,
      [IsVND] TINYINT NULL,
      [Description] NVARCHAR(250) NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_MT0115] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [VoucherID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END

	---- Add Columns Huỳnh Thử [25/07/2020]-- Fix lỗi chạy tool run all Fix
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT0115' AND xtype='U')
	BEGIN

		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT0115' AND col.name='PMID')
		ALTER TABLE MT0115 ADD PMID NVARCHAR(50) NULL

	END
