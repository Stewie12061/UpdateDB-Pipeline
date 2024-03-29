---------------------------Thêm Khách đưa-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='Cash')
	ALTER TABLE POST0016 ADD Cash Decimal(28,6) DEFAULT (0) NULL
END
----------------------------Thêm Tiền thừa--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='Change')
	ALTER TABLE POST0016 ADD Change Decimal(28,6) DEFAULT (0) NULL
END

---------------------------Sửa trường PaymentID -> APKPaymentID-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='PaymentID')
	EXEC sp_rename 'dbo.POST0016.PaymentID', 'APKPaymentID', 'COLUMN';
END

---------------------------Sửa kiểu dữ liệu Varchar -> Unidientify-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='APKPaymentID')
	Alter Table POST0016
		Alter column APKPaymentID uniqueidentifier;
END

---------------------------Sửa trường PaymentObjectID -> PaymentObjectID01-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='PaymentObjectID')
	EXEC sp_rename 'dbo.POST0016.PaymentObjectID', 'PaymentObjectID01', 'COLUMN';
END

---------------------------Sửa trường PaymentObjectName -> PaymentObjectName01-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='PaymentObjectName')
	EXEC sp_rename 'dbo.POST0016.PaymentObjectName', 'PaymentObjectName01', 'COLUMN';
END
---------------------------Xóa Tên phương thức thanh toán-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='PaymentName')
	ALTER TABLE POST0016 Drop Column PaymentName
END

---------------------------Xóa Khách đưa-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
       IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
       ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='Cash')
       BEGIN
              EXEC DROPCONSTRAINT 'POST0016', 'Cash'
              ALTER TABLE POST0016 DROP COLUMN Cash
       END
END


----------------------------Thêm {2} = ID--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='PaymentObjectID02')
	ALTER TABLE POST0016 ADD PaymentObjectID02 varchar(50) NULL ;
END
---------------------------Xóa DROPCONSTRAINT-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
       IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
       ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='PaymentObjectID02')
       BEGIN
              EXEC DROPCONSTRAINT 'POST0016', 'PaymentObjectID02'             
       END
END

IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='PaymentObjectID02')
	Alter Table POST0016
		Alter column PaymentObjectID02 varchar(50) NULL ;
END

----------------------------Thêm {2} = Name--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='PaymentObjectName02')
	ALTER TABLE POST0016 ADD PaymentObjectName02 nvarchar(250) NULL ;
END
---------------------------Xóa DROPCONSTRAINT-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
       IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
       ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='PaymentObjectName02')
       BEGIN
              EXEC DROPCONSTRAINT 'POST0016', 'PaymentObjectName02'             
       END
END
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='PaymentObjectName02')
	Alter Table POST0016
		Alter column PaymentObjectName02 nvarchar(250) NULL ;
END
----------------------------Thêm {%Chiêt khấu}--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='TotalDiscountRate')
	ALTER TABLE POST0016 ADD TotalDiscountRate Decimal(28,6) DEFAULT (0) NULL
END
----------------------------Thêm {%Giảm giá}--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='TotalRedureRate')
	ALTER TABLE POST0016 ADD TotalRedureRate Decimal(28,6) DEFAULT (0) NULL
END
----------------------------Thêm {Tiền Giảm giá}--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='TotalRedureAmount')
	ALTER TABLE POST0016 ADD TotalRedureAmount Decimal(28,6) DEFAULT (0) NULL
END
----------------------------Thêm {3}--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='PaymentObjectAmount01')
	ALTER TABLE POST0016 ADD PaymentObjectAmount01 Decimal(28,6) DEFAULT (0) NULL
END
----------------------------Thêm {4}--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='PaymentObjectAmount02')
	ALTER TABLE POST0016 ADD PaymentObjectAmount02 Decimal(28,6) DEFAULT (0) NULL
END

----------------------------Thêm {Số tài khoản ngân hàng 01}--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='AccountNumber01')
	ALTER TABLE POST0016 ADD AccountNumber01 nvarchar(250) DEFAULT NULL
END

