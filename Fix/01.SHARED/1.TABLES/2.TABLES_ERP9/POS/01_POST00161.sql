----------------Customer Phuclong--Thêm {Thời gian In chế biến (update Trạng thái bàn: 2: Đã in chế biến)}-----------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST00161' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST00161' AND col.name='ProcessingPrintDate')
	ALTER TABLE POST00161 ADD ProcessingPrintDate datetime NULL
END

----------------Customer Phuclong--Thêm {Số lần In chế biến}-----------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST00161' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST00161' AND col.name='ProcessingNumberPrint')
	ALTER TABLE POST00161 ADD ProcessingNumberPrint int NULL default 0
END

----------------Customer Kingcom--Thêm {IsKindVoucherID: dùng để biết trạng thái phiếu ---2: Phiếu bán hàng/Đổi hàng (Xuất lại); 1: Phiếu trả hàng /Đổi hàng (Nhập lại}-----------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST00161' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST00161' AND col.name='IsKindVoucherID')
	ALTER TABLE POST00161 ADD IsKindVoucherID int NULL default 0
END

----------------Customer Kingcom--Thêm {Chỉ dùng cho phiếu đổi hàng=> Nếu là 1 thì nhập hàng đổi}--------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST00161' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST00161' AND col.name='ID1')
	ALTER TABLE POST00161 ADD ID1 int NULL default 0
END
----------------Customer Kingcom--Thêm {Chỉ dùng cho phiếu đổi hàng=> Nếu là 1 thì xuất hàng đổi}--------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST00161' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST00161' AND col.name='ID2')
	ALTER TABLE POST00161 ADD ID2 int NULL default 0
END
		
--Customize theo MINHSANG: CA dùng để tính lượng theo nhân viên
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'CA')
   ALTER TABLE POST00161 ADD CA DECIMAL(28,8) NULL
END
/*===============================================END CA===============================================*/ 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'CAAmount')
   ALTER TABLE POST00161 ADD CAAmount DECIMAL(28,8) NULL
END

/*===============================================END CAAmount===============================================*/ 
--Customize theo MINHSANG: chênh lệch hàng khuyến mãi
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'PromoteChangeUnitPrice')
   ALTER TABLE POST00161 ADD PromoteChangeUnitPrice DECIMAL(28,8) NULL
END	
/*===============================================END PromoteChangeUnitPrice===============================================*/ 	
	

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'IsInstallmentPrice')
   ALTER TABLE POST00161 ADD IsInstallmentPrice TINYINT NULL
END
/*===============================================END IsInstallmentPrice===============================================*/ 

----------Thêm trường [Kho tổng giao] hay [Trả tại công ty] hay [Đổi tại công ty]-----
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'IsWarehouseGeneral') 
   ALTER TABLE POST00161 ADD IsWarehouseGeneral TINYINT NULL 
END
/*===============================================END IsWarehouseGeneral===============================================*/ 

----------Thêm trường [Xuất ngay] ----
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'IsExportNow') 
   ALTER TABLE POST00161 ADD IsExportNow TINYINT NULL 
END
/*===============================================END IsExportNow===============================================*/ 

----------Thêm trường [Số Series] --CustomizeIndex = 87 OKIA
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'SerialNo') 
   ALTER TABLE POST00161 ADD SerialNo VARCHAR(50) NULL 
END
/*===============================================END SerialNo===============================================*/

--Lưu vết Bảng giá gói [Bán hàng theo bảng giá gói]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'PackagePriceID') 
   ALTER TABLE POST00161 ADD PackagePriceID VARCHAR(50) NULL 
END
/*===============================================END PackagePriceID===============================================*/ 

--Là Bảng giá gói [Bán hàng theo bảng giá gói]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'IsPackage') 
   ALTER TABLE POST00161 ADD IsPackage TINYINT NULL 
END
/*===============================================END IsPackage===============================================*/ 

