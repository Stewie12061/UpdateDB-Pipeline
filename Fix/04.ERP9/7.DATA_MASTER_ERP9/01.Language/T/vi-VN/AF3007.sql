
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF3007- OO
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
SET @FormID = 'AF3007';

SET @LanguageValue = N'Công nợ theo tuổi nợ';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.FilterReport', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.ReportCode', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.FromAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.ToAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.FromObjectIDName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.ToObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.FilterReportDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lọc dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.FilterGroupReport', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ tiêu thức 1';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.Filter1IDFromName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến tiêu thức 1';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.Filter1IDToName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ tiêu thức 2';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.Filter2IDFromName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến tiêu thức 2';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.Filter2IDToName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ tiêu thức 3';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.Filter3IDFromName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến tiêu thức 3';
EXEC ERP9AddLanguage @ModuleID, 'AF3007.Filter3IDToName', @FormID, @LanguageValue, @Language;

