--------Sua PriceTable kieu du lieu varchar(50) --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='PriceTable')
	ALTER TABLE POST0010 ALTER COLUMN PriceTable varchar(50) NULL
END
--------Sua PriceColumn kieu du lieu  int --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='PriceColumn')
	ALTER TABLE POST0010 ALTER COLUMN PriceColumn int NULL
END
--------------------Thêm column [Kho cửa hàng] WarehouseID--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='WarehouseID')
	ALTER TABLE POST0010 ADD WarehouseID Varchar(50) Not NULL
END

--------Thêm column [Kho cửa hàng] WarehouseName --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='WareHouseName')
	ALTER TABLE POST0010 ADD WareHouseName nvarchar(250) NULL
End	

--------Thêm column TaxDebitAccountID --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='TaxDebitAccountID')
	ALTER TABLE POST0010 ADD TaxDebitAccountID Varchar(50) NULL
End

--------Thêm column TaxCreditAccountID --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='TaxCreditAccountID')
	ALTER TABLE POST0010 ADD TaxCreditAccountID Varchar(50) NULL
End	

--------Thêm column DebitAccountID --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='DebitAccountID')
	ALTER TABLE POST0010 ADD DebitAccountID Varchar(50) NULL
End	

--------Thêm column CreditAccountID --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='CreditAccountID')
	ALTER TABLE POST0010 ADD CreditAccountID Varchar(50) NULL
End		
-------------------------Rename Columns [Kho cửa hàng] WareHouseID---------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='WareHouseName')
	EXEC sp_rename 'dbo.POST0010.WareHouseName', 'WarehouseName', 'COLUMN';
END

--------PHUCLONG-Thêm column InventoryTypeID1--Phân loại đồ ăn --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='InventoryTypeID1')
	ALTER TABLE POST0010 ADD InventoryTypeID1 Varchar(50) NULL
End		

--------PHUCLONG-Thêm column DefaultPrinter1--máy in đồ ăn --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='DefaultPrinter1')
	ALTER TABLE POST0010 ADD DefaultPrinter1 nvarchar(250) NULL
End	

--------PHUCLONG-Thêm column InventoryTypeID2--Phân loại Thức uống --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='InventoryTypeID2')
	ALTER TABLE POST0010 ADD InventoryTypeID2 Varchar(50) NULL
End		

--------PHUCLONG-Thêm column DefaultPrinter2--máy in thức uống --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='DefaultPrinter2')
	ALTER TABLE POST0010 ADD DefaultPrinter2 nvarchar(250) NULL
End	

--------PHUCLONG-Thêm column IsTableAll--Bảng giá chung--------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='IsTableAll')
	ALTER TABLE POST0010 ADD IsTableAll int default(1) NULL
End		

--------PHUCLONG-Thêm column IsTableOfTime--Bảng giá theo thời điểm--------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='IsTableOfTime')
	ALTER TABLE POST0010 ADD IsTableOfTime int default(0) NULL
End	
----- MODIFY BY LÊ THỊ HẠNH ON 11/07/2014
----- THÊM TRƯỜNG MÁY IN HÓA ĐƠN

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='DefaultPrinter3')
		ALTER TABLE POST0010 ADD DefaultPrinter3 NVARCHAR(250) NULL
	END
--------Thêm column PayDebitAccountID --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='PayDebitAccountID')
	ALTER TABLE POST0010 ADD PayDebitAccountID Varchar(50) NULL
End

--------Thêm column PayCreditAccountID --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='PayCreditAccountID')
	ALTER TABLE POST0010 ADD PayCreditAccountID Varchar(50) NULL
End		
--------Thêm column CostDebitAccountID --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='CostDebitAccountID')
	ALTER TABLE POST0010 ADD CostDebitAccountID Varchar(50) NULL
End

--------Thêm column CostCreditAccountID --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='CostCreditAccountID')
	ALTER TABLE POST0010 ADD CostCreditAccountID Varchar(50) NULL
End	

--------Thêm column IPPrinter --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='IPPrinter')
	ALTER TABLE POST0010 ADD IPPrinter Varchar(250) NULL
End			


--------Thêm column IsPromote1 (Khuyến mãi theo hóa đơn) --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='IsPromote1')
	ALTER TABLE POST0010 ADD IsPromote1 TINYINT Default(0) NULL
End			

--------Thêm column PromoteID1 (Khuyến mãi theo hóa đơn) --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='PromoteID1')
	ALTER TABLE POST0010 ADD PromoteID1 Varchar(50) NULL
End		
 
--------Sua InventoryTypeID kieu du lieu varchar(25) sang nvarchar(4000) --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='InventoryTypeID')
	ALTER TABLE POST0010 ALTER COLUMN InventoryTypeID nvarchar(4000) NULL
END

--------------------Thêm column [Kho công ty] ComWarehouseID--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='ComWarehouseID')
	ALTER TABLE POST0010 ADD ComWarehouseID Varchar(50) NULL
