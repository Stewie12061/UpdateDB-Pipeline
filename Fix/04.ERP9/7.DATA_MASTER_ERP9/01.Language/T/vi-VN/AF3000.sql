
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF3000- OO
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
SET @ModuleID = 'T';
SET @FormID = 'AF3000';

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF3000.AF3000Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF3000.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo thống kê';
EXEC ERP9AddLanguage @ModuleID, 'AsoftT.Statistics' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo tình chính';
EXEC ERP9AddLanguage @ModuleID, 'AsoftT.G05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập';
EXEC ERP9AddLanguage @ModuleID, 'AR3000.Creator', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế toán trưởng';
EXEC ERP9AddLanguage @ModuleID, 'AR3000.ChiefAccountant', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giám đốc';
EXEC ERP9AddLanguage @ModuleID, 'AR3000.Director', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'(Ký, ghi rõ họ tên)';
EXEC ERP9AddLanguage @ModuleID, 'AR3000.SignatureName', @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Báo cáo cân đối số phát sinh';
EXEC ERP9AddLanguage @ModuleID, 'AR3000.BalanceSheet', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'AR3000.UnitColumn', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số hiệu TK';
EXEC ERP9AddLanguage @ModuleID, 'AR3000.AccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tài khoản kế toán';
EXEC ERP9AddLanguage @ModuleID, 'AR3000.AccountName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số dư đầu kỳ';
EXEC ERP9AddLanguage @ModuleID, 'AR3000.BeginBalance', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số phát sinh trong kỳ';
EXEC ERP9AddLanguage @ModuleID, 'AR3000.ArisingInPeriod', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số dư cuối kỳ';
EXEC ERP9AddLanguage @ModuleID, 'AR3000.EndingBalance', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nợ';
EXEC ERP9AddLanguage @ModuleID, 'AR3000.Debit', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Có';
EXEC ERP9AddLanguage @ModuleID, 'AR3000.Credit', @FormID, @LanguageValue, @Language;

