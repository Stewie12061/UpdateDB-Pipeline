
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ BF3009- OO
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
SET @FormID = 'BF3009';

SET @LanguageValue = N'Báo cáo phân tích bán hàng chạy';
EXEC ERP9AddLanguage @ModuleID, 'BF3009.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3009.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3009.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'BF3009.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'BF3009.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3009.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'BF3009.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'BF3009.OrderStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân tích theo';
EXEC ERP9AddLanguage @ModuleID, 'BF3009.GroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại dữ liệu';
EXEC ERP9AddLanguage @ModuleID, 'BF3009.GroupID1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại dữ liệu chi tiết';
EXEC ERP9AddLanguage @ModuleID, 'BF3009.ValueID' , @FormID, @LanguageValue, @Language;
