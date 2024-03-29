---- Create by Phan Thanh Hoàng Vũ on 10/11/2015 10:26:29 AM
--Modify by Thị Phượng, Bổ sung màn hình 20 tham số on 19/04/2017
---- Danh sách khách hàng (Của CRM giống bảng AT1202 của CI-8.0)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CRMT10101]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[CRMT10101]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [AccountID] NVARCHAR(50) NOT NULL,
      [AccountName] NVARCHAR(250) NULL,
	  [IsCustomer] TINYINT DEFAULT (0) NULL,
      [Address] NVARCHAR(250) NULL,
      [Tel] NVARCHAR(100) NULL,
      [Fax] NVARCHAR(100) NULL,
      [Email] NVARCHAR(100) NULL,
      [Website] NVARCHAR(100) NULL,
      [PaymentID] NVARCHAR(50) NULL,
      [BankName] NVARCHAR(250) NULL,
      [BankAccountNo] NVARCHAR(50) NULL,
      [EmployeeID] NVARCHAR(50) NULL,
      [PaCreditLimit] DECIMAL(28,8) NULL,
      [ReDueDays] DECIMAL(28,8) NULL,
      [PaDueDays] DECIMAL(28,8) NULL,
      [PaDiscountDays] DECIMAL(28,8) NULL,
      [PaDiscountPercent] DECIMAL(28,8) NULL,
      [RePaymentTermID] NVARCHAR(50) NULL,
      [PaPaymentTermID] NVARCHAR(50) NULL,
	  [ReDays] Int NULL, --Tuỗi nợ cho phép
      [O01ID] NVARCHAR(50) NULL,
      [O02ID] NVARCHAR(50) NULL,
      [O03ID] NVARCHAR(50) NULL,
      [O04ID] NVARCHAR(50) NULL,
      [O05ID] NVARCHAR(50) NULL,
	  [DeliveryAddress] NVARCHAR(250) NULL,--địa chỉ giao hàng
	  [DeliveryWardID] NVARCHAR(50) NULL,--Phường/xã giao hàng
	  [DeliveryDistrictID] NVARCHAR(50) NULL,--Quận/Huyện giao hàng
	  [DeliveryCityID] NVARCHAR(50) NULL,--TỈnh/thành giao hàng
	  [DeliveryPostalCodeID] NVARCHAR(50) NULL,--Mã vùng giao hàng
	  [DeliveryCountryID] NVARCHAR(50) NULL,--Quốc gia giao hàng
      [BillAddress] NVARCHAR(250) NULL,--địa chỉ thanh toán
	  [BillWard] NVARCHAR(250) NULL,--Phường/xã thanh toán
	  [BillDistrictID] NVARCHAR(50) NULL,--Quận/Huyện thanh toán
	  [BillCityID] NVARCHAR(50) NULL,--TỈnh/thành thanh toán
	  [BillPostalCodeID] NVARCHAR(50) NULL,--Mã vùng thanh toán
	  [BillCountryID] NVARCHAR(50) NULL,--Quốc gia thanh toán
      [Description] NVARCHAR(250) NULL,
	  [Note] NVARCHAR(250) NULL,
      [Note1] NVARCHAR(250) NULL,
	  [Note2] NVARCHAR(250) NULL,
	  [Note3] NVARCHAR(250) NULL,
	  [Note4] NVARCHAR(250) NULL,
	  [Note5] NVARCHAR(250) NULL,
	  [VATNo] NVARCHAR(50) NULL, --Mã số thuế
	  [ReCreditLimit] DECIMAL(28,8) NULL, --Hạn mức nợ cho phép	  
      [Disabled] TINYINT DEFAULT (0) NOT NULL,
	  [RouteID] VARCHAR(50) NULL,--Tuyến giao hàng
	  [IsVATAccountID] TINYINT DEFAULT (0) NULL,--Là khách hàng VAT
	  [VATAccountID] NVARCHAR(50) NULL,--Khách hàng VAT
	  [IsOrganize] TINYINT DEFAULT (0) NULL,--là tổ chức hay cá nhân
	  [IsInvoice] TINYINT DEFAULT (0) NULL, --giao kèm hóa đơn
	  [IsUsing] TINYINT DEFAULT (0) NULL, --Ngưng sử dụng
	  [IsCommon] TINYINT DEFAULT (0) NULL, --Dùng chung
	  [CreateDate] DATETIME NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL
    CONSTRAINT [PK_CRMT10101] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END

--Alter Pimary key 
		IF EXISTS (SELECT Top 1 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_TYPE = 'PRIMARY KEY' AND TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'CRMT10101')
		Begin
			--Thay đối khóa chính từ 2 khóa sang 1 khóa ([APK]) -> (AccountID)
			ALTER TABLE CRMT10101 DROP CONSTRAINT PK_CRMT10101
			ALTER TABLE CRMT10101 ADD CONSTRAINT PK_CRMT10101 PRIMARY KEY (AccountID)
		End

--CustomizeIndex = 51 Hoàng trần: Sai tên column khách hàng---
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='CRMT10101' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='CRMT10101' AND col.name='DeliveryWardID')
	EXEC sp_rename 'CRMT10101.DeliveryWardID', 'DeliveryWard', 'COLUMN';
END

