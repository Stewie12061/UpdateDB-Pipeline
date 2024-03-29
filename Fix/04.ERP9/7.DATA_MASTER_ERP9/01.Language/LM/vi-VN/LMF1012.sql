
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF1012- OO
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
SET @FormID = 'LMF1012';

SET @LanguageValue = N'Xem chi tiết hợp đồng hạn mức';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.SubTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức chi tiết theo hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.SubTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian hiệu lực';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.FromDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.BankName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.BankAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.CurrencyName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ giá';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.ExchangeRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.OriginalLimitTotal', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.ConvertedLimitTotal', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.CreditFormID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.CreditFormName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.OriginalLimitAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.ConvertedLimitAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.TabCRMT00003', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.TabCRMT00002', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.TabCMNT90051', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.TabCRMT90031', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.CreditTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.CreateUserName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.LastModifyUserName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phụ lục hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.IsAppenConCaption', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng gốc';
EXEC ERP9AddLanguage @ModuleID, 'LMF1012.ContractNo', @FormID, @LanguageValue, @Language;