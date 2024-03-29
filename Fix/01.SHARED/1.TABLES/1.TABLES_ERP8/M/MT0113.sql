-- <Summary>
---- Khai báo công thức sản xuất [Customize Index: 36 - Sài Gòn Petro] - Master
-- <History>
---- Create on 24/09/2014 by Lê Thị Hạnh 
---- Modified on 13/01/2015 by  Lê Thị Hạnh: Khai báo công thức sản phẩm
---- Modified on 15/04/2015 by Lê Thị Hạnh: Khai báo công thức sản xuất [Customize Index: 36 - Sài Gòn Petro] - Master
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MT0113]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[MT0113]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [ID] NVARCHAR(50) NOT NULL,
      [Description] NVARCHAR(250) NULL,
      [ProductID] NVARCHAR(50) NULL,
      [MixVoucherID] NVARCHAR(50) NULL,
      [ProductQuantity] DECIMAL(28,8) NULL,
      [Notes02] DECIMAL(28,8) NULL,
      [TotalVolume] DECIMAL(28,8) NULL,
      [FromDate] DATETIME NULL,
      [ToDate] DATETIME NULL,
      [PInventoryTypeID] NVARCHAR(50) NULL,
      [Disabled] TINYINT NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_MT0113] PRIMARY KEY CLUSTERED
      ( 
      [DivisionID] ASC,
      [ID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
---- Add Columns
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT0113' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT0113' AND col.name='ProductTypeID')
		ALTER TABLE MT0113 ADD ProductTypeID NVARCHAR(50) NULL
	END
	---- Add Columns Huỳnh Thử [25/07/2020]-- Fix lỗi chạy tool run all Fix
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT0113' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT0113' AND col.name='MixVoucherID')
		ALTER TABLE MT0113 ADD MixVoucherID NVARCHAR(50) NULL

		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT0113' AND col.name='ID')
		ALTER TABLE MT0113 ADD ID NVARCHAR(50) NOT NULL

	END

