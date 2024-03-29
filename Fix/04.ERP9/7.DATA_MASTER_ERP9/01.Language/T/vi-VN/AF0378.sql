
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
SET @ModuleID = 'T';
SET @FormID = 'AF0378';

SET @LanguageValue = N'Báo cáo số lượng bán và doanh số bán';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.AF0378Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.ReportID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.ReportName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.ReportTitle', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.FromInventoryID_AF0378', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.ToInventoryID_AF0378', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.GroupTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.GroupTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh số bán - doanh thu';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.ChartTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sản lượng bán - nghiệm thu';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.ChartTitle2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng bán';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.DH_Quantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng nghiệm thu';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.HB_Quantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh số bán';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.DH_Amount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh thu';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.HB_Amount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.Product', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh số bán';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.Sales', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh thu';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.Revenue', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.Quantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành tiền';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.Amount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'SL nghiệm thu';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.AcceptanceQuantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị nghiệm thu';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.AcceptanceValue', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thu tiền';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.CollectMoney', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng cộng';
EXEC ERP9AddLanguage @ModuleID, 'AF0378.Total', @FormID, @LanguageValue, @Language;