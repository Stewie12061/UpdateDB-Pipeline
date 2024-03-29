---------------------------Thêm cột IsStocked-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0023' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0023' AND col.name='IsStocked')
	ALTER TABLE POST0023 ADD IsStocked tinyint NULL
END

---------------------------Thêm cột RecipientShopID-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0023' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0023' AND col.name='RecipientShopID')
	ALTER TABLE POST0023 ADD RecipientShopID varchar(50) NULL
END

---------------------------Thêm cột RecipientWarehouseID-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0023' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0023' AND col.name='RecipientWarehouseID')
	ALTER TABLE POST0023 ADD RecipientWarehouseID varchar(50) NULL
END

---------------------------Thêm cột RecipientWarehouseName-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0023' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0023' AND col.name='RecipientWarehouseName')
	ALTER TABLE POST0023 ADD RecipientWarehouseName nvarchar(250) NULL
END
------Thêm cột đơn giá khi đề nghị xuất trả hàng-------------------------------
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0023' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0023' AND col.name = 'UnitPrice') 
   ALTER TABLE POST0023 ADD UnitPrice DECIMAL(28,8) NULL 
END

/*===============================================END UnitPrice===============================================*/ 
--Modified by Thị Phượng Date: 18/01/2018: Chỉnh sửa bổ sung cột phân biệt trạng thái hàng hóa
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0023' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0023' AND col.name = 'StatusInventory') 
   ALTER TABLE POST0023 ADD StatusInventory INT Default(0) NULL 
END
/*===============================================END StatusInventory===============================================*/ 
--Modified by Thị Phượng Date: 22/03/2018: Bổ sung trường STT để lưu theo đúng thứ tự
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0023' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0023' AND col.name = 'OrderNo') 
   ALTER TABLE POST0023 ADD OrderNo INT NULL 
END

---------------------------Thêm cột InheritVoucherID-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0023' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0023' AND col.name='InheritVoucherID')
	ALTER TABLE POST0023 ADD InheritVoucherID varchar(25) NULL
END

---------------------------Thêm cột InheritTransactionID-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0023' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0023' AND col.name='InheritTransactionID')
	ALTER TABLE POST0023 ADD InheritTransactionID varchar(25) NULL
END