
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF3024- OO
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
SET @FormID = 'OOF3024';

SET @LanguageValue = N'新人報告';
EXEC ERP9AddLanguage @ModuleID, 'OOF3024.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF3024.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告名';
EXEC ERP9AddLanguage @ModuleID, 'OOF3024.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'タイトル';
EXEC ERP9AddLanguage @ModuleID, 'OOF3024.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'部';
EXEC ERP9AddLanguage @ModuleID, 'OOF3024.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'課';
EXEC ERP9AddLanguage @ModuleID, 'OOF3024.SectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'係り';
EXEC ERP9AddLanguage @ModuleID, 'OOF3024.SubsectionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'工程';
EXEC ERP9AddLanguage @ModuleID, 'OOF3024.ProcessID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'報告';
EXEC ERP9AddLanguage @ModuleID, 'OOF3024.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'フィルタ条件';
EXEC ERP9AddLanguage @ModuleID, 'OOF3024.GroupTitle2' , @FormID, @LanguageValue, @Language;




