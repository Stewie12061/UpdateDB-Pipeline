
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HRMF3002
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
SET @FormID = 'HRMF3002';
------- phần master
SET @LanguageValue = N'Báo cáo kế hoạch tuyển dụng';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3002.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3002.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mẫu báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3002.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3002.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3002.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3002.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kế hoạch';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3002.FromRecruitPlanName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kế hoạch';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3002.ToRecruitPlanName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3002.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3002.DepartmentID_Traning' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vị trí';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3002.DutyID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng chi phí theo định biên';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3002.TotalCostBoundary' , @FormID, @LanguageValue, @Language;