--Lưu vết Gói sản phẩm [Bán hàng theo bảng giá gói]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'PackageID') 
   ALTER TABLE POST00161 ADD PackageID VARCHAR(50) NULL 
END
/*===============================================END PackageID===============================================*/ 

--Là mặt hàng kế thừa từ phiếu đặt cọc
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'IsBooking') 
   ALTER TABLE POST00161 ADD IsBooking TINYINT NULL 
END
/*===============================================END IsBooking===============================================*/ 
--Thị Phượng: Date 02/01/2018 Bổ sung check hàng trưng bày: 0: kho mới; 1: Kho trưng bày, 2: Kho hỏng => dùng để đối chiếu kho trong cửa hàng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'IsDisplay') 
   ALTER TABLE POST00161 ADD IsDisplay TINYINT Default (0) NULL 
END

--Thị Phượng: Date 02/01/2018 Bổ sung check hàng khuyến mãi lưu ngầm
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'IsFreeGift') 
   ALTER TABLE POST00161 ADD IsFreeGift TINYINT Default (0) NULL 
END
--Thị Phượng: Date 06/02/2018: Bổ sung trường số Bảo hàng  (Customize OKIA)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'WarrantyCard') 
   ALTER TABLE POST00161 ADD WarrantyCard NVARCHAR(250) NULL 
END
-- Thị Phượng Date 07/02/2018 fix lỗi thiếu cột 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'APPOrderID') 
   ALTER TABLE POST00161 ADD APPOrderID UNIQUEIDENTIFIER NULL 
END
-- -- Thị Phượng Date 07/02/2018 bổ sung checkbox Bán sỉ để thay đổi bản giá bán	(Cloud)	
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'IsWholesale') 
   ALTER TABLE POST00161 ADD IsWholesale TINYINT NULL default 0
END

-- Hoàng Vũ Date 08/03/2018 Là lưu vết [Khuyến mãi tăng hàng theo hóa đơn]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'IsInvoicePromotionID') 
   ALTER TABLE POST00161 ADD IsInvoicePromotionID TINYINT NULL 
END
/*===============================================END InvoicePromotionID===============================================*/ 

-- Hoàng Vũ Date 27/04/2018:Lưu vết [Khuyến mãi tăng hàng theo hóa đơn]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'InvoicePromotionID') 
   ALTER TABLE POST00161 ADD InvoicePromotionID VARCHAR(50) NULL 
END
/*===============================================END InvoicePromotionID===============================================*/ 

--Modified by Thị Phượng Date: 22/03/2018: Bổ sung trường STT để lưu theo đúng thứ tự
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'OrderNo') 
   ALTER TABLE POST00161 ADD OrderNo INT NULL 
END

/*===============================================END OrderNo===============================================*/ 

--Modified by Thị Phượng Date: 26/03/2018: Bổ sung trường phân biệt gói để group dữ liệu gói để lưu theo đúng thứ tự
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'OrderPackage') 
   ALTER TABLE POST00161 ADD OrderPackage INT NULL 
END

/*===============================================END OrderPackage===============================================*/ 

--Modified by Hoàng vũ Date: 18/04/2018: Bổ sung trường phân biệt Bảng giá trước thuế hay sau thuế (1: sau thuế; 0: trước thuế) 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'IsTaxIncluded') 
   ALTER TABLE POST00161 ADD IsTaxIncluded TINYINT NULL 
END

/*===============================================END IsTaxIncluded===============================================*/ 

--Modified by Hoàng vũ Date: 18/04/2018: Nếu bảng giá sau thì lấy chiết khấu tính lại để ra đơn giá trước chiết khấu
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'BeforeVATDiscountAmount') 
   ALTER TABLE POST00161 ADD BeforeVATDiscountAmount DECIMAL(28,8) NULL 
END

/*===============================================END BeforeVATDiscountAmount===============================================*/

