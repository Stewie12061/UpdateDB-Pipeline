--- Created on 02/07/2014 by Phan thanh hoàng vũ
--- Xem trả món
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'POST0035') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE POST0035 (
		APK uniqueidentifier default NEWID() NOT NULL,
		DivisionID  varchar (50) NOT NULL,
		ShopID  varchar (50) NOT NULL,
		AreaID  varchar (50) NOT NULL,
		TableID  varchar (50) NOT NULL default 0,
		StatusTableID  int  NOT NULL default 1, ---Trạng thái bàn------1: đã chọn món (Cam); 2: Đã in chế biến (Đỏ); 3: đã in hóa đơn (Xanh); 4: Đã lưu hóa đơn
		VoucherID varchar(50) NULL,
		VoucherNo varchar(50) NULL,
		VoucherDate Datetime Null,
		VoucherTypeID varchar(50) NULL,
		TranMonth int  NOT NULL default 0,
		TranYear int  NOT NULL default 0,
		MemberID varchar(50) NULL,
		MemberName nvarchar(250) NULL,
		InventoryID varchar(50) null,
		InventoryName nvarchar(250) null,
		UnitID varchar(50) null,
		UnitName nvarchar(250) null,
		Quantity Decimal(28,8) null,
		UnitPrice Decimal(28,8) null,
		Description nvarchar(250) null,
		CreateUserID varchar(50) NULL,
		CreateDate datetime NULL,
		LastModifyUserID varchar(50) NULL,
		LastModifyDate datetime NULL,
	 CONSTRAINT  PK_POST0035  PRIMARY KEY CLUSTERED 
	(
		APK ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
