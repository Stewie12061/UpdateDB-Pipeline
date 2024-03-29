--- Created on 23/06/2014 by Phan thanh hoàng vũ
--- Danh mục bàn
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'POST0032') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE POST0032 (
		APK uniqueidentifier DEFAULT NEWID() NOT NULL,
		TableID varchar(50) NOT NULL,
		DivisionID varchar(50) NOT NULL,
		ShopID varchar(50) NOT NULL,
		AreaID varchar(50) NOT NULL,
		TableName nvarchar(250) NULL,
		TableNameE nvarchar(250) NULL,
		Description nvarchar(250) NULL,
		Disabled tinyint NULL,
		CreateUserID varchar(50) NULL,
		LastModifyUserID varchar(50) NULL,
		CreateDate datetime NULL,
		LastModifyDate datetime NULL,
	 CONSTRAINT [PK_POST0032] PRIMARY KEY CLUSTERED 
	(
		TableID ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END


--add column 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='POST0032' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='POST0032' AND col.name='IsCommon')
		ALTER TABLE POST0032 ADD IsCommon TINYINT NULL
	END