--Modified by Hoàng vũ Date: 18/04/2018: Nếu bảng giá sau thì lấy đơn giá tính lại để ra đơn giá trước thuế
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'BeforeVATUnitPrice') 
   ALTER TABLE POST00161 ADD BeforeVATUnitPrice DECIMAL(28,8) NULL 
END

/*===============================================END BeforeVATUnitPrice===============================================*/ 

--là Bảng giá khuyến mãi [Bán hàng theo bảng giá khuyến mãi]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'IsPromotePriceTable') 
   ALTER TABLE POST00161 ADD IsPromotePriceTable TINYINT NULL 
END
/*===============================================END IsPromotePriceTable===============================================*/ 

--Lưu vết Bảng giá khuyến mãi [Bán hàng theo bảng giá khuyến mãi]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'PromotePriceTableID') 
   ALTER TABLE POST00161 ADD PromotePriceTableID VARCHAR(50) NULL 
END
/*===============================================END PromotePriceTableID===============================================*/ 

--Là Bảng giá chung [Bán hàng theo bảng giá chung]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'IsTable') 
   ALTER TABLE POST00161 ADD IsTable TINYINT NULL 
END
/*===============================================END IsTable===============================================*/ 

--Lưu vết Bảng giá chung [Bán hàng theo bảng giá chung]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'PriceTable') 
   ALTER TABLE POST00161 ADD PriceTable VARCHAR(50) NULL 
END
/*===============================================END PriceTable===============================================*/ 

--Là Bảng hàng khuyến mãi [Khuyến mãi hàng tặng hàng]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'IsPromotion') 
   ALTER TABLE POST00161 ADD IsPromotion TINYINT NULL 
END
/*===============================================END IsPromotion===============================================*/ 

--Lưu vết hàng khuyến mãi [Khuyến mãi hàng tặng hàng]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'PromoteID') 
   ALTER TABLE POST00161 ADD PromoteID VARCHAR(50) NULL 
END
/*===============================================END PromoteID===============================================*/ 

--Ghi chú lấy theo mặt hàng chọn được từ những bảng giá trên [Bán hàng theo bảng giá chung], [Bán hàng theo bảng giá gói], [Bán hàng theo bảng giá khuyến mãi]
--[Khuyến mãi tăng hàng theo hàng] và [Khuyến mãi tăng hàng theo hóa đơn]
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'Notes') 
   ALTER TABLE POST00161 ADD Notes NVARCHAR(250) NULL 
END
/*===============================================END Notes===============================================*/ 

--CustomizeIndex = 79 (MINGSANG): Bổ sung lưu vết mặt hàng chọn đề xuất để kiểm tra duyệt hay chưa
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'APPDetailSuggestID') 
   ALTER TABLE POST00161 ADD APPDetailSuggestID VARCHAR(50) NULL 
END
/*===============================================END APPDetailSuggestID===============================================*/ 

--Quản lý bán hàng theo gói sản phẩm (1 gói sản phẩm có thể khai báo 1 mặt hàng nhiều lần): lưu vết để truy xuất ngược gói để lấy giá, thuế.
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'APKPackageInventoryID') 
   ALTER TABLE POST00161 ADD APKPackageInventoryID UNIQUEIDENTIFIER NULL 
END
/*===============================================END APKPackageInventoryID===============================================*/ 

--Quan lý phân bổ đều chiết khấu trên tổng hóa đơn (MINHSANG)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'DiscountAllocation') 
   ALTER TABLE POST00161 ADD DiscountAllocation DECIMAL(28,8) NULL 
END
/*===============================================END DiscountAllocation===============================================*/ 

--Quan lý phân bổ chiết khấu trên tổng hóa đơn cho 1 đơn vị sản phẩm(MINHSANG)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'DiscountOneUnitOfProduct') 
   ALTER TABLE POST00161 ADD DiscountOneUnitOfProduct DECIMAL(28,8) NULL 
END
/*===============================================END DiscountOneUnitOfProduct===============================================*/ 

