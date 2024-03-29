
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF2022- OO
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
SET @FormID = 'LMF2022';

SET @LanguageValue = N'Xem chi tiết chứng từ giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.SubTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cách tính nợ gốc và lãi phải trả';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.SubTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng vay';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.CreditVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian vay';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.FromToDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian vay';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.FromDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.BankName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.BankAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền giải ngân (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.OriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền giải ngân (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.OriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức trả gốc';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.OriginalMethodName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức trả lãi';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.RateMethodName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản ghi nhận';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.OriginalAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản ghi nhận';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.RateAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.OriginalCostTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.RateCostTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí trả trước (%)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.BeforeRatePercent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lãi phạt quá hạn (%)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.AfterRatePercent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lãi suất (%)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.RatePercent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.TabCRMT00003', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.TabCRMT00002', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.TabCMNT90051', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.TabCRMT90031', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lãi chậm trả (%)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.LateRatePercent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch trả nợ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2022.SubTitle3', @FormID, @LanguageValue, @Language;
