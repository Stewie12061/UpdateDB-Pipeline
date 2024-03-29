
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HRMF3017- HRM
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
SET @FormID = 'HRMF3017';

/*
--Lấy Query nhanh
declare @ScreenID varchar(20) =N'HRMF3017'
SELECT 'SET @LanguageValue = N''_''; EXEC ERP9AddLanguage @ModuleID, '''+IDLanguage+''' , @FormID, @LanguageValue, @Language;' FROM AS_ADMIN_NEWTOYO.dbo.sysLanguage WHERE ScreenID =@ScreenID

*/
SET @LanguageValue = N'Phòng ban'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3017.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Đơn vị'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3017.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mẫu báo cáo'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3017.ReportID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên báo cáo'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3017.ReportName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tổ nhóm'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3017.TeamID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Báo cáo tình hình đào tạo nhân viên'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3017.Title' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tiêu đề'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3017.ReportTitle' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Năm'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3017.TranYear' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Báo cáo'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3017.GroupReport' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tiêu chí lọc'; EXEC ERP9AddLanguage @ModuleID, 'HRMF3017.GroupFilter' , @FormID, @LanguageValue, @Language;