--Quan lý phân bổ đều tiền giảm giá trên tổng hóa đơn (MINHSANG)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'RedureAllocation') 
   ALTER TABLE POST00161 ADD RedureAllocation DECIMAL(28,8) NULL 
END
/*===============================================END RedureAllocation===============================================*/ 

--Quan lý phân bổ tiền giảm giá trên tổng hóa đơn cho 1 đơn vị sản phẩm(MINHSANG)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'RedureOneUnitOfProduct') 
   ALTER TABLE POST00161 ADD RedureOneUnitOfProduct DECIMAL(28,8) NULL 
END
/*===============================================END RedureOneUnitOfProduct===============================================*/ 

--Quan lý việc có sự dụng phiếu quà tặng cho hóa đơn này hay không (Làm trước cho Khách hàng NHÂN NGỌC)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'IsGiftVoucherUsed') 
   ALTER TABLE POST00161 ADD IsGiftVoucherUsed TINYINT NULL 
END
/*===============================================END IsGiftVoucherUsed===============================================*/ 

--Lưu vết [Giá tối thiểu] của bảng giá bán dưới ERP8 => VUONGSACH và NHANNGOC dùng trường này để ghi diểm/tính hoa dòng theo nhân viên bàn hàng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'MinPrice') 
   ALTER TABLE POST00161 ADD MinPrice DECIMAL(28,8) NULL 
END
/*===============================================END MinPrice===============================================*/ 

--Lưu vết [Ghi chú 1] của bảng giá bán dưới ERP8 => NHANNGOC dùng trường này để ghi diểm/tính hoa hồng theo Điểm nhân viên giao hàng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'Notes01') 
   ALTER TABLE POST00161 ADD Notes01 NVARCHAR(250) NULL 
END
/*===============================================END Notes01===============================================*/ 

--Lưu vết [Ghi chú 2] của bảng giá bán dưới ERP8 => NHANNGOC dùng trường này để ghi diểm/tính hoa hồng theo Điểm nhân viên kho
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'Notes02') 
   ALTER TABLE POST00161 ADD Notes02 NVARCHAR(250) NULL 
END
/*===============================================END Notes02===============================================*/ 

--Lưu vết [Ghi chú 3] của bảng giá bán dưới ERP8 => NHANNGOC dùng trường này để ghi diểm/tính hoa hồng theo Điểm nhân viên thu ngân
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'Notes03') 
   ALTER TABLE POST00161 ADD Notes03 NVARCHAR(250) NULL 
END
/*===============================================END Notes03===============================================*/ 

--Lưu vết [Ghi chú 4] của bảng giá bán dưới ERP8 => NHANNGOC dùng trường này để ghi diểm/tính hoa hồng theo Điểm nhân viên phụ kho
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'Notes04') 
   ALTER TABLE POST00161 ADD Notes04 NVARCHAR(250) NULL 
END
/*===============================================END Notes04===============================================*/ 

--Lưu vết đơn giá bán (Phục vụ trường hợp: nếu phiếu bán hàng co check vào giá trả góp thì sau khi lưu edit phiếu bỏ check giá trả góp thì hệ thống không load lại giá bán gốc ban đầu của mặt hàng)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'RefUnitPrice') 
   ALTER TABLE POST00161 ADD RefUnitPrice DECIMAL(28,8) NULL 
END
/*===============================================END RefUnitPrice===============================================*/ 

--Lưu vết đơn giá bán trả góp (Phục vụ trường hợp: nếu phiếu bán hàng co check vào giá trả góp thì sau khi lưu edit phiếu bỏ check giá trả góp thì hệ thống không load lại giá bán gốc ban đầu của mặt hàng)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00161' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00161' AND col.name = 'InstallmentPrice') 
   ALTER TABLE POST00161 ADD InstallmentPrice DECIMAL(28,8) NULL 
END
/*===============================================END InstallmentPrice===============================================*/ 