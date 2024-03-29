
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

SET @LanguageValue = N'Biểu đồ tình hình doanh thu';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.BF0001Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.Title' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Biểu đồ';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.Chart' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.FromAccount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.ToAccount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.Group01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'BF0001.Group02Title' , @FormID, @LanguageValue, @Language;