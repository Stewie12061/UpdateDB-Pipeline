--- Modify by: Lê Thị Hạnh on 27/08/2014 -- Bổ sung BrandID để phân quyền dữ liệu
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MTT2000' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MTT2000' AND col.name='BranchID')
		ALTER TABLE MTT2000 ADD BranchID VARCHAR(50) NULL
	END
