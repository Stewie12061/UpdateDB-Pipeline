
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF9030- T
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
SET @ModuleID = 'T';
SET @FormID = 'AF9030';

SET @LanguageValue = N'Danh mục chi phí vượt chỉ tiêu ngân sách';
EXEC ERP9AddLanguage @ModuleID, 'AF9030.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'AF9030.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích chi phí';
EXEC ERP9AddLanguage @ModuleID, 'AF9030.AnaID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mã phân tích chi phí';
EXEC ERP9AddLanguage @ModuleID, 'AF9030.AnaName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại ngân sách';
EXEC ERP9AddLanguage @ModuleID, 'AF9030.BudgetType', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian';
EXEC ERP9AddLanguage @ModuleID, 'AF9030.MonthYear', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng ngân sách';
EXEC ERP9AddLanguage @ModuleID, 'AF9030.BudgetAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng chi phí';
EXEC ERP9AddLanguage @ModuleID, 'AF9030.CostAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chênh lệch';
EXEC ERP9AddLanguage @ModuleID, 'AF9030.DifferenceAmount', @FormID, @LanguageValue, @Language;

