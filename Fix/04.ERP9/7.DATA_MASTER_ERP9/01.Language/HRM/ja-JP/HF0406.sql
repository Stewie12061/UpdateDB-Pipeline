
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF3001- OO
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
SET @FormID = 'HF0406';

SET @LanguageValue = N'Báo cáo tổng hợp phép năm';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.HF0406Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Năm';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.Year' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng Ban';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân Viên';
EXEC ERP9AddLanguage @ModuleID, 'HF0406.EmployeeID' , @FormID, @LanguageValue, @Language;