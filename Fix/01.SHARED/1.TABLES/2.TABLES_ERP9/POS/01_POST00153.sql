---------------------------Trang thai hoan tat / chua hoan tat-------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST00153' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST00153' AND col.name='Status')
	ALTER TABLE POST00153 ADD Status tinyint NULL
END
---------------------------Trang thai da xoa/dang dung---------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST00153' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST00153' AND col.name='DeleteFlg')
	ALTER TABLE POST00153 ADD DeleteFlg tinyint NULL
END
