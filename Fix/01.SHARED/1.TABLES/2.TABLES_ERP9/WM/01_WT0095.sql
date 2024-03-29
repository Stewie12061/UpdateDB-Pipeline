--------------------Thêm column Status--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='WT0095' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT0095' AND col.name='Status')
	ALTER TABLE WT0095 ADD Status tinyint NULL
END

--------------------Thêm column RDAddressID--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='WT0095' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT0095' AND col.name='RDAddressID')
	ALTER TABLE WT0095 ADD RDAddressID VARCHAR(50) NULL
END