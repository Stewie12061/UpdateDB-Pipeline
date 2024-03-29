
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF2011- OO
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
SET @FormID = 'LMF2011';

SET @LanguageValue = N'Cập nhật Phong tỏa/ Giải tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng bảo lãnh';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.CreditVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.BankAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị hợp đồng(nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.CreditOriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại(phong tỏa/giải tỏa)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.AdvanceTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày ký quỹ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.AdvanceDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày giải tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.AdvanceDate_1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền(nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.OriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.CreditFormName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.FromDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian đến';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.ToDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị hợp đồng(quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.CreditConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.CostTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ký quỹ(%)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.AdvancePercent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị ký quỹ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị giải tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.ConvertedAmount_1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.Attach', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa chứng từ kế toán';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.Inherit', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.OrderNo.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.Description.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.CostTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.CostTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.SaleTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.SaleTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phong tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.rdBlockade', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giải tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.rdRelieve', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bảo lãnh';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.FromDateGuarantee', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị bảo lãnh';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.GuaranteeValue', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng tiền gửi';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.Info', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin bổ sung';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.Parameter', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.DepositContractNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.BankName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.BankID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.BankName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị ký quỹ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.EscrowAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị giải tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.ClearanceAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lãi suất(%/năm)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.InterestRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền lãi';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.EndInterestAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền lãi';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.InterestAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng thụ hưởng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.AssignObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng thụ hưởng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.AssignObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại(phong tỏa/giải tỏa)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.AdvanceTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bảo lãnh đến';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.ToDateGuarantee', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.CostTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị ký quỹ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.BlockCAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.ObjectID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.ObjectName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị đã phong tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.BlockadedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị đã giải tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.RelieveAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị phong tỏa còn lại';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.BlockadedAmountExtant', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản ký quỹ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.BankAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị đã phong tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.EscrowAmounted', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị đã giải tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.ClearanceAmounted', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị phong tỏa còn lại';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.EndEscrowAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dự án';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.ProjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.ProjectID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.ProjectName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.CreateDate1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dự án';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.ProjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản ký quỹ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2011.BankAccountName', @FormID, @LanguageValue, @Language;