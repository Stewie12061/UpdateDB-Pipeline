-- <Summary>
---- 
-- <History>
---- Create on 14/12/2011 by Huỳnh Tấn Phú
---- Modified on 14/07/2015 by Lê Thị Hạnh: Bổ sung SType khi import nghiệp vụ Hồ sơ nhân viên
---- <Example>
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[A00065]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[A00065](
	[ImportTransTypeID] [nvarchar](50) NOT NULL,
	[ImportTransTypeName] [nvarchar](250) NOT NULL,
	[ImportTransTypeNameEng] [nvarchar](250) NOT NULL,
	[ScreenID] [nvarchar](50) NOT NULL,
	[TemplateFileName] [nvarchar](50) NOT NULL,
	[ExecSQL] [nvarchar](500) NOT NULL,
	[OrderNum] [int] NOT NULL,
	[ColID] [nvarchar](50) NOT NULL,
	[ColName] [nvarchar](250) NOT NULL,
	[ColNameEng] [nvarchar](250) NOT NULL,
	[InputMask] [nvarchar](50) NOT NULL,
	[ColWidth] [int] NOT NULL,
	[ColLength] [int] NOT NULL,
	[ColType] [tinyint] NOT NULL,
	[ColSQLDataType] [nvarchar](50) NOT NULL,
	[CheckExpression] [nvarchar](500) NOT NULL,
	[IsObligated] [tinyint] NOT NULL,
	[DataCol] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
---- Add Columns
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='A00065' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='A00065' AND col.name='SType')
		ALTER TABLE A00065 ADD [SType] INT DEFAULT(0) NULL
	END
---- Alter Columns
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='A00065' AND xtype='U')
BEGIN
	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col
			   INNER JOIN sysobjects obj ON obj.id = col.id
	           WHERE obj.name='A00065' AND col.name='ColLength')
			   ALTER TABLE A00065 ALTER COLUMN ColLength INT NULL
	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col
			   INNER JOIN sysobjects obj ON obj.id = col.id
	           WHERE obj.name='A00065' AND col.name='ColType')
				ALTER TABLE A00065 ALTER COLUMN ColType INT NULL 
	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col
			   INNER JOIN sysobjects obj ON obj.id = col.id
	           WHERE obj.name='A00065' AND col.name='CheckExpression')
		ALTER TABLE A00065 ALTER COLUMN CheckExpression NVARCHAR(500) NULL
END