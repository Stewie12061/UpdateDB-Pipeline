---- Create by Phan thanh hoàng vũ on 12/8/2017 10:05:48 AM
---- Danh sách phiếu đặt cọc (detail)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST2011]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST2011]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [APKMaster] UNIQUEIDENTIFIER NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [ShopID] VARCHAR(50) NULL,
  [PackagePriceID] VARCHAR(50) NULL,		--Bảng giá bán theo gói
  [IsPackage] TINYINT DEFAULT (0) NULL,		--Là mặt hàng theo gói
  [PackageID] VARCHAR(50) NULL,				--Gói sản phẩm trong bảng giá bán
  [InventoryID] VARCHAR(50) NULL,			--Mặt hàng thuộc bảng giá bán
  [InventoryName] NVARCHAR(250) NULL,
  [UnitID] VARCHAR(50) NULL,
  [ActualQuantity] DECIMAL(28,8) NULL,
  [UnitPrice] DECIMAL(28,8) NULL,
  [Amount] DECIMAL(28,8) NULL,
  [ConvertAmount] DECIMAL(28,8) NULL,
  [DiscountRate] DECIMAL(28,8) NULL,
  [DiscountAmount] DECIMAL(28,8) NULL,
  [ConvertDiscountAmount] DECIMAL(28,8) NULL,
  [VATGroupID] VARCHAR(50) NULL,
  [VATPercent] DECIMAL(28,8) NULL,
  [TaxAmount] DECIMAL(28,8) NULL,
  [ConvertTaxAmount] DECIMAL(28,8) NULL,
  [InventoryAmount] DECIMAL(28,8) NULL,
  [ConvertInventoryAmount] DECIMAL(28,8) NULL,
  [Notes] NVARCHAR(250) NULL,
  [OrderNo] INT NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [APKMInherited] UNIQUEIDENTIFIER NULL,
  [APKDInherited] UNIQUEIDENTIFIER NULL,
  [Ana01ID] VARCHAR(50) NULL,
  [Ana02ID] VARCHAR(50) NULL,
  [Ana03ID] VARCHAR(50) NULL,
  [Ana04ID] VARCHAR(50) NULL,
  [Ana05ID] VARCHAR(50) NULL,
  [Ana06ID] VARCHAR(50) NULL,
  [Ana07ID] VARCHAR(50) NULL,
  [Ana08ID] VARCHAR(50) NULL,
  [Ana09ID] VARCHAR(50) NULL,
  [Ana10ID] VARCHAR(50) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_POST2011] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

--Trường [Khách đến lấy hàng]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'MemberToTake') 
   ALTER TABLE POST2011 ADD MemberToTake TINYINT DEFAULT (0) NULL 
END
/*===============================================END MemberToTake===============================================*/ 

--Giao hàng cho khách
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'DeliveryToMemberID') 
   ALTER TABLE POST2011 ADD DeliveryToMemberID TINYINT DEFAULT (0) NULL 
END
/*===============================================END DeliveryToMemberID===============================================*/

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'WareHouseID') 
   ALTER TABLE POST2011 ADD WareHouseID VARCHAR(50) NULL 
END

/*===============================================END WareHouseID===============================================*/ 
--Modified by Thị Phượng Date: 26/03/2018: Bổ sung trường phân biệt gói để group dữ liệu gói để lưu theo đúng thứ tự
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'OrderPackage') 
   ALTER TABLE POST2011 ADD OrderPackage INT NULL 
END

/*===============================================END OrderPackage===============================================*/ 
--Modified by Hoàng vũ Date: 18/04/2018: Bổ sung trường phân biệt Bảng giá trước thuế hay sau thuế (1: sau thuế; 0: trước thuế)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'IsTaxIncluded') 
   ALTER TABLE POST2011 ADD IsTaxIncluded TINYINT NULL 
END

/*===============================================END IsTaxIncluded===============================================*/ 
--Modified by Hoàng vũ Date: 18/04/2018: Nếu bảng giá sau thì lấy chiết khấu tính lại để ra đơn giá trước chiết khấu
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'BeforeVATDiscountAmount') 
   ALTER TABLE POST2011 ADD BeforeVATDiscountAmount DECIMAL(28,8) NULL 
END

/*===============================================END BeforeVATDiscountAmount===============================================*/ 
--Modified by Hoàng vũ Date: 18/04/2018: Nếu bảng giá sau thì lấy đơn giá tính lại để ra đơn giá trước thuế
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'BeforeVATUnitPrice') 
   ALTER TABLE POST2011 ADD BeforeVATUnitPrice DECIMAL(28,8) NULL 
