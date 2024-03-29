--- Created on 27/06/2014 by Phan thanh hoàng vũ
--- Editted on 02/07/2014 by Phan thanh hoàng vũ
--- Detail-Lưu trữ thông tin trạng thái món ăn của bàn
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'POST0034') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE POST0034 (
		APK uniqueidentifier default NEWID() NOT NULL,
		APKMaster uniqueidentifier not null,
		DivisionID  varchar (50) NOT NULL,
		ShopID  varchar (50) NOT NULL,
		InventoryID  varchar (50) NOT NULL,
		InventoryName  nvarchar (250) NOT NULL,
		UnitID   varchar (50) NOT NULL,
		UnitName   nvarchar (250) NOT NULL,
		ActualQuantity   decimal (28, 8) NOT NULL default 1,
		UnitPrice   decimal (28, 8) NOT NULL default 0,
		Amount   decimal (28, 8) NOT NULL default 0,
		DiscountRate   decimal (28, 8) NOT NULL default 0,
		DiscountAmount   decimal (28, 8) NOT NULL default 0,
		VATGroupID varchar(50) NULL,
		VATPercent decimal(28, 8) NULL,
		[IsPromotion] [tinyint] NULL DEFAULT 0,
		TaxAmount   decimal (28, 8) NOT NULL default 0,
		InventoryAmount   decimal (28, 8) NOT NULL,
		StatusRecordID  int  NULL default 1,--Trạng thái MH trong bàn-- 1: đã chọn món (Đen); 2: Đã in chế biến (Đỏ); 3: đã in hóa đơn (Xanh); 4: Đã lưu hóa đơn
		InventoryTypeID   varchar (50) NOT NULL,
		DefaultPrinter   nvarchar (250) NULL, 
		StatusCancelID   int  NOT NULL default 0,		---Trạng thái hủy-----0: Đang bán; 1: Trả món; 2: hủy
		ProcessingNumberPrint int NOT NULL default 0,
		ProcessingPrintDate Datetime Null, --Thời gian in chế biến (Bắn qua bảng POST00161)
		DeleteFlg tinyint NOT NULL,
		EVoucherNo varchar(50) NULL,
		APKMInherited uniqueidentifier NULL,
		APKDInherited uniqueidentifier NULL,
		MarkQuantity decimal(28, 8) NULL,
		Ana01ID varchar(50) NULL,
		Ana02ID varchar(50) NULL,
		Ana03ID varchar(50) NULL,
		Ana04ID varchar(50) NULL,
		Ana05ID varchar(50) NULL,
		Ana06ID varchar(50) NULL,
		Ana07ID varchar(50) NULL,
		Ana08ID varchar(50) NULL,
		Ana09ID varchar(50) NULL,
		Ana10ID varchar(50) NULL,
		Imei01 varchar(50) NULL,
		Imei02 varchar(50) NULL,
		CreateUserID varchar(50) NULL,
		CreateDate datetime NULL,
		LastModifyUserID varchar(50) NULL,
		LastModifyDate datetime NULL,
	 CONSTRAINT  PK_POST0034  PRIMARY KEY CLUSTERED 
	(
		APK ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
