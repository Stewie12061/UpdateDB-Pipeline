-- Tấn Phú comment code update field from NOT NULL to NULL
---------------------------Update cột Identify NOT NULL-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0011' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0011' AND col.name='Identify')
	/*
	UPDATE POST0011 SET Identify = 'NULL' WHERE Identify IS NULL 
	ALTER TABLE POST0011 ALTER COLUMN Identify nvarchar (250) NOT NULL
	*/
	ALTER TABLE POST0011 ALTER COLUMN Identify nvarchar (250) NULL
END

---------------------------Update cột Phone NOT NULL-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0011' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0011' AND col.name='Phone')
	/*
	UPDATE POST0011 SET Phone = 'NULL' WHERE Phone IS NULL 
	ALTER TABLE POST0011 ALTER COLUMN Phone nvarchar (250) NOT NULL
	*/
	ALTER TABLE POST0011 ALTER COLUMN Phone nvarchar (250) NULL
END
---------------------------Update cột ConvertUserID Chuyển kiểu dữ liệu ----------------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0011' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0011' AND col.name='ConvertUserID')
	
	ALTER TABLE POST0011 ALTER COLUMN ConvertUserID varchar (50) NULL
END
