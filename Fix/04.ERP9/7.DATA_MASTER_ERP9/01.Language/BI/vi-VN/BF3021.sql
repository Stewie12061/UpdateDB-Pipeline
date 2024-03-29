
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ BF3021- OO
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
SET @FormID = 'BF3021';

SET @LanguageValue = N'Báo cáo hoạt động kinh doanh';
EXEC ERP9AddLanguage @ModuleID, 'BF3021.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3021.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3021.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'BF3021.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'BF3021.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3021.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'BF3021.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Theo kho';
EXEC ERP9AddLanguage @ModuleID, 'BF3021.WareHouseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Theo kho';
EXEC ERP9AddLanguage @ModuleID, 'BF3021.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Theo sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'BF3021.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Theo sản phẩm';
EXEC ERP9AddLanguage @ModuleID, 'BF3021.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích';
EXEC ERP9AddLanguage @ModuleID, 'BF3021.GroupID' , @FormID, @LanguageValue, @Language;
