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
SET @FormID = 'POSF0030';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cập nhật hàng hóa tại cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0030.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0030.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0030.InventoryFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0030.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã vạch';
EXEC ERP9AddLanguage @ModuleID, 'POSF0030.Barcode' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0030.ShopIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0030.ShopNameFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0030.CurrentShop' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn hàng hóa cho cửa hàng ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0030.CurrentShopLabel' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chọn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0030.Selected' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;