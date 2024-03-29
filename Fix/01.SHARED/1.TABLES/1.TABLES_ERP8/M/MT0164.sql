-- <Summary>
---- Vật liệu đóng gói - Sài Gòn Petro
-- <History>
---- Create on 19/09/2014 by Lê Thị Hạnh 
---- Modified on 29/09/2014 by Lê Thị Hạnh 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MT0164]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[MT0164]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [PlanID] NVARCHAR(50) NOT NULL,
      [InventoryID] NVARCHAR(50) NOT NULL,
      [InventoryTypeID] NVARCHAR(50) NULL,
      [Quantity] DECIMAL(28,8) NULL, 
      [InventoryDate] DATETIME NULL,
      [Description] NVARCHAR(250) NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_MT0164] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [PlanID] ASC,
      [InventoryID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
---- Add Columns
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT0164' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT0164' AND col.name='InventoryDate')
		ALTER TABLE MT0164 ADD InventoryDate DATETIME NULL
	END