----------------------------Thêm {Số tài khoản ngân hàng 02}--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='AccountNumber02')
	ALTER TABLE POST0016 ADD AccountNumber02 nvarchar(250) DEFAULT NULL
END

----------------------------Thêm {Đã kết kết chuyển}--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='IsTransferred')
	ALTER TABLE POST0016 ADD IsTransferred Tinyint NULL
END

----------------Customer Phuclong--Thêm {Mã khu vực}--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='AreaID')
	ALTER TABLE POST0016 ADD AreaID varchar(50) NULL
END

----------------Customer Phuclong--Thêm {Mã bàn}--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='TableID')
	ALTER TABLE POST0016 ADD TableID varchar(50) NULL
END

----------------Customer Phuclong--Thêm {Thời gian order (Thời gian chọn món)}-----------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='OrderPrintDate')
	ALTER TABLE POST0016 ADD OrderPrintDate datetime NULL
END

----------------Customer Phuclong--Thêm {Thời gian In hóa đơn (Thời gian in tính tiền: update Trạng thái bàn: 3: Đã in hóa đơn)}-----------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='VoucherPrintDate')
	ALTER TABLE POST0016 ADD VoucherPrintDate datetime NULL
END

----------------Customer Phuclong--Thêm {Thời gian lưu phiếu (Thời gian nghiệp vụ: update Trạng thái bàn: 4: đã lưu hóa đơn)}-----------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='VoucherSaveDate')
	ALTER TABLE POST0016 ADD VoucherSaveDate datetime NULL
END

----------------Customer Phuclong--Thêm {VoucherID)}-----------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='VoucherID')
	ALTER TABLE POST0016 ADD VoucherID varchar(50) NULL
END

----------------Customer KingCom--Thêm {PVoucherNo: Số chứng từ trả hàng}-----------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='PVoucherNo')
	ALTER TABLE POST0016 ADD PVoucherNo varchar(50) NULL
END

----------------Customer KingCom--Thêm {CVoucherNo: Số chứng từ đổi hàng}-----------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='CVoucherNo')
	ALTER TABLE POST0016 ADD CVoucherNo varchar(50) NULL
END

----------------------------Thêm Customer-KINGCOM{ChangeAmount:Chênh lệch đổi hàng}--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='ChangeAmount')
	ALTER TABLE POST0016 ADD ChangeAmount Decimal(28,6) DEFAULT (0) NULL
END

----------------Thêm diễn giải {Description: Set null}-----------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0016' AND xtype='U')
BEGIN
	IF not EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0016' AND col.name='Description')
	ALTER TABLE POST0016 ADD Description nvarchar(250) NULL
END 

--Nhân viên bán hàng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0016' AND xtype = 'U')
BEGIN
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
   ON col.id = tab.id WHERE tab.name = 'POST0016' AND col.name = 'SaleManID')
   ALTER TABLE POST0016 ADD SaleManID VARCHAR(50) NULL
END

--Giao hàng hay chưa giao hàng (sinh phiếu xuất hay chưa có phiếu xuất)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0016' AND xtype = 'U')
BEGIN
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
   ON col.id = tab.id WHERE tab.name = 'POST0016' AND col.name = 'IsWarehouseExported')
   ALTER TABLE POST0016 ADD IsWarehouseExported TINYINT NULL
END

--Customize theo MINHSANG
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0016' AND xtype = 'U')
BEGIN
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
   ON col.id = tab.id WHERE tab.name = 'POST0016' AND col.name = 'PromoteChangeAmount')
   ALTER TABLE POST0016 ADD PromoteChangeAmount DECIMAL(28,8) NULL
END


IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0016' AND xtype = 'U')
BEGIN
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
   ON col.id = tab.id WHERE tab.name = 'POST0016' AND col.name = 'APPSuggestID')
   ALTER TABLE POST0016 ADD APPSuggestID UNIQUEIDENTIFIER NULL
END

/*===============================================END APPSuggestID===============================================*/ 

