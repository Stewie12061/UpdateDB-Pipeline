
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
SET @FormID = 'BF3013';

SET @LanguageValue = N'Báo cáo doanh số theo nhóm khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'BF3013.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3013.ReportID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3013.ReportName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu đề';
EXEC ERP9AddLanguage @ModuleID, 'BF3013.ReportTitle' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Báo cáo';
EXEC ERP9AddLanguage @ModuleID, 'BF3013.GroupTitle1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiêu chí lọc';
EXEC ERP9AddLanguage @ModuleID, 'BF3013.GroupTitle2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ';
EXEC ERP9AddLanguage @ModuleID, 'BF3013.MonthYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'BF3013.FromObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'BF3013.ToObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'BF3013.CurrencyID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm 1';
EXEC ERP9AddLanguage @ModuleID, 'BF3013.GroupID1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm 2';
EXEC ERP9AddLanguage @ModuleID, 'BF3013.GroupID2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm 3';
EXEC ERP9AddLanguage @ModuleID, 'BF3013.GroupID3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm 4';
EXEC ERP9AddLanguage @ModuleID, 'BF3013.GroupID4' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm 5';
EXEC ERP9AddLanguage @ModuleID, 'BF3013.GroupID5' , @FormID, @LanguageValue, @Language;




