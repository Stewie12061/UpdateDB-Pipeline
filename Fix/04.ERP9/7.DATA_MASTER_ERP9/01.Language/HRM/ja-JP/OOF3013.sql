
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF3013- OO
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
SET @Language = 'ja-JP' 
SET @ModuleID = 'HRM';
SET @FormID = 'OOF3013';

SET @LanguageValue = N'製造者業者と間接者報告';
EXEC ERP9AddLanguage @ModuleID, 'OOF3013.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF3013.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告名';
EXEC ERP9AddLanguage @ModuleID, 'OOF3013.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'タイトル';
EXEC ERP9AddLanguage @ModuleID, 'OOF3013.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部';
EXEC ERP9AddLanguage @ModuleID, 'OOF3013.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課';
EXEC ERP9AddLanguage @ModuleID, 'OOF3013.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り';
EXEC ERP9AddLanguage @ModuleID, 'OOF3013.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程';
EXEC ERP9AddLanguage @ModuleID, 'OOF3013.ProcessID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告';
EXEC ERP9AddLanguage @ModuleID, 'OOF3013.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'フィルタ条件';
EXEC ERP9AddLanguage @ModuleID, 'OOF3013.GroupTitle2' , @FormID, @LanguageValue, @Language;



