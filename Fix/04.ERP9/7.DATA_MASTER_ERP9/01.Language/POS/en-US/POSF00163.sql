------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF00163 - POS - Phiếu nhập hàng
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
SET @FormID = 'POSF00163';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Choose inventory promote';
EXEC ERP9AddLanguage @ModuleID, 'POSF00163.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Promote inventory ID';
EXEC ERP9AddLanguage @ModuleID, 'POSF00163.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Promote inventory name';
EXEC ERP9AddLanguage @ModuleID, 'POSF00163.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Promote price';
EXEC ERP9AddLanguage @ModuleID, 'POSF00163.CA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Promote CA';
EXEC ERP9AddLanguage @ModuleID, 'POSF00163.UnitPrice' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;