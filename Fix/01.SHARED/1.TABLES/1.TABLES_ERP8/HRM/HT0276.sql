-- <Summary>
---- 
-- <History>
---- Create on 16/08/2014 by Thanh Sơn
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT0276]') AND type in (N'U')) 
BEGIN
	CREATE TABLE [dbo].[HT0276](
		[APK] [uniqueidentifier] DEFAULT NEWID(),
		[DivisionID] [nvarchar](50) NOT NULL,
		[ID] [nvarchar](50) NOT NULL,
		[Name] [nvarchar](250) NULL,
		[Notes] [nvarchar](500) NULL,
		[BeginDate][DATETIME] NULL,
		[EndDate] [Datetime] NULL,
		[Time] [int] NULL,
		[IsWarning][TINYINT] DEFAULT(0) NULL,
		[Message] [nvarchar](2000) NULL,
		[Mode] [nvarchar] (50) NULL,
		[Sex] [tinyint] DEFAULT (0) NULL,
		[Years][int] NULL,
		[CreateUserID] [nvarchar](50) NULL,
		[CreateDate] [datetime] NULL,
		[LastModifyUserID] [nvarchar](50) NULL,
		[LastModifyDate] [datetime] NULL,
	 CONSTRAINT [PK_HT0276] PRIMARY KEY CLUSTERED 
	(
		[APK] ASC,
		[DivisionID] ASC
 		
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
---- Add Columns
--Thêm cột TitleID (by Nguyễn Thanh Sơn on 31/12/2013)
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='HT0276' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='HT0276' AND col.name='TitleID')
	ALTER TABLE HT0276 ADD TitleID VARCHAR (50) NULL
END
--Thêm cột DutyID (by Nguyễn Thanh Sơn on 31/12/2013)
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='HT0276' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='HT0276' AND col.name='DutyID')
	ALTER TABLE HT0276 ADD DutyID VARCHAR (50) NULL
END