END

--------Thêm column [Kho công ty] ComWarehouseName --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='ComWarehouseName')
	ALTER TABLE POST0010 ADD ComWarehouseName nvarchar(250) NULL
End	

--------Sua PromotePriceTable bảng giá khuyến mãi --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='PromotePriceTable')
	ALTER TABLE POST0010 ADD  PromotePriceTable varchar(50) NULL
END
---Khuyến mãi theo CA (Customize Minh Sang) Cao thị Phượng Date 27/07/2017
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'IsUsedCA') 
   ALTER TABLE POST0010 ADD IsUsedCA TINYINT NULL 
END
---Khuyến mãi theo CA (Customize Minh Sang) Cao thị Phượng Date 27/07/2017
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'PromoteIDCA') 
   ALTER TABLE POST0010 ADD PromoteIDCA VARCHAR(50) NULL 
END

--Thị Phượng------Lĩnh vực kinh doanh --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='BusinessArea')
	ALTER TABLE POST0010 ADD  BusinessArea int NULL
END
--Thị Phượng on 08/2017 - --bảng giá bán theo gói...
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'PackagePriceID') 
   ALTER TABLE POST0010 ADD PackagePriceID VARCHAR(50) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'IsPackage') 
   ALTER TABLE POST0010 ADD IsPackage TINYINT NULL 
END

--Hoàng Vũ on 12/2017 - --Quản lý ngầm (0: cửa hàng; 1: Event)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'IsEvents') 
   ALTER TABLE POST0010 ADD IsEvents TINYINT Default(0) NULL
END
/*===============================================END IsEvents===============================================*/ 

--Hoàng Vũ on 12/2017 - --Quản lý trường ngày bắt đầu sự kiện
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'EventBeginDate') 
   ALTER TABLE POST0010 ADD EventBeginDate DATETIME NULL 
END
/*===============================================END EventBeginDate===============================================*/

--Hoàng Vũ on 12/2017 - --Quản lý trường ngày kết thúc sự kiện
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'EventEndDate') 
   ALTER TABLE POST0010 ADD EventEndDate DATETIME NULL 
END
/*===============================================END EventEndDate===============================================*/ 

--Hoàng Vũ on 12/2017 - --Quản lý lịch sử
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'RelatedToTypeID') 
   ALTER TABLE POST0010 ADD RelatedToTypeID INT Default(52) NULL 
END
/*===============================================END RelatedToTypeID===============================================*/ 
---Thị Phượng on 02/01/2018 --Quản lý kho trưng bày
--Begin
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'IsDisplay') 
   ALTER TABLE POST0010 ADD IsDisplay TINYINT Default (0) NULL 
END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'DisplayWareHouseID') 
   ALTER TABLE POST0010 ADD DisplayWareHouseID VARCHAR(50) NULL 
END
---QUản lý kho hàng hỏng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'IsBroken') 
   ALTER TABLE POST0010 ADD IsBroken TINYINT Default (0) NULL 
END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'BrokenWareHouseID') 
   ALTER TABLE POST0010 ADD BrokenWareHouseID VARCHAR(50) NULL 
END
---End

---Hoàng vũ on 08/03/2018 --Quản lý khuyến mãi tăng hàng theo hóa đơn
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'IsInvoicePromotionID') 
   ALTER TABLE POST0010 ADD IsInvoicePromotionID TINYINT NULL 
END
/*===============================================END IsInvoicePromotionID===============================================*/ 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'InvoicePromotionID') 
   ALTER TABLE POST0010 ADD InvoicePromotionID VARCHAR(50) NULL 
END

/*===============================================END InvoicePromotionID===============================================*/ 

-------- By Tiểu Mai on 04/06/2018: Thêm column IsInvoiceAccumulate (Khuyến mãi theo hóa đơn: 0: Từng hóa đơn, 1: Doanh số tích lũy) --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='IsInvoiceAccumulate')
	ALTER TABLE POST0010 ADD IsInvoiceAccumulate TINYINT NULL
End	

-------- By Tiểu Mai on 24/07/2018: Thêm column IsSimilar (Check sử dụng bán hàng theo hàng đồng giá) --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0010' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='IsSimilar')
	ALTER TABLE POST0010 ADD IsSimilar TINYINT NULL
	
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0010' AND col.name='SimilarListID')
	ALTER TABLE POST0010 ADD SimilarListID NVARCHAR(50) NULL
End	

---Trà Giang on 30/08/2018 --Quản lý khuyến mãi tăng tiền theo hóa đơn
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'IsMoneyPromotionID') 
   ALTER TABLE POST0010 ADD IsMoneyPromotionID TINYINT NULL 
END
/*===============================================END IsInvoicePromotionID===============================================*/ 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0010' AND col.name = 'MoneyPromotionID') 
   ALTER TABLE POST0010 ADD MoneyPromotionID VARCHAR(50) NULL 
END



