
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF2000- OO
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
SET @ModuleID = 'LM';
SET @FormID = 'LMF2000';

SET @LanguageValue = N'Danh sách hợp đồng vay';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.BankID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng hạn mức';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.LimitVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.CreditFormID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dự án';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.ProjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.Status', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.CreditFormName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.BankName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.FromDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.ToDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dự án';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.ProjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã dự án';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.ProjectID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên dự án';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.ProjectName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.CurrencyID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.CurrencyName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.BankID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.BankName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hình thức tính dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.CreditFormID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2000.CreditFormName.CB', @FormID, @LanguageValue, @Language;
