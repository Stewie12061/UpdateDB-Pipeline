
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ WMF3003- OO
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
SET @ModuleID = 'WM';
SET @FormID = 'WMF3003';

SET @LanguageValue = N'Báo cáo chi tiết nhập xuất tồn theo đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.WMF3003Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.FromInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ToInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.FromObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ToObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.FromInventoryID_AF0378' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ToInventoryID_AF0378' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.FromObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ToObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.ObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF3003.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin báo cáo';
EXEC ERP9AddLanguage '00', 'A00.ReportInfor' , 'A00', @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích';
EXEC ERP9AddLanguage '00', 'A00.BusinessAnalystID' , 'A00', @LanguageValue, @Language;

SET @LanguageValue = N'Từ mã phân tích';
EXEC ERP9AddLanguage '00', 'A00.FromAna' , 'A00', @LanguageValue, @Language;

SET @LanguageValue = N'Đến mã phân tích';
EXEC ERP9AddLanguage '00', 'A00.ToAna' , 'A00', @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích';
EXEC ERP9AddLanguage '00', 'A00.ComboBoxWM_AnaID' , 'A00', @LanguageValue, @Language;

SET @LanguageValue = N'Tên phân tích';
EXEC ERP9AddLanguage '00', 'A00.ComboBoxWM_AnaName' , 'A00', @LanguageValue, @Language;

SET @LanguageValue = N'Phân tích';
EXEC ERP9AddLanguage '00', 'A00.AnalystID' , 'A00', @LanguageValue, @Language;
