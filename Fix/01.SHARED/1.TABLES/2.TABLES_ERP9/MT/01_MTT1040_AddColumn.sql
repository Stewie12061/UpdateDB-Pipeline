---- Modify by: Lê Thị Hạnh on 27/08/2014 -- Bổ sung BrandID để phân quyền giáo viên theo lớp học
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MTT1040' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MTT1040' AND col.name='BranchID')
		ALTER TABLE MTT1040 ADD BranchID VARCHAR(50) NULL
	END

