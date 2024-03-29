----------------Customer Phuclong--Thêm {Mã món ăn}--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0028' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0028' AND col.name='MarkInventoryID')
	ALTER TABLE POST0028 ADD MarkInventoryID varchar(50) NULL
END

----------------Customer Phuclong--Thêm {Số lượng món ăn }--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0028' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0028' AND col.name='MarkQuantity')
	ALTER TABLE POST0028 ADD MarkQuantity decimal(28,8) NULL
END

----------------Thay doi PHUCLONG--------------------------------
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='POST0028' AND xtype='U')
BEGIN
IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
ON col.id=tab.id WHERE tab.name='POST0028' AND col.name='InventoryTypeID')
ALTER TABLE POST0028 ALTER COLUMN InventoryTypeID Varchar(25) NULL 
END

----------------Thay doi TMQ3--------------------------------
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0028' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'POST0028' AND col.name = 'SalePrice')
        ALTER TABLE POST0028 ADD SalePrice DECIMAL(28,8) NULL
    END

----------Thêm trường [Số Series] --CustomizeIndex = 87 OKIA
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0028' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0028' AND col.name = 'SerialNo') 
   ALTER TABLE POST0028 ADD SerialNo VARCHAR(50) NULL 
END
/*===============================================END SerialNo===============================================*/ 
--Thị Phượng Date 02/01/2018 Bổ sung số thẻ bảo hành
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0028' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0028' AND col.name = 'WarrantyCard') 
   ALTER TABLE POST0028 ADD WarrantyCard NVARCHAR(250) NULL 
END
--Modified by Thị Phượng Date: 18/01/2018: Chỉnh sửa bổ sung cột phân biệt trạng thái hàng hóa
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0028' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0028' AND col.name = 'StatusInventory') 
   ALTER TABLE POST0028 ADD StatusInventory INT Default(0) NULL 
END

/*===============================================END StatusInventory===============================================*/ 
--Modified by Thị Phượng Date: 22/03/2018: Bổ sung trường STT để lưu theo đúng thứ tự
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0028' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0028' AND col.name = 'OrderNo') 
   ALTER TABLE POST0028 ADD OrderNo INT NULL 
END

/*===============================================END OrderNo===============================================*/ 