
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SOF2028- SO
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000),

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
@Finished BIT


------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thu thi truy van
------------------------------------------------------------------------------------------------------
/*
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US		
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'vi-VN' 
SET @ModuleID = 'SO';
SET @FormID = 'SOF2028';

SET @LanguageValue = N'Kế thừa dự toán báo giá';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số dự toán';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.ObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.InventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.PaperTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.Quantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày dự toán';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.UnitName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã bán thành phẩm';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.SemiProductID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên bán thành phẩm';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.SemiProductName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.PaperTypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.PaperTypeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.DivisionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.DivisionName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ giao hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.DeliveryAddress' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'SOF2028.Notes' , @FormID, @LanguageValue, @Language;
