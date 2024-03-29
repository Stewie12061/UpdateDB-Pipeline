------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF00164 - POS - Phiếu nhập hàng
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
SET @FormID = 'POSF00164';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Đề xuất hàng khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'CA';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.CA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hàng khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.PromoteInventoryID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Tên hàng khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.PromoteInventoryName' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã hàng đề xuất';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.SuggestInventoryID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Tên hàng đề xuất';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.SuggestInventoryName' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Đơn giá đề xuất';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.SuggestUnitPrice' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'CA đề xuất';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.SuggestCA' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;