--- Created on 27/06/2014 by Phan thanh hoàng vũ
--- Editted on 02/07/2014 by Phan thanh hoàng vũ
--- Master-Lưu trữ thông tin trạng thái từng bàn
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'POST0033') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE POST0033 (
		APK uniqueidentifier default NEWID() NOT NULL,
		DivisionID  varchar (50) NOT NULL,
		ShopID  varchar (50) NOT NULL,
		AreaID  varchar (50) NOT NULL,
		TableID  varchar (50) NOT NULL default 0,
		StatusTableID  int  NOT NULL default 1, ---Trạng thái bàn------1: đã chọn món (Cam); 2: Đã in chế biến (Đỏ); 3: đã in hóa đơn (Xanh); 4: Đã lưu hóa đơn
		ProcessingNumberPrint int NOT NULL default 0,
		VoucherPrintDate Datetime Null, --Thời gian in hóa đơn (Bắn qua bảng POST0016)
		OrderPrintDate Datetime Null, --Thời gian In chon món (Order bàn) (Bắn qua bảng POST0016)
		VoucherSaveDate Datetime Null, --Thời gian Lưu hóa đơn (Bắn qua bảng POST0016)
		VoucherID varchar(50) NULL,
		VoucherNo varchar(50) NULL,
		VoucherDate Datetime Null,
		VoucherTypeID varchar(50) NULL,
		TranMonth int  NOT NULL default 0,
		TranYear int  NOT NULL default 0,
		ObjectID varchar(50) NULL,
		ObjectName nvarchar(250) NULL,
		MemberID varchar(50) NULL,
		MemberName nvarchar(250) NULL,
		AccruedScore INT NULL,
		PayScore INT NULL,
		PayScoreRate DECIMAL(28,8) NULL,
		AmountOfPoint DECIMAL(28,8) NULL,
		PaymentObjectID01 varchar(50) NULL,
		PaymentObjectName01 nvarchar(250) NULL,
		CurrencyID varchar(50) NULL,
		CurrencyName nvarchar(250) NULL,
		ExchangeRate decimal(28, 8) default 0,
		TotalAmount decimal(28, 8) default 0,
		TotalTaxAmount decimal(28, 8) default 0,
		TotalDiscountAmount decimal(28, 8) default 0,
		TotalInventoryAmount decimal(28, 8) default 0,
		Change decimal(28, 8) default 0,
		DefaultPrinter3   nvarchar (250) NULL,
		PaymentObjectID02  varchar(50) NULL,
		PaymentObjectName02 nvarchar(250) NULL,
		TotalDiscountRate decimal(28, 8) default 0,
		TotalRedureRate decimal(28, 8) default 0,
		TotalRedureAmount decimal(28, 8) default 0,
		PaymentObjectAmount01 decimal(28, 8) default 0,
		PaymentObjectAmount02 decimal(28, 8) default 0,
		AccountNumber01 nvarchar(250) NULL,
		AccountNumber02 nvarchar(250) NULL,
		EmployeeID varchar(50) NULL,
		EmployeeName nvarchar(250) NULL,
		APKPaymentID uniqueidentifier Null,
		IsTranferred tinyint  default 0,	
		CreateUserID varchar(50) NULL,
		CreateDate datetime NULL,
		LastModifyUserID varchar(50) NULL,
		LastModifyDate datetime NULL,
	 CONSTRAINT  PK_POST0033  PRIMARY KEY CLUSTERED 
	(
		APK ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
