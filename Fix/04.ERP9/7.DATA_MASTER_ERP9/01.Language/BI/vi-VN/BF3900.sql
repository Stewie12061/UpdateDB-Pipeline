
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ BF3900- OO
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
SET @FormID = 'BF3900';

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.FieldID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ Tiêu thức 1';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.cboSelection01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến Tiêu thức 1';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.cboToSelection01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ Tiêu thức 2';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.cboSelection02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến Tiêu thức 2';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.cboToSelection02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ Tiêu thức 3';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.cboSelection03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến Tiêu thức 3';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.cboToSelection03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ Tiêu thức 4';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.cboSelection04' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến Tiêu thức 4';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.cboToSelection04' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ Tiêu thức 5';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.cboSelection05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến Tiêu thức 5';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.cboToSelection05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AnaID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AnaName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.ReportInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu thức lọc';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.ReportFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin thời gian';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.TimeFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ: {0}';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.Period' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quý: {0}';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.Quarter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Năm: {0}';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.Year' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ Kỳ: {0} - Đến Kỳ : {1}';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.FromToPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ Quý: {0} - Đến Quý : {1}';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.FromToQuater' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ Năm: {0} - Đến Năm : {1}';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.FromToYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'BF3900.cboGroupLevel01' , @FormID, @LanguageValue, @Language;