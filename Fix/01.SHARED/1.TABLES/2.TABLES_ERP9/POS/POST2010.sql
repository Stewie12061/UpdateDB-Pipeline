---- Create by Phan thanh hoàng vũ on 12/8/2017 10:02:05 AM
---- Danh sách phiếu đặt cọc (Master)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST2010]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST2010]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [ShopID] VARCHAR(50) NULL,
  [VoucherTypeID] VARCHAR(50) NULL,
  [TranMonth] INT NULL,
  [TranYear] INT NULL,
  [VoucherNo] VARCHAR(50) NULL,
  [VoucherDate] DATETIME NULL,
  [ObjectID] VARCHAR(50) NULL,
  [MemberID] VARCHAR(50) NULL,
  [Tel] VARCHAR(50) NULL,
  [Address] NVARCHAR(250) NULL,
  [CurrencyID] VARCHAR(50) NULL,
  [ExchangeRate] DECIMAL(28,8) NULL,
  [EmployeeID] VARCHAR(50) NULL,
  [Description] NVARCHAR(250) NULL,
  [SaleManID] VARCHAR(50) NULL,
  [BookingAmount] DECIMAL(28,8) NULL,
  [IsInvoice] TINYINT DEFAULT (0) NULL,
  [RelatedToTypeID] INT DEFAULT 50 NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_POST2010] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END


/*===============================================END APKPaymentID===============================================*/

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2010' AND col.name = 'APKPaymentID') 
   ALTER TABLE POST2010 ADD APKPaymentID UNIQUEIDENTIFIER NULL 
END

/*===============================================END APKPaymentID===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2010' AND col.name = 'PaymentObjectID01') 
   ALTER TABLE POST2010 ADD PaymentObjectID01 VARCHAR(50) NULL 
END

/*===============================================END PaymentObjectID01===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2010' AND col.name = 'PaymentObjectName01') 
   ALTER TABLE POST2010 ADD PaymentObjectName01 NVARCHAR(250) NULL 
END

/*===============================================END PaymentObjectName01===============================================*/

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2010' AND col.name = 'AccountNumber01') 
   ALTER TABLE POST2010 ADD AccountNumber01 NVARCHAR(250) NULL 
END

/*===============================================END AccountNumber01===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2010' AND col.name = 'PaymentObjectAmount01') 
   ALTER TABLE POST2010 ADD PaymentObjectAmount01 DECIMAL(28,8) NULL 
END

/*===============================================END PaymentObjectAmount01===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2010' AND col.name = 'PaymentObjectID02') 
   ALTER TABLE POST2010 ADD PaymentObjectID02 VARCHAR(50) NULL 
END

/*===============================================END PaymentObjectID02===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2010' AND col.name = 'PaymentObjectName02') 
   ALTER TABLE POST2010 ADD PaymentObjectName02 NVARCHAR(250) NULL 
END

/*===============================================END PaymentObjectName02===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2010' AND col.name = 'AccountNumber02') 
   ALTER TABLE POST2010 ADD AccountNumber02 NVARCHAR(250) NULL 
END

/*===============================================END AccountNumber02===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2010' AND col.name = 'PaymentObjectAmount02') 
   ALTER TABLE POST2010 ADD PaymentObjectAmount02 DECIMAL(28,8) NULL 
END

/*===============================================END PaymentObjectAmount02===============================================*/

---<<<<<<<<Bổ sung sau đào tạo khách hàng OKIA dùng 2 phương thức thanh toán, đồng nhất với bên phiếu bán hàng
---Modified by Thị Phượng on 21/12/2017: Bổ sung cột Hình thức thanh toán cho phiếu cọc
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2010' AND col.name = 'PaymentID') 
   ALTER TABLE POST2010 ADD PaymentID VARCHAR(50) NULL 
END

--Modified by Hoàng vũ Date: 18/04/2018: Bổ sung trường phân biệt Bảng giá trước thuế hay sau thuế (1: sau thuế; 0: trước thuế) => Chuyển từ bảng POST2011 qua
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2010' AND col.name = 'IsTaxIncluded') 
   ALTER TABLE POST2010 ADD IsTaxIncluded TINYINT NULL 
END

/*===============================================END IsTaxIncluded===============================================*/ 

--Modified by Hoàng vũ Date: 12/02/2019: Bổ sung trường phân biệt dữ liệu đã cắt số liệu so với ERP (Trường hợp Nếu cắt số liệu thì Bắn dữ liệu qua bảng POST00162 và update lại trường này già trị =1 ) => trước tiên làm cho OKIA
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2010' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2010' AND col.name = 'IsCutDataERP') 
   ALTER TABLE POST2010 ADD IsCutDataERP TINYINT NULL 
END
/*===============================================END IsCutDataERP===============================================*/ 