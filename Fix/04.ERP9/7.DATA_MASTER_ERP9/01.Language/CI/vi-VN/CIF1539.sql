------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1539
-----------------------------------------------------------------------------------------------------
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
SET @ModuleID = 'CI';
SET @FormID = 'CIF1539';
------------------------------------------------------------------------------------------------------
--- Title
SET @LanguageValue = N'Dùng ví chiết khấu tích lũy';
EXEC ERP9AddLanguage @ModuleID, 'CIF1539.Title' , @FormID, @LanguageValue, @Language;
-----------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Mã quà tặng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1539.InventoryGiftID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên quà tặng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1539.InventoryGiftName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng quà tặng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1539.GiftQuantity' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;