----------------Customer Phuclong--Thêm {Mã khu vực}--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0027' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0027' AND col.name='AreaID')
	ALTER TABLE POST0027 ADD AreaID varchar(50) NULL
END

----------------Customer Phuclong--Thêm {Mã bàn}--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0027' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0027' AND col.name='TableID')
	ALTER TABLE POST0027 ADD TableID varchar(50) NULL
END

----------------Dùng để lấy chứng từ tham chiếu phiếu nhập/phiếu xuất sinh ra từ ----------------------
----------------phiếu bán hàng/ phiếu đổi hàng/phiếu trả hàng VoucherID--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0027' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0027' AND col.name='VoucherID')
	ALTER TABLE POST0027 ADD VoucherID varchar(50) NULL
END

----------------Dùng để phân biệt phiếu xuất sinh ra từ ERP hay POS----------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0027' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0027' AND col.name='DBTableID')
	ALTER TABLE POST0027 ADD DBTableID varchar(50) NULL
END
				----Thị Phượng-(Customer TMQ3)--------Dùng để phân biệt phiếu xuất sinh ra trực tiếp hay từ phieu bán hàng----------------------
		IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0027' AND xtype='U')
		BEGIN
			IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
			ON col.id=tab.id WHERE tab.name='POST0027' AND col.name='Status')
			ALTER TABLE POST0027 ADD Status TINYINT
		END
----------------Dùng để xuất kho cho hội viên nào----------------------
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'MemberID')
   ALTER TABLE POST0027 ADD MemberID VARCHAR(50) NULL
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'MemberName')
   ALTER TABLE POST0027 ADD MemberName NVARCHAR(250) NULL
END

--Thêm trường [Địa chỉ giao hàng]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'DeliveryAddress') 
   ALTER TABLE POST0027 ADD DeliveryAddress NVARCHAR(250) NULL 
END
/*===============================================END DeliveryAddress===============================================*/ 

--Thêm trường [Người liên hệ]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'DeliveryContact') 
   ALTER TABLE POST0027 ADD DeliveryContact NVARCHAR(250) NULL 
END
/*===============================================END DeliveryContact===============================================*/ 

--Thêm trường [Điện thoại]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'DeliveryMobile') 
   ALTER TABLE POST0027 ADD DeliveryMobile NVARCHAR(250) NULL 
END
/*===============================================END DeliveryMobile===============================================*/

--Thêm trường [Người nhận hàng]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'DeliveryReceiver') 
   ALTER TABLE POST0027 ADD DeliveryReceiver NVARCHAR(250) NULL 
END
/*===============================================END DeliveryReceiver===============================================*/ 
---Add columns by Thị Phượng: Customize = 87 (OKIA) on 25/12/2017
---BEGIN---
-- Đã Check in
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'InTime') 
   ALTER TABLE POST0027 ADD InTime DATETIME NULL 
END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'IsInTime') 
   ALTER TABLE POST0027 ADD IsInTime TINYINT NULL 
END
-- Xác nhận đi
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'OutTime') 
   ALTER TABLE POST0027 ADD OutTime DATETIME NULL 
END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'IsOutTime') 
   ALTER TABLE POST0027 ADD IsOutTime TINYINT NULL 
END
-- Nhân viên giao hàng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'DeliveryEmployeeID') 
   ALTER TABLE POST0027 ADD DeliveryEmployeeID VARCHAR(50) NULL 
END
-- Tình trạng giao hàng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'DeliveryStatus') 
   ALTER TABLE POST0027 ADD DeliveryStatus INT NULL 
END
-- Đã thu tiền
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'IsPayment') 
   ALTER TABLE POST0027 ADD IsPayment TINYINT NULL 
END
-- Đã chuyển khoản
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'IsTransferMoney') 
   ALTER TABLE POST0027 ADD IsTransferMoney TINYINT NULL 
END
-- Đã nhận tiền (BM xác nhận)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'IsReceiptMoney') 
   ALTER TABLE POST0027 ADD IsReceiptMoney TINYINT NULL 
END
-- Người thu tiền xác nhận
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'CashierID') 
   ALTER TABLE POST0027 ADD CashierID VARCHAR(50) NULL 
END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'CashierTime') 
   ALTER TABLE POST0027 ADD CashierTime DATETIME NULL 
END

----Lưu thêm thời gian [Đã thu tiền khách]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'PaymentTime') 
   ALTER TABLE POST0027 ADD PaymentTime DATETIME NULL 
END
/*===============================================END PaymentTime===============================================*/ 

--Lưu thêm thời gian [Đã chuyển khoản về công ty]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'TransferMoneyTime') 
   ALTER TABLE POST0027 ADD TransferMoneyTime DATETIME NULL 
END
/*===============================================END TransferMoneyTime===============================================*/ 

--Modified by Tiểu Mai on 23/07/2018: Bổ sung trường đối tượng giao hộ, ngày gửi giao (ATTOM)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'DeliveryObjectID') 
   ALTER TABLE POST0027 ADD DeliveryObjectID NVARCHAR(50) NULL 
   
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'DeliveryDate') 
   ALTER TABLE POST0027 ADD DeliveryDate DATETIME NULL
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0027' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0027' AND col.name = 'UserStaffWarehouse') 
   ALTER TABLE POST0027 ADD UserStaffWarehouse VARCHAR(50) NULL  
END



