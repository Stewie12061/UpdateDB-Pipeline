-----------------Xóa cột RecipientName------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0022' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0022' AND col.name='RecipientName')
	ALTER TABLE POST0022 DROP COLUMN RecipientName
END
