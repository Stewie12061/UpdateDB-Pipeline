---------------------------Update cột Identify NOT NULL-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0011' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0011' AND col.name='Identify')
	UPDATE POST0011 SET Identify = 'NULL' WHERE Identify IS NULL 
	ALTER TABLE POST0011 ALTER COLUMN Identify nvarchar (250) NOT NULL
END

---------------------------Update cột Phone NOT NULL-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0011' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0011' AND col.name='Phone')
	UPDATE POST0011 SET Phone = 'NULL' WHERE Phone IS NULL 
	ALTER TABLE POST0011 ALTER COLUMN Phone nvarchar (250)  NULL
END
---------------------------Thêm cột ShopID-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0011' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0011' AND col.name='ShopID')
	ALTER TABLE POST0011 ADD ShopID varchar(50) NULL
END
---------------------------Thêm cột IsMemberID (Hội hiên lẻ/Vãng lai)-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0011' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0011' AND col.name='IsMemberID')
	ALTER TABLE POST0011 ADD IsMemberID Tinyint DEFAULT (0) NULL
END

--------Sua Identify  not null sang null --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0011' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0011' AND col.name='Identify')
	ALTER TABLE POST0011 ALTER COLUMN Identify nvarchar(250) NULL
END

--------Sua Phone  not null sang null --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0011' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0011' AND col.name='Phone')
	ALTER TABLE POST0011 ALTER COLUMN Phone nvarchar(250) NULL
END

--------Thêm cột gender--------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0011' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0011' AND col.name='Gender')
	ALTER TABLE POST0011 ADD Gender int DEFAULT (9) NULL
END
---------------------------Thêm cột IsCommon -------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0011' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0011' AND col.name='IsCommon')
	ALTER TABLE POST0011 ADD IsCommon Tinyint DEFAULT (0) NULL
END
--Thị Phượng bổ sung customize Kim yến (CustomizeIndex =82)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'IntroduceUserID') 
   ALTER TABLE POST0011 ADD IntroduceUserID VARCHAR(50) NULL 
END
--Thị Phượng bổ sung customize Kim yến (CustomizeIndex =82)
/*===============================================END IntroduceUserID===============================================*/ 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'IsGetCommission') 
   ALTER TABLE POST0011 ADD IsGetCommission TINYINT NULL 
END

/*===============================================END IsGetCommission===============================================*/ 

---Modify by Thị Phượng- Date 18/9/2017 Bổ sung tính năng gộp đối tượng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar01') 
   ALTER TABLE POST0011 ADD Varchar01 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar02') 
   ALTER TABLE POST0011 ADD Varchar02 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar03') 
   ALTER TABLE POST0011 ADD Varchar03 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar04') 
   ALTER TABLE POST0011 ADD Varchar04 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar05') 
   ALTER TABLE POST0011 ADD Varchar05 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar06') 
   ALTER TABLE POST0011 ADD Varchar06 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar07') 
   ALTER TABLE POST0011 ADD Varchar07 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar08') 
   ALTER TABLE POST0011 ADD Varchar08 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar09') 
   ALTER TABLE POST0011 ADD Varchar09 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar10') 
   ALTER TABLE POST0011 ADD Varchar10 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar11') 
   ALTER TABLE POST0011 ADD Varchar11 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar12') 
   ALTER TABLE POST0011 ADD Varchar12 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar13') 
   ALTER TABLE POST0011 ADD Varchar13 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar14') 
   ALTER TABLE POST0011 ADD Varchar14 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar15') 
   ALTER TABLE POST0011 ADD Varchar15 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar16') 
   ALTER TABLE POST0011 ADD Varchar16 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar17') 
   ALTER TABLE POST0011 ADD Varchar17 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar18') 
   ALTER TABLE POST0011 ADD Varchar18 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar19') 
   ALTER TABLE POST0011 ADD Varchar19 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Varchar20') 
   ALTER TABLE POST0011 ADD Varchar20 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'AssignedToUserID') 
   ALTER TABLE POST0011 ADD AssignedToUserID VARCHAR(50) NULL 
END
--Cột phân loại (mã tăng tự động)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'S1') 
   ALTER TABLE POST0011 ADD S1 VARCHAR(50) NULL 
END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'S2') 
   ALTER TABLE POST0011 ADD S2 VARCHAR(50) NULL 
END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'S3') 
   ALTER TABLE POST0011 ADD S3 VARCHAR(50) NULL 
END
--- Mã loại khách hàng mặc định
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'RelatedToTypeID') 
   ALTER TABLE POST0011 ADD RelatedToTypeID INT DEFAULT 3  NULL
