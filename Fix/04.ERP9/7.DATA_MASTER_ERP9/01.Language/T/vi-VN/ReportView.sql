	
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ ReportView- OO
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
SET @FormID = 'ReportView';

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ObjectID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ObjectName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã dự án';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AnaID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên dự án';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AnaName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.Code.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.Description.CB' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ReportCode.CB', @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ReportName1.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AccountID.CB', @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AccountName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.CurrencyID.CB', @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.CurrencyName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ kế toán';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.MonthYear.CB', @FormID, @LanguageValue, @Language;