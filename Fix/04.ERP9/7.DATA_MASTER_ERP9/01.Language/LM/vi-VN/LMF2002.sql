
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF2002- OO
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
SET @FormID = 'LMF2002';

SET @LanguageValue = N'Xem chi tiết hợp đồng vay';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.SubTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.SubTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài sản thế chấp';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.SubTitle3', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phong tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.SubTitle4', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giải tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.SubTitle5', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giải ngân';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.SubTitle6', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.SubTitle7', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều chỉnh';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.SubTitle8', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.TabCRMT00003', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.TabCRMT00002', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.TabCMNT90051', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.TabCRMT90031', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng hạn mức';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.LimitVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.CreditFormName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian hiệu lực';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.FromDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.BankName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.BankAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.CurrencyName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ giá';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.ExchangeRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.StatusName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dự án';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.ProjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng mua hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.PurchaseContractName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.OriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.CostTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày phong tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.AdvanceDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ký quỹ (%)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.AdvancePercent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại doanh thu';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.SalesTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin bổ sung';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.SubTitle4_1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.Info', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị tài sản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.ConvertedAmount_Asset', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài sản đảm bảo';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.AssetName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguồn';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.SourceName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.CostDescription', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2002.ObjectName', @FormID, @LanguageValue, @Language;