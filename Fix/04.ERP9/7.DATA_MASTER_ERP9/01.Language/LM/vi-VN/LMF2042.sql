
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF2042- OO
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
SET @FormID = 'LMF2042';

SET @LanguageValue = N'Xem chi tiết phiếu điều chỉnh';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin phiếu điều chỉnh';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.SubTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch trả nợ được điều chỉnh';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.SubTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.VoucherTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều chỉnh từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.DisFromToDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại điều chỉnh';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.AdjustTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.CreditVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chứng từ giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.DisburseVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.BankAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.PaymentDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.PaymentName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán(nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.PaymentOriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán(quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.PaymentConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.PaymentAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.CostTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.TabCRMT00003', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.TabCRMT00002', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.TabCMNT90051', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'LMF2042.TabCRMT90031', @FormID, @LanguageValue, @Language;

