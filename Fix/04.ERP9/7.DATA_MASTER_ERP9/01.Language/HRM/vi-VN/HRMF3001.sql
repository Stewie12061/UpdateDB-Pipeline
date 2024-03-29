
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HRMF3001
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
SET @FormID = 'HRMF3001';
------- phần master
SET @LanguageValue = N'Báo cáo danh sách ứng viên';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3001.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3001.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mẫu báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3001.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3001.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3001.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3001.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguồn';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3001.DepartmentID_Traning' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ đợt';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3001.FromRecruitPeriodName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến đợt';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3001.ToRecruitPeriodName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3001.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Vị trí';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3001.DutyID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3001.GroupReport' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí chọn lọc';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3001.GroupFilter' , @FormID, @LanguageValue, @Language;










