--Create by: MaiVu
--Create Date: 013/05/04/2014
--Drop column "ID"
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0006' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0006' AND col.name='ID')
	ALTER TABLE POST0015 Drop Column ID
END
