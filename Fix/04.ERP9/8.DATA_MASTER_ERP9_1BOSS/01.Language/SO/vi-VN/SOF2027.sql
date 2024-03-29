
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SOF2027- OO
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
SET @FormID = 'SOF2027';

SET @LanguageValue = N'Cập nhật thông tin phụ kiện';
EXEC ERP9AddLanguage @ModuleID, 'SOF2027.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phụ kiện';
EXEC ERP9AddLanguage @ModuleID, 'SOF2027.AccessoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phụ kiện';
EXEC ERP9AddLanguage @ModuleID, 'SOF2027.AccessoyName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2027.Quantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2027.InventoryName' , @FormID, @LanguageValue, @Language;
