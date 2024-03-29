---------------------------Thêm cột PageSize-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0000' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0000' AND col.name='PageSize')
	ALTER TABLE POST0000 ADD PageSize int NULL
END
---------------------------Thêm cột WarehouseID -------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0000' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0000' AND col.name='WarehouseID')
	ALTER TABLE POST0000 ADD WarehouseID varchar(50) NULL
END

---------------------------Thêm cột WarehouseName------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0000' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0000' AND col.name='WarehouseName')
	ALTER TABLE POST0000 ADD WarehouseName nvarchar(250) NULL
END
