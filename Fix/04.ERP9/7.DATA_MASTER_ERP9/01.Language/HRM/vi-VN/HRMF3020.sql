
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HRMF3020- HRM
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
SET @FormID = 'HRMF3020';

/*
--Lấy Query nhanh
declare @ScreenID varchar(20) =N'HRMF3020'
SELECT 'SET @LanguageValue = N''_''; EXEC ERP9AddLanguage @ModuleID, '''+IDLanguage+''' , @FormID, @LanguageValue, @Language;' FROM AS_ADMIN_NEWTOYO.dbo.sysLanguage WHERE ScreenID =@ScreenID

*/
SET @LanguageValue = N'Phòng ban'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3020.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Đơn vị'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3020.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mẫu báo cáo'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3020.ReportID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên báo cáo'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3020.ReportName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'lbTimeName'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3020.DateCaption' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Nhân viên'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3020.EmployeeName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Bảng đánh giá'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3020.EvaluationSetID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tiêu đề'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3020.ReportTitle' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Nhóm chỉ tiêu'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3020.TargetsGroupID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Chỉ tiêu'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3020.TargetsID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Báo cáo kết quả thực hiện KPI'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3020.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ {0} đến {1}';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3020.FromToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3020.GroupFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'HRMF3020.GroupReport' , @FormID, @LanguageValue, @Language;


SET @FormID = 'ReportView';

SET @LanguageValue = N'Mã bảng đánh giá';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.EvaluationSetID.CB' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên bảng đánh giá';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.EvaluationSetName.CB' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Đợt đánh giá';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.EvaluationPhaseName.CB' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.FromDate.CB' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.ToDate.CB' , @FormID, @LanguageValue, @Language;