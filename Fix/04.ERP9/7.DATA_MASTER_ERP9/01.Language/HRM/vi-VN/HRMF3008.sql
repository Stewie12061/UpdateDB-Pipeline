
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HRMF3008
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
SET @FormID = 'HRMF3008';

SET @LanguageValue = N'Báo cáo thống kê nguồn tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3008.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3008.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mẫu báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3008.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3008.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3008.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3008.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ đợt';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3008.FromRecruitPeriodName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến đợt';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3008.ToRecruitPeriodName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3008.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguồn tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3008.ResourceID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vị trí';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3008.DutyID' , @FormID, @LanguageValue, @Language;












