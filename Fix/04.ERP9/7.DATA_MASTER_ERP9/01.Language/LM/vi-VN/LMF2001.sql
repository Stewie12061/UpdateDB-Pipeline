
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF2001- OO
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
SET @FormID = 'LMF2001';

SET @LanguageValue = N'Cập nhật hợp đồng vay';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí';
EXEC ERP9AddLanguage @ModuleID, 'TabLMT2002', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài sản thế chấp';
EXEC ERP9AddLanguage @ModuleID, 'TabLMT2003', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng hạn mức';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.LimitVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.CreditFormID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.BankName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.BankAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian hiệu lực';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.FromDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.ToDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.ExchangeRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.OriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dự án';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.ProjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng mua hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.PurchaseContractID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.Status', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dự án';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.ProjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.VoucherTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.VoucherTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.VoucherTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã dự án';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.ProjectID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên dự án';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.ProjectName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.CurrencyID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.CurrencyName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.BankAccountID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.BankAccountName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.BankAccountNo.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hình thức tính dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.CreditFormID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.CreditFormName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng mua hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.PurchaseContractID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.PurchaseContractName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.CostDescription', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguồn';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.SourceName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tài sản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.AssetName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.CostTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.CostTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.CostTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nguồn';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.OrderNo.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.Description.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tài sản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.AssetID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tài sản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.AssetID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tài sản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.AssetName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.Attach', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.Info', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.Cost', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài sản thế chấp';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.Asset', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin bổ sung';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.Parameter', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị thế chấp';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.ConvertedAmount_AssetID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị sổ sách';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.AccountingValue', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% Hạn mức';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.LoanLimitRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị hạn mức';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.LoanLimitAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị còn lại';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.RemainAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sử dụng cho HĐ bảo lãnh/LC';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.ContractOfGuaranteeNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.AnaID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mã phân tích';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.AnaName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa kế hoạch thu chi';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.IsInheritPlanPayment', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.ObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.ObjectID.Auto', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.ObjectName.Auto', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.BankID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.BankID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.BankName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.AnaID.Auto', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.AnaName.Auto', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã liên kết';
EXEC ERP9AddLanguage @ModuleID, 'LMF2001.TransactionID', @FormID, @LanguageValue, @Language;