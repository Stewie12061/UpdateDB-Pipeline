
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
SET @Language = 'vi-VN' 
SET @ModuleID = 'BI';
SET @FormID = 'BF3001';

SET @LanguageValue = N'Biểu đồ tình hình tài chính';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.ReportTitle' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Từ tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.FromAccount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.ToAccount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'VND';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.Amount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đường dẫn mẫu';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.GetPathTemplate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'BF3001.DivisionID' , @FormID, @LanguageValue, @Language;
