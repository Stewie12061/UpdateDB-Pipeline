
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HRMF3009
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
SET @FormID = 'HRMF3009';

SET @LanguageValue = N'Báo cáo thống kê quyết định tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3009.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3009.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mẫu báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3009.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3009.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3009.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3009.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ đợt';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3009.FromRecruitPeriodName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến đợt';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3009.ToRecruitPeriodName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3009.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3009.DepartmentID_Traning' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vị trí';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3009.DutyID' , @FormID, @LanguageValue, @Language;












