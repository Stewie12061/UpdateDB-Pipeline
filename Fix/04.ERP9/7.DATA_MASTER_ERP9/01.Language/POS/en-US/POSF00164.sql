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

SET @Language = 'en-US' 
SET @ModuleID = 'POS';
SET @FormID = 'POSF00164';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Promotion proposal';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory ID';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Inventory name';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Promotion CA';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.CA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Promotion unit price';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Promotion inventory ID';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.PromoteInventoryID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Promotion inventory name';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.PromoteInventoryName' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Proposal inventory ID';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.SuggestInventoryID' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Proposal inventory name';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.SuggestInventoryName' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Proposal unit price';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.SuggestUnitPrice' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Proposal CA';
EXEC ERP9AddLanguage @ModuleID, 'POSF00164.SuggestCA' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;