
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ TF3001- OO
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
SET @FormID = 'TF3001';

SET @LanguageValue = N'Báo cáo kế hoạch ngân sách trường';
EXEC ERP9AddLanguage @ModuleID, 'TF3001.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'TF3001.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày lập ngân sách';
EXEC ERP9AddLanguage @ModuleID, 'TF3001.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại ngân sách';
EXEC ERP9AddLanguage @ModuleID, 'TF3001.BudgetTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ ngân sách';
EXEC ERP9AddLanguage @ModuleID, 'TF3001.FromMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bộ phận/Trường';
EXEC ERP9AddLanguage @ModuleID, 'TF3001.DepartmentID' , @FormID, @LanguageValue, @Language;

