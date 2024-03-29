
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
SET @FormID = 'BF3016';

SET @LanguageValue = N'Báo cáo doanh số	bán hàng theo nhà máy';
EXEC ERP9AddLanguage @ModuleID, 'BF3016.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3016.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3016.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'BF3016.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3016.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'BF3016.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Năm ';
EXEC ERP9AddLanguage @ModuleID, 'BF3016.TranYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'BF3016.FromObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'BF3016.ToObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'BF3016.CurrencyID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhà máy 1';
EXEC ERP9AddLanguage @ModuleID, 'BF3016.FactoryID1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhà máy 2';
EXEC ERP9AddLanguage @ModuleID, 'BF3016.FactoryID2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhà máy 3';
EXEC ERP9AddLanguage @ModuleID, 'BF3016.FactoryID3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhà máy 4';
EXEC ERP9AddLanguage @ModuleID, 'BF3016.FactoryID4' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhà máy 5';
EXEC ERP9AddLanguage @ModuleID, 'BF3016.FactoryID5' , @FormID, @LanguageValue, @Language;



