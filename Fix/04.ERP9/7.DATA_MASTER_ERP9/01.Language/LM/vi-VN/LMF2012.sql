
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF2012- OO
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
SET @FormID = 'LMF2012';

SET @LanguageValue = N'Xem chi tiết phong tỏa/giải tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.SubTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng bảo lãnh';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.CreditVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'HÌnh thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.CreditFormName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.BankAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày ký quỹ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.AdvanceDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày giải tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.AdvanceDate_1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.AdvanceTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.CostTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền(nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.OriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị ký quỹ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị giải tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.ConvertedAmount_1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'người sửa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.TabCRMT00003', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.TabCRMT00002', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.TabCMNT90051', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.TabCRMT90031', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bảo lãnh';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.FromDateGuarantee', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị bảo lãnh';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.GuaranteeValue', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng tiền gửi';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.Info', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin bổ sung';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.Parameter', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.DepositContractNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.BankName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.BankID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.BankName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị ký quỹ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.EscrowAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị giải tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.ClearanceAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lãi suất';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.InterestRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền lãi';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.EndInterestAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin bổ sung';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.SubParameter', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng tiền gửi';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.SubTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.FromDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian đến';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.ToDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ký quỹ(%)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.AdvancePercent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng thụ hưởng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.AssignObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị đã phong tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.EscrowAmounted', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị đã phong tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.ClearanceAmounted', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị phong tỏa còn lại';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.EndEscrowAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.CreateDate', @FormID, @LanguageValue, @Language;

--[Đình Hoà] [30/06/2020] Thêm ngôn ngữ
SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF2012.CreateDate1', @FormID, @LanguageValue, @Language;