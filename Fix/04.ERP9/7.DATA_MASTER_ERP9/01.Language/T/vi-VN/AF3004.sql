
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF3004- OO
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
SET @FormID = 'AF3004';

SET @LanguageValue = N'Lưu chuyển tiền tệ';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.ReportCode', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.ReportCode_AF3004', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.ReportName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.PeopleCreate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính(đồng)';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.AmountUnit', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày lập báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.DateCreate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.GroupTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.GroupTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ trước là kỳ liền kề';
EXEC ERP9AddLanguage @ModuleID, 'AF3003.rdbPeriod1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ trước là cùng kỳ năm trước';
EXEC ERP9AddLanguage @ModuleID, 'AF3003.rdbPeriod2', @FormID, @LanguageValue, @Language;