
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF3021- OO
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
SET @FormID = 'OOF3021';

SET @LanguageValue = N'非活動報告';
EXEC ERP9AddLanguage @ModuleID, 'OOF3021.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF3021.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告名';
EXEC ERP9AddLanguage @ModuleID, 'OOF3021.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'タイトル';
EXEC ERP9AddLanguage @ModuleID, 'OOF3021.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部';
EXEC ERP9AddLanguage @ModuleID, 'OOF3021.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課';
EXEC ERP9AddLanguage @ModuleID, 'OOF3021.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り';
EXEC ERP9AddLanguage @ModuleID, 'OOF3021.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程';
EXEC ERP9AddLanguage @ModuleID, 'OOF3021.ProcessID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告';
EXEC ERP9AddLanguage @ModuleID, 'OOF3021.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'フィルタ条件';
EXEC ERP9AddLanguage @ModuleID, 'OOF3021.GroupTitle2' , @FormID, @LanguageValue, @Language;




