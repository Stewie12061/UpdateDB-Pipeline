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
SET @FormID = 'POSF0032';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Tách/Gộp Bill';
EXEC ERP9AddLanguage @ModuleID, 'POSF0032.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu bán hàng cần tách Bill';
EXEC ERP9AddLanguage @ModuleID, 'POSF0032.Title1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách hàng hóa cần in';
EXEC ERP9AddLanguage @ModuleID, 'POSF0032.Title2' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------


SET @LanguageValue = N'Mã hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0032.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0032.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ĐVT';
EXEC ERP9AddLanguage @ModuleID, 'POSF0032.UnitName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'SL';
EXEC ERP9AddLanguage @ModuleID, 'POSF0032.ActualQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF0032.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'%CK';
EXEC ERP9AddLanguage @ModuleID, 'POSF0032.DiscountRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền CK';
EXEC ERP9AddLanguage @ModuleID, 'POSF0032.DiscountAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'%VAT';
EXEC ERP9AddLanguage @ModuleID, 'POSF0032.VATPercent' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền VAT';
EXEC ERP9AddLanguage @ModuleID, 'POSF0032.TaxAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSF0032.InventoryAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng số tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSF0032.CountTotalAmount' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;