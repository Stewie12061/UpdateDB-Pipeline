---------------------------Xóa cột EVoucherNo-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0025' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0025' AND col.name='EVoucherNo')
	ALTER TABLE POST0025 DROP COLUMN EVoucherNo
END