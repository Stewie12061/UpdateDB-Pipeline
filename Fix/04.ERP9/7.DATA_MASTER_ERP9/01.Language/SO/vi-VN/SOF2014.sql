
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SOF2014- OO
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
SET @FormID = 'SOF2014';

SET @LanguageValue = N'Thông tin mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2014.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2014.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2014.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'SOF2014.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2014.InventoryTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá bán 1';
EXEC ERP9AddLanguage @ModuleID, 'SOF2014.SalePrice01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá nhập';
EXEC ERP9AddLanguage @ModuleID, 'SOF2014.RecievedPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá xuất';
EXEC ERP9AddLanguage @ModuleID, 'SOF2014.DeliveryPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Is tocked';
EXEC ERP9AddLanguage @ModuleID, 'SOF2014.IsStocked' , @FormID, @LanguageValue, @Language;