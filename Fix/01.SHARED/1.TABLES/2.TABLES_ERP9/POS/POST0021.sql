--- Created on 28/03/2014 by Phan Quốc Việt
--- Thiet lap loai the hoi vien
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0021]') AND TYPE IN (N'U'))
BEGIN

CREATE TABLE [dbo].[POST0021](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[TypeNo] [varchar] (50) NOT NULL,
	[TypeName] [NVARCHAR] (250) NOT NULL, 
	[FromScore] [INT],
	[ToScore] [INT],
	[DiscountRate] [decimal] (28, 8) NULL,
	[Status] [tinyint] NOT NUll,
	[CreateUserID] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [varchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
 CONSTRAINT [PK_POST0021] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC,
	[TypeNo] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END

--- Created on 09/07/2014 by Phan thanh hoang vu
--- Loại the hoi vien
----------------------------Thêm Không hiển thị--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0021' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0021' AND col.name='Disabled')
	ALTER TABLE POST0021 ADD Disabled Tinyint DEFAULT (0) NULL
END
----------------------------Dùng chung--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0021' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0021' AND col.name='IsCommon')
	ALTER TABLE POST0021 ADD IsCommon Tinyint DEFAULT (0) NULL
END