--POST0020: Danh mục thẻ hội viên
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0020]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST0020](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[MemberCardID] [varchar](50) NOT NULL,
	[MemberCardName] [nvarchar] (250) NOT NULL,
	[TypeNo] [varchar] (50) NOT NULL,
	[MemberID] [varchar] (50) NOT NULL,
	[MemberName] [nvarchar] (250) NULL,
	[ReleaseDate] [datetime] NOT NULL,
	[ExpireDate] [datetime] NOT NULL,
	[LockedReason] [nvarchar] (250) NULL,
	[Disabled] [tinyint] NOT NULL,
	[CreateUserID] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [varchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[Locked] [tinyint] NULL
 CONSTRAINT [PK_POST0020] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC,
	[MemberCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

	--add column 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='POST0020' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='POST0020' AND col.name='Locked')
		ALTER TABLE POST0020 ADD Locked TINYINT NULL
	END

--add column 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='POST0020' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='POST0020' AND col.name='IsCommon')
		ALTER TABLE POST0020 ADD IsCommon TINYINT NULL
	END



