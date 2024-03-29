------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0070 - POS
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
SET @ModuleID = 'POS';
SET @FormID = 'POSF0070';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------


SET @LanguageValue = N'Báo cáo biểu đồ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.POSF0070Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'POSF0070.MTF0071Title';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.MTF0071Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'POSF0070.MTF0072Title';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.MTF0072Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'POSF0070.MTF0073Title';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.MTF0073Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'POSF0070.MTF0074Title';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.MTF0074Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.ReportSaleTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhập xuất tồn';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.ReportImportExportSurvivalTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mô tả';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.POSF0071Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.POSF0072Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.POSF0073Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.POSF0074Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.ShopID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.MemberID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.FromPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.ToPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hàng hóa';
EXEC ERP9AddLanguage @ModuleID, 'POSF0070.InventoryID' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;