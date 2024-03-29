--- Created on 10/07/2014 by Phan thanh hoàng vũ
--- Danh mục thời điểm
--- Modify by Lê Thị Hạnh on 21/07/2014 
--- Bổ sung trường Description
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'POST0036') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE POST0036 (
		[APK] [uniqueidentifier] default NEWID() NOT NULL,
		[DivisionID] [varchar](50) NOT NULL,
		[ShopID] [varchar](50) NOT NULL,
		[TimeID] [varchar](50) NOT NULL,
		[TimeName] [nvarchar](250) NOT NULL,
		[TimeNameE] [nvarchar](250) NULL,
		[BeginHour] [int] NOT NULL default 0,
		[EndHour] [int] NOT NULL default 0,
		[BeginMinute] [int] NOT NULL default 0,
		[EndMinute] [int] NOT NULL default 0,
		[Description] [NVARCHAR](250) NULL,
		[Disabled] [tinyint] NOT NULL default 0,
		[CreateUserID] [varchar](50) NOT NULL,
		[CreateDate] [datetime] NOT NULL,
		[LastModifyUserID] [varchar](50) NOT NULL,
		[LastModifyDate] [datetime] NOT NULL,
	 CONSTRAINT  PK_POST0036  PRIMARY KEY CLUSTERED 
	(
		[TimeID] ASC,
		[DivisionID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END

--- Modify by Lê Thị Hạnh on 21/07/2014
--- Bổ sung trường Description
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='POST0036' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='POST0036' AND col.name='DESCRIPTION')
		ALTER TABLE POST0036 ADD [Description] VARCHAR(250) NULL
	END

--add column 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='POST0036' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='POST0036' AND col.name='IsCommon')
		ALTER TABLE POST0036 ADD IsCommon TINYINT NULL
	END
