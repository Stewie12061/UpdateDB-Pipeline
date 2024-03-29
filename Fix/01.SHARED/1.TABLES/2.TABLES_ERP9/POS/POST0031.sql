--- Created on 23/06/2014 by Phan thanh hoàng vũ
--- Danh mục Khu Vực
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'POST0031') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE POST0031 (
		APK uniqueidentifier DEFAULT NEWID() NOT NULL,
		AreaID varchar(50) NOT NULL,
		DivisionID varchar(50) NOT NULL,
		ShopID varchar(50) NOT NULL,
		AreaName nvarchar(250) NOT NULL,
		AreaNameE nvarchar(250) NULL,
		Description nvarchar(250) NULL,
		Disabled tinyint DEFAULT 0 NOT NULL,
		CreateUserID varchar(50) NULL,
		LastModifyUserID varchar(50) NULL,
		CreateDate datetime NULL,
		LastModifyDate datetime NULL,
	 CONSTRAINT [PK_POST0031] PRIMARY KEY CLUSTERED 
	(
		AreaID ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END

--add column 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='POST0031' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='POST0031' AND col.name='IsCommon')
		ALTER TABLE POST0031 ADD IsCommon TINYINT NULL
	END


