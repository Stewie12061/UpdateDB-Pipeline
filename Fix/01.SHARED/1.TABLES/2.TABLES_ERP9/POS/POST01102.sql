---- Create by Phan thanh hoàng vũ on 8/7/2017 9:10:31 AM
---- Danh sách đơn hàng-Detail (trên APP-Mobile)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST01102]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST01102]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [APKMaster] UNIQUEIDENTIFIER NOT NULL,
  [DivisionID] VARCHAR(50) NULL,
  [ShopID] VARCHAR(50) NULL,
  [InventoryID] VARCHAR(50) NULL,
  [InventoryName] NVARCHAR(250) NULL,
  [UnitID] VARCHAR(50) NULL,
  [ActualQuantity] DECIMAL(28,8) NULL,
  [UnitPrice] DECIMAL(28,8) NULL,
  [Amount] DECIMAL(28,8) NULL,
  [AmountConverted] DECIMAL(28,8) NULL,
  [IsPromotion] TINYINT DEFAULT (0) NULL,
  [PromoteChangeUnitPrice] DECIMAL(28,8) NULL,
  [PromoteChangeUnitPriceConverted] DECIMAL(28,8) NULL,
  [CA] DECIMAL(28,8) NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [APKMInherited] UNIQUEIDENTIFIER NULL,
  [APKDInherited] UNIQUEIDENTIFIER NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_POST01102] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'CAAmount') 
   ALTER TABLE POST01102 ADD CAAmount DECIMAL(28,8) NULL 
END
---Modify By Thị Phượng 15/09/2017 bổ sung cột giá bán trả góp
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'InstallmentPrice') 
   ALTER TABLE POST01102 ADD InstallmentPrice DECIMAL(28,8) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'Orders') 
   ALTER TABLE POST01102 ADD Orders INT NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'IsInstallmentPrice') 
   ALTER TABLE POST01102 ADD IsInstallmentPrice TINYINT NULL 
END

/*===============================================END InstallmentPrice===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'MinPrice') 
   ALTER TABLE POST01102 ADD MinPrice DECIMAL(28,8) NULL 
END

/*===============================================END MinPrice===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'Notes01') 
   ALTER TABLE POST01102 ADD Notes01 NVARCHAR(250) NULL 
END

/*===============================================END Notes01===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'Notes02') 
   ALTER TABLE POST01102 ADD Notes02 NVARCHAR(250) NULL 
END

/*===============================================END Notes02===============================================*/

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'Notes03') 
   ALTER TABLE POST01102 ADD Notes03 NVARCHAR(250) NULL 
END

/*===============================================END Notes03===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'Notes04') 
   ALTER TABLE POST01102 ADD Notes04 NVARCHAR(250) NULL 
END
/*===============================================END Notes04===============================================*/ 


--Bổ sung một số cột lưu vết giống bên phiếu bán hàng POS
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'IsTable') 
   ALTER TABLE POST01102 ADD IsTable TINYINT NULL 
END
/*===============================================END IsTable===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'PriceTable') 
   ALTER TABLE POST01102 ADD PriceTable VARCHAR(50) NULL 
END
/*===============================================END PriceTable===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'IsPromotePriceTable') 
   ALTER TABLE POST01102 ADD IsPromotePriceTable TINYINT NULL 
END
/*===============================================END IsPromotePriceTable===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'PromotePriceTableID') 
   ALTER TABLE POST01102 ADD PromotePriceTableID VARCHAR(50) NULL 
END
/*===============================================END PromotePriceTableID===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'PromoteID') 
   ALTER TABLE POST01102 ADD PromoteID VARCHAR(50) NULL 
END
/*===============================================END PromoteID===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'IsTaxIncluded') 
   ALTER TABLE POST01102 ADD IsTaxIncluded TINYINT NULL 
END
/*===============================================END IsTaxIncluded===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'BeforeVATDiscountAmount') 
   ALTER TABLE POST01102 ADD BeforeVATDiscountAmount DECIMAL(28,8) NULL 
END
/*===============================================END BeforeVATDiscountAmount===============================================*/

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'BeforeVATUnitPrice') 
   ALTER TABLE POST01102 ADD BeforeVATUnitPrice DECIMAL(28,8) NULL 
END
/*===============================================END BeforeVATUnitPrice===============================================*/

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'DiscountRate') 
   ALTER TABLE POST01102 ADD DiscountRate DECIMAL(28,8) NULL 
END
/*===============================================END DiscountRate===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'DiscountAmount') 
   ALTER TABLE POST01102 ADD DiscountAmount DECIMAL(28,8) NULL 
END
/*===============================================END DiscountAmount===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'VATGroupID') 
   ALTER TABLE POST01102 ADD VATGroupID VARCHAR(50) NULL 
END
/*===============================================END VATGroupID===============================================*/

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'VATPercent') 
   ALTER TABLE POST01102 ADD VATPercent DECIMAL(28,8) NULL 
END
/*===============================================END VATPercent===============================================*/ 

--Quan lý việc có sự dụng phiếu quà tặng cho hóa đơn này hay không (Làm trước cho Khách hàng NHÂN NGỌC)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'IsGiftVoucherUsed') 
   ALTER TABLE POST01102 ADD IsGiftVoucherUsed TINYINT NULL 
END
/*===============================================END IsGiftVoucherUsed===============================================*/ 

--Trường này chính là giá bán lúc search lên từ bảng giá trong Store POSP0067, lưu váo trường này mục đích khi edit phiếu chọn bỏ check [Giá trả góp] thì sẽ set giá này lại giá bán ban đầu 
--=> Hiện tại nếu đã check chọn giá trả góp, edit phiếu thì giá bán không tự load lại]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01102' AND col.name = 'RefUnitPrice') 
   ALTER TABLE POST01102 ADD RefUnitPrice DECIMAL(28,8) NULL 
END
/*===============================================END RefUnitPrice===============================================*/ 

