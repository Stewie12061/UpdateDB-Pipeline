
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ MF0203- OO
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
SET @ModuleID = 'M';
SET @FormID = 'MF0203';

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'MF3000.MF3000Title', 'MF3000', @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo thống kê thành phẩm sản xuất';
EXEC ERP9AddLanguage @ModuleID, 'MF0203.MF0203Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'MF0203.ReportID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'MF0203.ReportName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'MF0203.ReportTitle', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho hàng';
EXEC ERP9AddLanguage @ModuleID, 'MF0203.WareHouseID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ loại sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'MF0203.FromI02ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến loại sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'MF0203.ToI02ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'MF0203.FromInventoryID_MF0203_WMF3004', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'MF0203.ToInventoryID_MF0203_WMF3004', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'MF0203.GroupTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'MF0203.GroupTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành phẩm nhập kho';
EXEC ERP9AddLanguage @ModuleID, 'MF0203.ChartTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thống kê lỗi sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'MF0203.ChartTitle2', @FormID, @LanguageValue, @Language;