--Thêm trường [Tiền đặt cọc]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0016' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0016' AND col.name = 'BookingAmount') 
   ALTER TABLE POST0016 ADD BookingAmount DECIMAL(28,8) NULL 
END
/*===============================================END BookingAmount===============================================*/ 

--Thêm trường [Địa chỉ giao hàng]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0016' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0016' AND col.name = 'DeliveryAddress') 
   ALTER TABLE POST0016 ADD DeliveryAddress NVARCHAR(250) NULL 
END
/*===============================================END DeliveryAddress===============================================*/ 

--Thêm trường [Người liên hệ]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0016' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0016' AND col.name = 'DeliveryContact') 
   ALTER TABLE POST0016 ADD DeliveryContact NVARCHAR(250) NULL 
END
/*===============================================END DeliveryContact===============================================*/ 

--Thêm trường [Điện thoại]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0016' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0016' AND col.name = 'DeliveryMobile') 
   ALTER TABLE POST0016 ADD DeliveryMobile NVARCHAR(250) NULL 
END
/*===============================================END DeliveryMobile===============================================*/ 

--Thêm trường [Người nhận hàng]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0016' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0016' AND col.name = 'DeliveryReceiver') 
   ALTER TABLE POST0016 ADD DeliveryReceiver NVARCHAR(250) NULL 
END
/*===============================================END DeliveryReceiver===============================================*/ 

--Modified by Thị Phượng: Thêm trường [Ghi chú]/[Remarks]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0016' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0016' AND col.name = 'Notes') 
   ALTER TABLE POST0016 ADD Notes NVARCHAR(250) NULL 
END
/*===============================================END Notes===============================================*/ 
---Modified Date 26/01/2018 By Thị Phượng: thêm trường Tình trạng giao hàng của phiếu : 0: chưa giao, 1: đã giao, 2: đang giao

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0016' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0016' AND col.name = 'DeliveryStatus') 
   ALTER TABLE POST0016 ADD DeliveryStatus INT Default (0) NULL 
END

--End 
--Modified by Thị Phượng Date 29/01/2018: Cột Thu tiền đối tượng 1 (Phượng thức thanh toán 1)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0016' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0016' AND col.name = 'IsPaymentObject01') 
   ALTER TABLE POST0016 ADD IsPaymentObject01 TINYINT Default (0) NULL 
END
--Modified by Thị Phượng Date 29/01/2018: Cột Thu tiền đối tượng 2 (Phượng thức thanh toán 2)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0016' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0016' AND col.name = 'IsPaymentObject02') 
   ALTER TABLE POST0016 ADD IsPaymentObject02 TINYINT NULL 
END
--End

--Modified by Hoàng vũ Date: 18/04/2018: Bổ sung trường phân biệt Bảng giá trước thuế hay sau thuế (1: sau thuế; 0: trước thuế) => Trường này chuyền từ bảng POST00161
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0016' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0016' AND col.name = 'IsTaxIncluded') 
   ALTER TABLE POST0016 ADD IsTaxIncluded TINYINT NULL 
END

/*===============================================END IsTaxIncluded===============================================*/ 

--Modified by Hoàng vũ Date: 12/02/2019: Bổ sung trường phân biệt dữ liệu đã cắt số liệu so với ERP (Trường hợp Nếu cắt số liệu thì Bắn dữ liệu qua bảng POST00162 và update lại trường này già trị =1 ) => trước tiên làm cho OKIA
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0016' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0016' AND col.name = 'IsCutDataERP') 
   ALTER TABLE POST0016 ADD IsCutDataERP TINYINT NULL 
END
/*===============================================END IsCutDataERP===============================================*/ 

--Quan lý việc có sự dụng phiếu quà tặng cho hóa đơn này hay không nếu có thì tính tổng tiền qua tặng(Làm trước cho Khách hàng NHÂN NGỌC)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0016' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0016' AND col.name = 'TotalGiftVoucherAmount') 
   ALTER TABLE POST0016 ADD TotalGiftVoucherAmount DECIMAL(28,8) NULL 
END
/*===============================================END TotalGiftVoucherAmount===============================================*/ 