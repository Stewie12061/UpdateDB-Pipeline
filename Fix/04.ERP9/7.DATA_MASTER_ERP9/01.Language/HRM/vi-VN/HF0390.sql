
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0390- OO
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
SET @ModuleID = 'HRM';
SET @FormID = 'HF0390';

SET @LanguageValue = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.HF0390Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.HF0390Tab01Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.DivisionName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ mặc định';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.Period', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'PP tính lương';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.PayrollMethodID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số TK ngân hàng';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.BankAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK phải trả cho nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.PayableAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK chi phí nhân công trực tiếp';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.ExpenseAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK thuế TNCN';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.PerInTaxID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK tạm ứng kết chuyển';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.AdvanceAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mức lương tối thiểu chung';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.MinSalary', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mức lương tối thiểu vùng';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.MinAreaSalary', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'BHXH,BHYT';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.MaxSalary1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'BHTN';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.MaxSalary2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số điểm ngày công tối đa';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.WorkMarks', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số điểm nội quy tối đa';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.RegulationsMarks', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đưa dữ liệu thông tin nhân viên qua thông tin dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.IsTranferEmployee', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết chuyển bút toán lương';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.IsTranEntrySalary', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chấm công';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.HF0390Tab02Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'PP chấm công sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.ProductAbsentMethod', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại công nghỉ phép';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.GAbsentLoanID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày làm việc trong tháng';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.DayPerMonth', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số giờ làm việc trong ngày';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.TimeConvert', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày làm việc trong tháng khác';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.OtherDayPerMonth', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Độ dài số thẻ chấm công';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.LenAbsentCardNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chấm công theo đơn vị quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.ConvertedProductAbsent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin hệ số';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.HF0390Tab03Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lẻ hệ số';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.CoefficientDecimals', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lẻ chấm công';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.AbsentDecimals', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lẻ nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.OriginalDecimals', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lẻ quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.ConvertedDecimals', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lẻ tỷ giá';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.RateExchange', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lẻ số lượng';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.QuantityDecimals', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lẻ đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.PriceDecimals', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lẻ ngày nghỉ phép';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.HolidayDecimals', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khác';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.OtherDecimals', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lưu số ngày phép của nhân viên thôi việc vào hệ số lương';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.VacationFactor', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quy định đi trễ về sớm';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.HF0390Tab04Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số giờ tối đa ĐTVS/tháng ';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.HMaxPerMonth', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số giờ tối đa ĐTVS/lần';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.HMaxPerTime', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lần tối đa ĐTVS/tháng';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.TMaxPerMonth', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công nghỉ không hưởng lương';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.NoSalaryAbsentID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công nghỉ trừ lương';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.MinusSalaryAbsentID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian tối đa cho phép tạo đơn';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.DayExp', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'(Ngày)';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.DayExpType', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cảnh báo chênh lệch điểm đánh giá KPI';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.IsKPIWarning', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cảnh báo chênh lệch điểm đánh giá năng lực';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.IsAppraisalWarning', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mẫu Email duyệt';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.EmailApprove', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mẫu Email đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.EmailSuggest', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lẻ hệ số chỉ tiêu';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.TargetRateDecimals', @FormID, @LanguageValue, @Language;