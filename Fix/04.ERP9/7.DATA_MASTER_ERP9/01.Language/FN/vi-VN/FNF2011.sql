-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0393- OO
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
SET @ModuleID = 'FN';
SET @FormID = 'FNF2011';

SET @LanguageValue = N'Cập nhật kết quả thu chi thực tế';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.VoucherTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.VoucherDate1', @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Loại thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.PaymentTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số kế hoạch';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.APKPlanNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày dự kiến thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.PlanVoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ giá';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.ExchangeRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.JobName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền yêu cầu (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.PlanOAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền yêu cầu (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.PlanCAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền còn lại (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.RemainOAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền còn lại (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.RemainCAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thực tế (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.ActualOAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thực tế (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.ActualCAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hoàn thành';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.IsFinish', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mức độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.PriorityName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.CurrencyID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.CurrencyName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.ID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.Description.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.VoucherTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.VoucherTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đợt chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.BtnFNF2008', @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.AnaID.Auto', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số kế hoạch';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.PlanVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.Attach', @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2011.AnaName.Auto', @FormID, @LanguageValue, @Language;

