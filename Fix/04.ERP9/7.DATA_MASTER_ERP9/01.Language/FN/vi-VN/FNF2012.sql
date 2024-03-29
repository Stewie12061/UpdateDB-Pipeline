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
SET @FormID = 'FNF2012';

SET @LanguageValue = N'Xem kết quả thu chi thực tế';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.VoucherTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.VoucherDate1', @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Loại thu/chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.PaymentTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số kế hoạch';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.PlanVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ giá';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.ExchangeRate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mức độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.PriorityName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nội dung';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.JobName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền yêu cầu (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.PlanOAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền yêu cầu (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.PlanCAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền còn lại (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.RemainOAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền còn lại (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.RemainCAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thực tế (nguyên tệ)';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.ActualOAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thực tế (quy đổi)';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.ActualCAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mức độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.PriorityName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hoàn thành';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.IsFinish', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.TabThongTinChung', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.TabThongTinChiTiet', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.CreateUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.CreateDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.LastModifyUserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.LastModifyDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đợt chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.BtnFNF2008', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đợt chi thực tế';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.Tabthongtindotchi', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.PaymentDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.POAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.PCAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chi thực tế';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.APaymentDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền nguyên tệ thực tế';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.AOAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền quy đổi thực tế';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.ACAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đợt chi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.BtnFNF2008', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguồn vốn';
EXEC ERP9AddLanguage @ModuleID, 'FNF2012.Ana10Name', @FormID, @LanguageValue, @Language;

