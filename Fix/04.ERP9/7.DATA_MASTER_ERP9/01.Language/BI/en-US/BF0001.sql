
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ BF0001- OO
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
SET @ModuleID = 'BI';
SET @FormID = 'BF0001';

SET @LanguageValue = N'Cash and Bank balances';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.BF0001Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report ID';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Name';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Title';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.Title' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Chart';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.Chart' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Account';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.FromAccount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Account';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.ToAccount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.Group01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Filter criteria';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.Group02Title' , @FormID, @LanguageValue, @Language;