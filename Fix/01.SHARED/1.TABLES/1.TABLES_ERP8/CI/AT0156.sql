-- <Summary>
---- 
-- <History>
---- Create on 04/01/2016 by Bảo Anh: Danh mục máy - khuôn (master)
---- Modified on ... by ...
---- Modified on 14/06/2016 by Kim Vu bo sung them cac thong tin default

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT0156]') AND type in (N'U'))
CREATE TABLE [dbo].[AT0156](
	[APK] [uniqueidentifier] DEFAULT NEWID(),
	[DivisionID] [nvarchar](3) NOT NULL,
	[CombineID] [nvarchar](50) NOT NULL,
	[CombineName] [nvarchar](50) NULL,
	[MachineID] [nvarchar](50) NULL,
	[BlockID] [nvarchar](50) NULL,
	[MachineNo] [nvarchar](3) NULL,
	[ProductID] [nvarchar](50) NULL,
	[CavityNo] [nvarchar](10) NULL,
	[Pressure] [nvarchar](10) NULL,
	[Weight] [nvarchar](10) NULL,
	[ProductQty] [nvarchar](10) NULL,
	[BlockTypeID] [nvarchar] (1) NULL,
	[Notes] [nvarchar] (250) NULL,
	[Disabled] [tinyint] NULL,

 CONSTRAINT [PK_AT0156] PRIMARY KEY NONCLUSTERED 
(
	[DivisionID] ASC,
	[CombineID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='AT1302' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='AT0156' AND col.name='CreateDate')
		ALTER TABLE AT0156 ADD CreateDate [datetime] NULL

		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='AT0156' AND col.name='CreateUserID')
		ALTER TABLE AT0156 ADD CreateUserID [nvarchar](50) NULL

		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='AT0156' AND col.name='LastModifyDate')
		ALTER TABLE AT0156 ADD LastModifyDate [datetime] NULL

		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='AT0156' AND col.name='LastModifyUserID')
		ALTER TABLE AT0156 ADD LastModifyUserID [nvarchar](50) NULL
	END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='AT0156' AND xtype='U')
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='AT0156' AND col.name='CombineName')
		ALTER TABLE AT0156 ALTER COLUMN CombineName [nvarchar](250) NULL
	END