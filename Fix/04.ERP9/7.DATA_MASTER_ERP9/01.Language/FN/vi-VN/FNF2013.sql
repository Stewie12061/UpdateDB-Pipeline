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
SET @FormID = 'FNF2013';

SET @LanguageValue = N'Chọn kế hoạch thu chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày dự kiến thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.FromPlanDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'...';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.ToPlanDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mức độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.PriorityID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.VoucherNo', @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Mã phân tích 1';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana01ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 2';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana02ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 3';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana03ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 4';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana04ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 5';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana05ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 6';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana06ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 7';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana07ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 8';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana08ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 9';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana09ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 10';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana10ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.PriorityID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.PriorityName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày lập kế hoạch';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mức độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.PriorityName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày dự kiến thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.PlanVoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ giá';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.ExchangeRate', @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Người lập';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.EmployeeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.JobName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền yêu cầu (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.PlanOAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền yêu cầu (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.PlanCAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền còn lại (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.RemainOAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền còn lại (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.RemainCAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng đề xuất';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.ObjectProposalName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng thụ hưởng';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.ObjectBeneficiaryName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 1';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana01Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 2';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana02Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 3';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana03Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 4';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana04Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 5';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana05Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 6';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana06Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 7';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana07Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 8';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana08Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 9';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana09Name', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích 10';
EXEC ERP9AddLanguage @ModuleID, 'FNF2013.Ana10Name', @FormID, @LanguageValue, @Language;

