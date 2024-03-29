
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ BF3001- OO
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
SET @ModuleID = 'BI';
SET @FormID = 'BF3001';

SET @LanguageValue = N'Financial health chart';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report ID';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Name';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Title';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'From Account';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.FromAccount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'To Account';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.ToAccount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Filtering criteria';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'VND';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.Amount' , @FormID, @LanguageValue, @Language;