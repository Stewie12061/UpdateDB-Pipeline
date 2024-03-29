
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF2010- OO
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
SET @FormID = 'LMF2010';

SET @LanguageValue = N'Phong tỏa/ Giải tỏa';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.BankID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hình thức';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.AdvanceTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng bảo lãnh/LC';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.CreditVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày ký quỹ(giải tỏa)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.AdvanceDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hình thức';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.AdvanceTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.CreditFormName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.BankName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.BankAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.OriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.BankID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.BankName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.OrderNo.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.Description.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng thụ hưởng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.AssignObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.ObjectID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.ObjectName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.CostTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.CostTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.CostTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bảo lãnh từ';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.FromDateGuarantee', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian bảo lãnh đến';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.ToDateGuarantee', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ký quỹ(%)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.AdvancePercent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị bảo lãnh';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.GuaranteeValue', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị ký quỹ(giải tỏa)';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng thụ hưởng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.AssignObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chi phí';
EXEC ERP9AddLanguage @ModuleID, 'LMF2010.CostTypeName', @FormID, @LanguageValue, @Language;
