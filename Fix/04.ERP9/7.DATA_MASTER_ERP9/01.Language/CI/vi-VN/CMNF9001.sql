DECLARE 
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(200),
--------------------------------------------------------
@LanguageValue NVARCHAR(4000)
--------------------------------------------------------

SET @Language = 'vi-VN';
SET @ModuleID = 'CI';
SET @FormID = 'CMNF9001'
---------------------------------------------------------------

SET @LanguageValue  = N'Chọn mặt hàng'
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.Title',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Mã mặt hàng'
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.InventoryID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tên mặt hàng'
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.InventoryName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Đơn vị tính'
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.UnitName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại MH';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.InventoryTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá bán';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.SalePrice01', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá nhận hàng';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.RecievedPrice', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá giao hàng';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.DeliveryPrice', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đã nhập kho';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9001.IsStocked', @FormID, @LanguageValue, @Language;

