
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF3001- OO
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
SET @FormID = 'AF3001';

SET @LanguageValue = N'Bảng cân đối kế toán';
EXEC ERP9AddLanguage @ModuleID, 'AF3001.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF3001.ReportCode_AF3001', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF3001.ReportName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'AF3001.ReportTitle', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'AF3001.AmountUnit', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày lập báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF3001.DateCreate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'AF3001.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảng cân đối kế toán';
EXEC ERP9AddLanguage @ModuleID, 'AR3001.BalanceSheet', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài sản';
EXEC ERP9AddLanguage @ModuleID, 'AR3001.Assets', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguồn vốn';
EXEC ERP9AddLanguage @ModuleID, 'AR3001.Resource', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số';
EXEC ERP9AddLanguage @ModuleID, 'AR3001.Code', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thuyết minh';
EXEC ERP9AddLanguage @ModuleID, 'AR3001.Voice-over', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số cuối kỳ';
EXEC ERP9AddLanguage @ModuleID, 'AR3001.EndingPeriod', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số đầu năm';
EXEC ERP9AddLanguage @ModuleID, 'AR3001.BeginningYear', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập';
EXEC ERP9AddLanguage @ModuleID, 'AR3001.Creator', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế toán trưởng';
EXEC ERP9AddLanguage @ModuleID, 'AR3001.ChiefAccountant', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giám đốc';
EXEC ERP9AddLanguage @ModuleID, 'AR3001.Director', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'(Ký, ghi rõ họ tên)';
EXEC ERP9AddLanguage @ModuleID, 'AR3001.SignatureName', @FormID, @LanguageValue, @Language;