END
--Bổ sung loại chuyển đối 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'ConvertType') 
   ALTER TABLE POST0011 ADD ConvertType INT NULL 
END

-- Bổ sung tham chiếu ID đối tượng chuyển đổi
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'InheritConvertID') 
   ALTER TABLE POST0011 ADD InheritConvertID VARCHAR(50) NULL 
END
--Lý do chuyển đổi
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'CauseConverted') 
   ALTER TABLE POST0011 ADD CauseConverted NVARCHAR(max) NULL 
END
--Diễn giải chuyển đổi
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'DescriptionConvert') 
   ALTER TABLE POST0011 ADD DescriptionConvert NVARCHAR(Max) NULL 
END
---Người chuyển đổi
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'ConvertUserID') 
   ALTER TABLE POST0011 ADD ConvertUserID TINYINT NULL 
END
-- Lĩnh vực kinh doanh
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'BusinessLinesID') 
   ALTER TABLE POST0011 ADD BusinessLinesID VARCHAR(50) NULL 
END
--là khách hàng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'IsCustomer') 
   ALTER TABLE POST0011 ADD IsCustomer TINYINT NULL 
END
--Là tổ chức
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'IsOrganize') 
   ALTER TABLE POST0011 ADD IsOrganize TINYINT NULL 
END
--Có hóa đơn
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'IsInvoice') 
   ALTER TABLE POST0011 ADD IsInvoice TINYINT NULL 
END
--Ngưng sử dụng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'IsUsing') 
   ALTER TABLE POST0011 ADD IsUsing TINYINT NULL 
END
--Ghi chú 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Note') 
   ALTER TABLE POST0011 ADD Note NVARCHAR(250) NULL 
END
--Ghi chú 1
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Note1') 
   ALTER TABLE POST0011 ADD Note1 NVARCHAR(250) NULL 
END
--Mã số thuế
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'VATNo') 
   ALTER TABLE POST0011 ADD VATNo NVARCHAR(250) NULL 
END
--Khách hàng VAT
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'VATAccountID') 
   ALTER TABLE POST0011 ADD VATAccountID NVARCHAR(250) NULL 
END
--NGười liên hệ
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'EmployeeID') 
   ALTER TABLE POST0011 ADD EmployeeID VARCHAR(50) NULL 
END
--Tên ngân hàng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'BankName') 
   ALTER TABLE POST0011 ADD BankName NVARCHAR(250) NULL 
END
--Số tài khoản NH
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'BankAccountNo') 
   ALTER TABLE POST0011 ADD BankAccountNo VARCHAR(50) NULL 
END
--Địa chỉ giao hàng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'DeliveryAddress') 
   ALTER TABLE POST0011 ADD DeliveryAddress NVARCHAR(250) NULL 
END
--Phường 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'DeliveryWard') 
   ALTER TABLE POST0011 ADD DeliveryWard NVARCHAR(250) NULL 
END
--Quận
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'DeliveryDistrictID') 
   ALTER TABLE POST0011 ADD DeliveryDistrictID NVARCHAR(250) NULL 
END
--Tỉnh thành
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'DeliveryCityID') 
   ALTER TABLE POST0011 ADD DeliveryCityID NVARCHAR(250) NULL 
END
--Quốc gia
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'DeliveryCountryID') 
   ALTER TABLE POST0011 ADD DeliveryCountryID NVARCHAR(250) NULL 
END
--Mã vùng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'DeliveryPostalCode') 
   ALTER TABLE POST0011 ADD DeliveryPostalCode NVARCHAR(250) NULL 
END
--Địa chỉ nhận hàng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'BillAddress') 
   ALTER TABLE POST0011 ADD BillAddress NVARCHAR(250) NULL 
END
--Phường 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'BillWard') 
   ALTER TABLE POST0011 ADD BillWard NVARCHAR(250) NULL 
END
--Quận
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'BillDistrictID') 
   ALTER TABLE POST0011 ADD BillDistrictID NVARCHAR(250) NULL 
END
--Tỉnh thành
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'BillCityID') 
   ALTER TABLE POST0011 ADD BillCityID NVARCHAR(250) NULL 
END
--Quốc gia
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'BillCountryID') 
   ALTER TABLE POST0011 ADD BillCountryID NVARCHAR(250) NULL 
END
--Mã vùng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'BillPostalCode') 
   ALTER TABLE POST0011 ADD BillPostalCode NVARCHAR(250) NULL 