--CustomizeIndex = 51 Hoàng trần: Sai tên column khách hàng---
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='CRMT10101' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='CRMT10101' AND col.name='DeliveryPostalCodeID')
	EXEC sp_rename 'CRMT10101.DeliveryPostalCodeID', 'DeliveryPostalCode', 'COLUMN';
END

--CustomizeIndex = 51 Hoàng trần: Sai tên column khách hàng---
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='CRMT10101' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='CRMT10101' AND col.name='BillPostalCodeID')
	EXEC sp_rename 'CRMT10101.BillPostalCodeID', 'BillPostalCode', 'COLUMN';
END
---Modified by Thị Phượng bổ sung cột NGười chuyển đổi
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'ConvertUserID') 
   ALTER TABLE CRMT10101 ADD ConvertUserID VARCHAR(50) NULL 
END
---Modified by Thị Phượng bổ sung cột Ngày sinh
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'BirthDate') 
   ALTER TABLE CRMT10101 ADD BirthDate DATETIME NULL 
END
--Bổ sung loại chuyển đối 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'ConvertType') 
   ALTER TABLE CRMT10101 ADD ConvertType INT NULL 
END

-- Bổ sung tham chiếu ID đối tượng chuyển đổi
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'InheritConvertID') 
   ALTER TABLE CRMT10101 ADD InheritConvertID VARCHAR(50) NULL 
END

--- Mã loại khách hàng mặc định
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'RelatedToTypeID') 
   ALTER TABLE CRMT10101 ADD RelatedToTypeID INT DEFAULT 3 NOT NULL
END
--Lý do chuyển đổi
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'CauseConverted') 
   ALTER TABLE CRMT10101 ADD CauseConverted NVARCHAR(max) NULL 
END
--Diễn giải chuyển đổi
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'DescriptionConvert') 
   ALTER TABLE CRMT10101 ADD DescriptionConvert NVARCHAR(Max) NULL 
END
--NGười phụ trách KH
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'AssignedToUserID')
   ALTER TABLE CRMT10101 ADD AssignedToUserID VARCHAR(50) NULL 
END
--Cột phân loại (mã tăng tự động)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'S1') 
   ALTER TABLE CRMT10101 ADD S1 VARCHAR(50) NULL 
END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'S2') 
   ALTER TABLE CRMT10101 ADD S2 VARCHAR(50) NULL 
END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'S3') 
   ALTER TABLE CRMT10101 ADD S3 VARCHAR(50) NULL 
END
--Modify by Thị Phượng, Bổ sung màn hình 20 tham số----BEGIN
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar01') 
   ALTER TABLE CRMT10101 ADD Varchar01 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar02') 
   ALTER TABLE CRMT10101 ADD Varchar02 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar03') 
   ALTER TABLE CRMT10101 ADD Varchar03 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar04') 
   ALTER TABLE CRMT10101 ADD Varchar04 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar05') 
   ALTER TABLE CRMT10101 ADD Varchar05 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar06') 
   ALTER TABLE CRMT10101 ADD Varchar06 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar07') 
   ALTER TABLE CRMT10101 ADD Varchar07 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar08') 
   ALTER TABLE CRMT10101 ADD Varchar08 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar09') 
   ALTER TABLE CRMT10101 ADD Varchar09 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar10') 
   ALTER TABLE CRMT10101 ADD Varchar10 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar11') 
   ALTER TABLE CRMT10101 ADD Varchar11 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar12') 
   ALTER TABLE CRMT10101 ADD Varchar12 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar13') 
   ALTER TABLE CRMT10101 ADD Varchar13 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar14') 
   ALTER TABLE CRMT10101 ADD Varchar14 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar15') 
   ALTER TABLE CRMT10101 ADD Varchar15 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar16') 
   ALTER TABLE CRMT10101 ADD Varchar16 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar17') 
   ALTER TABLE CRMT10101 ADD Varchar17 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar18') 
   ALTER TABLE CRMT10101 ADD Varchar18 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar19') 
   ALTER TABLE CRMT10101 ADD Varchar19 NVARCHAR(250) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Varchar20') 
   ALTER TABLE CRMT10101 ADD Varchar20 NVARCHAR(250) NULL 
END
-----END
---Modify by Thị Phượng: Date 26/06/2017 -- Lĩnh vực kinh doanh
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'BusinessLinesID') 
   ALTER TABLE CRMT10101 ADD BusinessLinesID VARCHAR(50) NULL 
END

--Hoài Phong Date 20/08/2020 Mở rộng ký tự Email

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Email') 
   BEGIN
	
		-- Modify by Văn Tài on 04/02/2021 - Xóa ràng buộc trước khi ALTER cột.
		IF EXISTS (SELECT TOP 1 1 FROM sys.indexes WHERE name='DivisionID_AssignedToUserID' AND object_id = OBJECT_ID('[dbo].CRMT10101'))
			DROP INDEX [DivisionID_AssignedToUserID] ON [CRMT10101];

		ALTER TABLE CRMT10101 ALTER COLUMN Email NVARCHAR(MAX)  NULL
	END
END

-- Minh Hiếu Date 11/02/2022 Thêm 2 cột Tel
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Tel1') 
   ALTER TABLE CRMT10101 ADD Tel1 NVARCHAR(100) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10101' AND col.name = 'Tel2') 
   ALTER TABLE CRMT10101 ADD Tel2 NVARCHAR(100) NULL 
END

	
