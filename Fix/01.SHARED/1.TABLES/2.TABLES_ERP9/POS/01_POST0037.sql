---- Modify by: Lê Thị Hạnh on 29/07/2014
---- Xóa trường APKMaster, vì truyền theo chuẩn hiện tại màn hình danh mục là Mã ID
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='POST0037' AND xtype='U')
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='POST0037' AND col.name='APKMaster')
		ALTER TABLE POST0037 DROP COLUMN APKMaster
	END
