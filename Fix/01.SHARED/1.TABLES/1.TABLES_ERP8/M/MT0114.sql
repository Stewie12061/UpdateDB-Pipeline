-- <Summary>
---- Khai báo công thức sản xuất sản phẩm - Detail
-- <History>
---- Create on 24/09/2014 by Lê Thị Hạnh 
---- Modified on 13/01/2015 by  Lê Thị Hạnh: Khai báo công thức sản phẩm
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MT0114]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[MT0114]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [ID] NVARCHAR(50) NOT NULL,
      [TransactionID] NVARCHAR(50) NOT NULL,
      [InventoryID] NVARCHAR(50) NULL,
      [TypeID] TINYINT NOT NULL, -- 1: BaseOil - dầu gốc , 2: Additive - phụ gia, 3: Packings - Bao bì
      [Orders] INT NULL,
      [Rate03] DECIMAL(28,8) NULL,
      [Rate04] DECIMAL(28,8) NULL,
      [Rate05] DECIMAL(28,8) NULL,
      [VolumeTotal] DECIMAL(28,8) NULL,
      [WeightTotal] DECIMAL(28,8) NULL,
      [Notes] NVARCHAR(50) NULL
    CONSTRAINT [PK_MT0114] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [TransactionID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END

		---- Add Columns Huỳnh Thử [25/07/2020]-- Fix lỗi chạy tool run all Fix
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT0114' AND xtype='U')
	BEGIN

		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT0114' AND col.name='ID')
		ALTER TABLE MT0114 ADD ID NVARCHAR(50) NOT  NULL

		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT0114' AND col.name='WeightTotal')
		ALTER TABLE MT0114 ADD WeightTotal DECIMAL(28,8)  NULL
		
	END
