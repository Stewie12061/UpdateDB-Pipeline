
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
SET @Language = 'en-US' 
SET @ModuleID = 'HRM';
SET @FormID = 'HF0390';

SET @LanguageValue = N'System settings';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.HF0390Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Common information';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.HF0390Tab01Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Division name';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.DivisionName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Period';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.Period', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Payroll method';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.PayrollMethodID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bank acount ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.BankAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Payable account ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.PayableAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Expense account ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.ExpenseAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tax ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.PerInTaxID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Advance account ID';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.AdvanceAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Min salary';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.MinSalary', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Work marks';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.WorkMarks', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Regulations marks';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.RegulationsMarks', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Transfer employee information to common information';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.IsTranferEmployee', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Forward accounting entry salary';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.IsTranEntrySalary', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Timekeeping information';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.HF0390Tab02Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Product timekeeping method';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.ProductAbsentMethod', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vacation type';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.GAbsentLoanID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Working days in month';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.DayPerMonth', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Working hours in day';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.TimeConvert', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Working days in orther months';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.OtherDayPerMonth', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Length of attendance card number';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.LenAbsentCardNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Timekeeping in converted unit';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.ConvertedProductAbsent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ratio information';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.HF0390Tab03Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ratio odd';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.CoefficientDecimals', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Timekeeping odd';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.AbsentDecimals', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Original currency odd';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.OriginalDecimals', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Exchange odd';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.ConvertedDecimals', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Exchange rate odd';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.RateExchange', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quantity Odd';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.QuantityDecimals', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Price odd';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.PriceDecimals', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vacation odd';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.HolidayDecimals', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Other';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.OtherDecimals', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Approval email template';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.EmailApprove', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Suggest email template';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.EmailSuggest', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Save vacation days of quitting employee to salary coefficient';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.VacationFactor', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Warning KPI evaluation point difference';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.IsKPIWarning', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Warning of differences in capacity evaluation points';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.IsAppraisalWarning', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Target rate odd';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.TargetRateDecimals', @FormID, @LanguageValue, @Language;

-- [Đình Hòa] [26/02/2021] - Bổ sung ngôn ngữ
SET @LanguageValue = N'Regulations for early leave late';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.HF0390Tab04Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hours maximum ĐTVS/Month ';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.HMaxPerMonth', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hours maximum ĐTVS/lần';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.HMaxPerTime', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Maximum number of times ĐTVS/Month';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.TMaxPerMonth', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'No Salary Absent';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.NoSalaryAbsentID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Minus Salary Absent';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.MinusSalaryAbsentID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Maximum time allow create form';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.DayExp', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'(Day)';
EXEC ERP9AddLanguage @ModuleID, 'HF0390.DayExpType', @FormID, @LanguageValue, @Language;