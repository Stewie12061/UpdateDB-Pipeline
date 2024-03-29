
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF3008- OO
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
SET @FormID = 'AF3008';

SET @LanguageValue = N'Bảng cân đối số phát sinh';
EXEC ERP9AddLanguage @ModuleID, 'AF3008.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF3008.cboReportID_AF3000', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF3008.ReportName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'AF3008.ReportTitle', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'AF3008.AccLevel', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính(đồng)';
EXEC ERP9AddLanguage @ModuleID, 'AF3008.AmountUnit', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không bù trừ số dư với những TK lưỡng tính';
EXEC ERP9AddLanguage @ModuleID, 'AF3008.IsNotClear', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'AF3008.DivisionID', @FormID, @LanguageValue, @Language;
