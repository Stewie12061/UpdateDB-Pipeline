
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ BF3005- OO
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
SET @ModuleID = 'BI';
SET @FormID = 'BF3005';

SET @LanguageValue = N'Biểu đồ sản lượng sản xuất';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho hàng';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng đạt';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.StandardQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'số lượng hư';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.ErrorQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉ lệ hàng hư so với hàng đạt';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.Rate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ nhóm hàng';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.FromI03ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến nhóm hàng';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.ToI03ID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhóm hàng';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.ComboBoxAnaID_AT1015' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhóm hàng';
EXEC ERP9AddLanguage @ModuleID, 'BF3005.ComboBoxAnaName_AT1015' , @FormID, @LanguageValue, @Language;