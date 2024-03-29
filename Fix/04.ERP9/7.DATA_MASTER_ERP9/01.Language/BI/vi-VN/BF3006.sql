
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ BF3006- OO
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
SET @FormID = 'BF3006';

SET @LanguageValue = N'Biểu đồ số lượng bán và doanh số bán';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho hàng';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.WareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng bán';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.AcctualyQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.ProQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Doanh số bán';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.Amount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.Group' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.FromInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.ToInventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tất cả';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.All' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'SUP';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.rdbSUP' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ASM';
EXEC ERP9AddLanguage @ModuleID, 'BF3006.rdbASM' , @FormID, @LanguageValue, @Language;
