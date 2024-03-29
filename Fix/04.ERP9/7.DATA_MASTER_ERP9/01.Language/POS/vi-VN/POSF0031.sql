------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0001 - POS
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
SET @ModuleID = 'POS';
SET @FormID = 'POSF0031';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Tách/Gộp Bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0031.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực';
EXEC ERP9AddLanguage @ModuleID, 'POSF0031.CurrentZone' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bàn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0031.CurrentTable' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0031.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0031.InventoryName' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Detail
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Mã hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0031.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0031.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ĐVT';
EXEC ERP9AddLanguage @ModuleID, 'POSF0031.UnitName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'SL';
EXEC ERP9AddLanguage @ModuleID, 'POSF0031.ActualQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF0031.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'%CK';
EXEC ERP9AddLanguage @ModuleID, 'POSF0031.DiscountRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền CK';
EXEC ERP9AddLanguage @ModuleID, 'POSF0031.DiscountAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'%VAT';
EXEC ERP9AddLanguage @ModuleID, 'POSF0031.VATPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền VAT';
EXEC ERP9AddLanguage @ModuleID, 'POSF0031.TaxAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSF0031.InventoryAmount' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;