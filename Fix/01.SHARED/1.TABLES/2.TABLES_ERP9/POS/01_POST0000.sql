--- Edited by 09/02/2017 on Phan thanh hoàng vũ: Bổ sung trường IsPosCloud quản lý luồng nghiệp vụ của POS-CLOUD (Ẩn màn hình Chọn kỳ kế toán, khóa sổ kỳ kế toán, bỏ khóa sổ kỳ kế toán)
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

---------------------------Thêm cột IsNegativeStock------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0000' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0000' AND col.name='IsNegativeStock')
	ALTER TABLE POST0000 ADD IsNegativeStock tinyint default(0) NULL
END

---------------------------Thêm cột IsPosCloud (0: Quản lý luồng nghiệp ERP9; 1: Quản lý luồng nghiệp vụ POS-CLOUD------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0000' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0000' AND col.name='IsPosCloud')
	ALTER TABLE POST0000 ADD IsPosCloud tinyint default(0) NULL
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0000' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0000' AND col.name = 'IsConnectERP') 
   ALTER TABLE POST0000 ADD IsConnectERP TINYINT default 1 NULL 
END

--Dùng để quản lý bán hàng trả góp (Nếu check vào thì sẽ hiển thị giá trả góp trên màn hình POSF00161 ngược lại thì hide trong màn hình bán hàng POSF00161]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0000' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0000' AND col.name = 'IsInstallmentPrice') 
   ALTER TABLE POST0000 ADD IsInstallmentPrice TINYINT NULL 
END

/*===============================================END IsInstallmentPrice===============================================*/ 
---Modified by Thị Phượng on 09/01/2018: Kiểm tra kết chuyển chi tiết hay tổng hợp
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0000' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0000' AND col.name = 'IsDetailTransfer') 
   ALTER TABLE POST0000 ADD IsDetailTransfer TINYINT default(0) NULL 
END
---END
--Dùng để quản lý bán hàng theo giá bán sỉ (Nếu check vào thì sẽ hiển thị checkbox giá bán sỉ trên màn hình POSF00161 ngược lại thì hide trong màn hình bán hàng POSF00161]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0000' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0000' AND col.name = 'IsWholesalePrice') 
   ALTER TABLE POST0000 ADD IsWholesalePrice TINYINT default(0) NULL 
END
