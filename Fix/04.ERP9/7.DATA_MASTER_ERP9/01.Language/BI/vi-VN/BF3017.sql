
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
SET @FormID = 'BF3017';

SET @LanguageValue = N'Báo cáo tỉ lệ chuyển đổi từ phiếu chào giá sang đơn hàng bán';
EXEC ERP9AddLanguage @ModuleID, 'BF3017.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3017.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3017.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'BF3017.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3017.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'BF3017.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Năm ';
EXEC ERP9AddLanguage @ModuleID, 'BF3017.TranYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'BF3017.FromObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'BF3017.ToObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'BF3017.CurrencyID' , @FormID, @LanguageValue, @Language;


