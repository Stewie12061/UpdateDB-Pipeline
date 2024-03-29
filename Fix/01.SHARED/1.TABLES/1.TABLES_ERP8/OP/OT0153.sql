-- <Summary>
---- Bảng lưu thông tin người quản lý, giới thiệu của các chủ nhiệm trước khi tính hoa hồng (Sinolife)
-- <History>
---- Create on 18/08/2014 by Bảo Anh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT0153]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[OT0153](
		[APK] [uniqueidentifier] DEFAULT NEWID(),
		[DivisionID] [nvarchar](3) NOT NULL,
		[OrderID] [nvarchar](50) NULL,
		[OrderNo] [int] NULL,
		[SalesmanID] [nvarchar](50) NOT NULL,
		[ManagerID] [nvarchar](50) NULL,
		[MiddleID] [nvarchar](50) NULL
) ON [PRIMARY]
END
---- Alter Columns
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='OT0153' AND xtype='U')
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='OT0153' AND col.name='ManagerID')
		ALTER TABLE OT0153 ALTER COLUMN ManagerID NVARCHAR(50) NULL 
	END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='OT0153' AND xtype='U')
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='OT0153' AND col.name='MiddleID')
		ALTER TABLE OT0153 ALTER COLUMN MiddleID NVARCHAR(50) NULL 
	END