END

/*===============================================END BeforeVATUnitPrice===============================================*/ 

--Lưu vết Bảng giá chung [Bán hàng theo bảng giá chung]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'IsTable') 
   ALTER TABLE POST2011 ADD IsTable TINYINT NULL 
END
/*===============================================END IsTable===============================================*/ 

--Lưu vết Bảng giá chung [Bán hàng theo bảng giá chung]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'PriceTable') 
   ALTER TABLE POST2011 ADD PriceTable VARCHAR(50) NULL 
END
/*===============================================END PriceTable===============================================*/ 

--Lưu vết [Khuyến mãi tăng hàng theo hóa đơn]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'IsInvoicePromotionID') 
   ALTER TABLE POST2011 ADD IsInvoicePromotionID TINYINT NULL 
END
/*===============================================END IsInvoicePromotionID===============================================*/ 

--Lưu vết [Khuyến mãi tăng hàng theo hóa đơn]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'InvoicePromotionID') 
   ALTER TABLE POST2011 ADD InvoicePromotionID VARCHAR(50) NULL 
END
/*===============================================END InvoicePromotionID===============================================*/

--Lưu vết Bảng giá khuyến mãi [Bán hàng theo bảng giá khuyến mãi]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'IsPromotePriceTable') 
   ALTER TABLE POST2011 ADD IsPromotePriceTable TINYINT NULL 
END
/*===============================================END IsPromotePriceTable===============================================*/

--Lưu vết Bảng giá khuyến mãi [Bán hàng theo bảng giá khuyến mãi]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'PromotePriceTableID') 
   ALTER TABLE POST2011 ADD PromotePriceTableID VARCHAR(50) NULL 
END
/*===============================================END PromotePriceTableID===============================================*/

--Lưu vết hàng khuyến mãi [Khuyến mãi hàng tặng hàng]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'IsPromotion') 
   ALTER TABLE POST2011 ADD IsPromotion TINYINT NULL 
END
/*===============================================END IsPromotion===============================================*/ 

--Lưu vết hàng khuyến mãi [Khuyến mãi hàng tặng hàng]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'PromoteID') 
   ALTER TABLE POST2011 ADD PromoteID VARCHAR(50) NULL 
END
/*===============================================END PromoteID===============================================*/ 

--Quản lý bán hàng theo gói sản phẩm (1 gói sản phẩm có thể khai báo 1 mặt hàng nhiều lần): lưu vết để truy xuất ngược gói để lấy giá, thuế.
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'APKPackageInventoryID') 
   ALTER TABLE POST2011 ADD APKPackageInventoryID UNIQUEIDENTIFIER NULL 
END
/*===============================================END APKPackageInventoryID===============================================*/ 

--Lưu vết [Giá tối thiểu] của bảng giá bán dưới ERP8 => VUONGSACH và NHANNGOC dùng trường này để ghi diểm/tính hoa dòng theo nhân viên bàn hàng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'MinPrice') 
   ALTER TABLE POST2011 ADD MinPrice DECIMAL(28,8) NULL 
END
/*===============================================END MinPrice===============================================*/ 

--Lưu vết [Ghi chú 1] của bảng giá bán dưới ERP8 => NHANNGOC dùng trường này để ghi diểm/tính hoa hồng theo Điểm giao hàng + lắp đặt
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'Notes01') 
   ALTER TABLE POST2011 ADD Notes01 NVARCHAR(250) NULL 
END
/*===============================================END Notes01===============================================*/ 

--Lưu vết [Ghi chú 2] của bảng giá bán dưới ERP8 => NHANNGOC dùng trường này để ghi diểm/tính hoa hồng theo Điểm nhân viên kho
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'Notes02') 
   ALTER TABLE POST2011 ADD Notes02 NVARCHAR(250) NULL 
END
/*===============================================END Notes02===============================================*/

--Lưu vết [Ghi chú 3] của bảng giá bán dưới ERP8 => NHANNGOC dùng trường này để ghi diểm/tính hoa hồng theo Điểm bộ phận văn phòng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST2011' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST2011' AND col.name = 'Notes03') 
   ALTER TABLE POST2011 ADD Notes03 NVARCHAR(250) NULL 
END
/*===============================================END Notes03===============================================*/ 