END
--Hạn mức nợ cho phép
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'ReCreditLimit') 
   ALTER TABLE POST0011 ADD ReCreditLimit DECIMAL(28,8) NULL 
END
--Ngày đáo hạn
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'ReDueDays') 
   ALTER TABLE POST0011 ADD ReDueDays DECIMAL(28,8) NULL 
END
--Phương thức thanh toán
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'RePaymentTermID') 
   ALTER TABLE POST0011 ADD RePaymentTermID NVARCHAR(250) NULL 
END
--Ngày thanh toán
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'ReDays') 
   ALTER TABLE POST0011 ADD ReDays INT NULL 
END
--Hạn mức nợ phải trả
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'PaCreditLimit') 
   ALTER TABLE POST0011 ADD PaCreditLimit DECIMAL(28,8) NULL 
END
--Hạn ngày thanh toán
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'PaDueDays') 
   ALTER TABLE POST0011 ADD PaDueDays DECIMAL(28,8) NULL 
END
--Hình thức thanh toán
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'PaPaymentTermID') 
   ALTER TABLE POST0011 ADD PaPaymentTermID VARCHAR(50) NULL 
END
--Phần trăm chiết khấu
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'PaDiscountPercent') 
   ALTER TABLE POST0011 ADD PaDiscountPercent DECIMAL(28,8) NULL 
END
--Ngày chiết khấu
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'PaDiscountDays') 
   ALTER TABLE POST0011 ADD PaDiscountDays DECIMAL(28,8) NULL 
END
--Mã phân tích đối tượng 1
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'O01ID') 
   ALTER TABLE POST0011 ADD O01ID VARCHAR(50) NULL 
END
--Mã phân tích đối tượng 2
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'O02ID') 
   ALTER TABLE POST0011 ADD O02ID VARCHAR(50) NULL 
END
--Mã phân tích đối tượng 3
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'O03ID') 
   ALTER TABLE POST0011 ADD O03ID VARCHAR(50) NULL 
END
--Mã phân tích đối tượng 4
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'O04ID') 
   ALTER TABLE POST0011 ADD O04ID VARCHAR(50) NULL 
END
--Mã phân tích đối tượng 5
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'O05ID') 
   ALTER TABLE POST0011 ADD O05ID VARCHAR(50) NULL 
END
--Phương thức thanh toán 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'PaymentID') 
   ALTER TABLE POST0011 ADD PaymentID NVARCHAR(250) NULL 
END
---Là khách hàng VAT
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'IsVATAccountID') 
   ALTER TABLE POST0011 ADD IsVATAccountID TINYINT NULL 
END

--Địa chỉ ngân hàng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'BankAddress') 
   ALTER TABLE POST0011 ADD BankAddress NVARCHAR(250) NULL 
END
--Thị Phượng Date 18/01/2017 : Bổ sung 2 cột Tên công ty và Địa chỉ công ty
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'CompanyName') 
   ALTER TABLE POST0011 ADD CompanyName NVARCHAR(250) NULL 
END
/*===============================================END CompanyName===============================================*/ 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'CompanyAddress') 
   ALTER TABLE POST0011 ADD CompanyAddress NVARCHAR(250) NULL 
END
/*===============================================END CompanyAddress===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'AccruedPurchase') 
   ALTER TABLE POST0011 ADD AccruedPurchase DECIMAL(28,8) NULL 
END

-----------Modify by Trà Giang- Date 28/9/2018 Sua Birthday smalldatetime sang datetime --------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0011' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0011' AND col.name='Birthday')
	ALTER TABLE POST0011 ALTER COLUMN Birthday datetime NULL
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'BeginPeriodDebt') 
   ALTER TABLE POST0011 ADD BeginPeriodDebt INT NULL 
END
--- Modified by Tấn Lộc on 24/05/2021: Bổ sung cột WarningNoOrdersGenerated - [Cảnh báo không phát sinh don hàng]
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'POST0011' AND xtype = 'U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab
    ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'WarningNoOrdersGenerated')
    ALTER TABLE POST0011 ADD WarningNoOrdersGenerated TINYINT NULL
END

-----------Modify by Ðoàn Duy- Date 7/7/2021 thêm c?t Password --------------------
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Password') 
   ALTER TABLE POST0011 ADD Password NVARCHAR(100) NULL 
END

-----------Modify by Minh Hiếu- Date 14/02/2022 thêm cột Tel --------------------
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Tel1') 
   ALTER TABLE POST0011 ADD Tel1 NVARCHAR(100) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0011' AND col.name = 'Tel2') 
   ALTER TABLE POST0011 ADD Tel2 NVARCHAR(100) NULL 
END

