--- Created on 10/02/2014 by Phan thanh hoàng vũ
--- Modify by Thị Phượng Date 14/11/2017: Alter column thêm giá trị default cho Disabled
--- Danh muc hoi vien
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0011]') AND TYPE IN (N'U'))
BEGIN

CREATE TABLE [dbo].[POST0011](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[MemberID] [varchar](50) NOT NULL,
	[MemberName] [nvarchar](250) NOT NULL,
	[MemberNameE] [nvarchar](250) NULL,
	[ShortName] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Identify] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[Tel] [nvarchar](250) NULL,
	[Fax] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[Birthday] [smalldatetime] NULL,
	[Website] [nvarchar](250) NULL,
	[Mailbox] [nvarchar](250) NULL,
	[AreaID] [varchar](50) NULL,
	[WardName] [nvarchar](250) NULL,
	[CountyName] [nvarchar](250) NULL,
	[CityID] [varchar](50) NULL,
	[CountryID] [varchar](50) NULL,
	[AccruedScore] [int] DEFAULT 0 NOT NULL ,
	[Description] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [varchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [varchar](50) NULL,
	[Disabled] [tinyint] NOT NULL,
 CONSTRAINT [PK_POST0011] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC,
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Disabled') 
   ALTER TABLE POST0011 ALTER COLUMN [Disabled] TINYINT NULL
END 
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_POST0011_Disabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[POST0011] ADD  CONSTRAINT [DF_POST0011_Disabled]  DEFAULT ((0)) FOR [Disabled]
END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Identify') 
   ALTER TABLE POST0011 ALTER COLUMN [Identify] nvarchar(250) NULL
END 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'AccruedScore') 
   ALTER TABLE POST0011 ALTER COLUMN [AccruedScore] INT NULL

   -- [Văn Tài] Created	[22/06/2021] - Bổ sung cột từ KIMYEN để tránh bị lỗi.
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'WarningNoOrdersGenerated') 
   ALTER TABLE POST0011 ADD [WarningNoOrdersGenerated] INT NULL
END 

	---Modify on 31/12/2021 by Anh Tuấn: Bổ sung cột DeleteFlg
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'DeleteFlg') 
   ALTER TABLE POST0011 ADD DeleteFlg TINYINT DEFAULT (0) NULL 
END

-----------Modify by Minh Hiếu- Date 14/02/2022 thêm cột Tel --------------------
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Tel1') 
   ALTER TABLE POST0011 ADD Tel1 NVARCHAR(100) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Tel2') 
   ALTER TABLE POST0011 ADD Tel2 NVARCHAR(100) NULL 
END

-----------Modify by Hoài Thanh - Date 14/06/2023 thêm cột RouteID --------------------
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'RouteID') 
   ALTER TABLE POST0011 ADD RouteID NVARCHAR(100) NULL 
END

-----------Modify by Hoàng Long - Date 17/08/2023 thêm cột O06ID,O07ID --------------------
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'O06ID') 
   ALTER TABLE POST0011 ADD O06ID NVARCHAR(100) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'O07ID') 
   ALTER TABLE POST0011 ADD O07ID NVARCHAR(100) NULL 
END


