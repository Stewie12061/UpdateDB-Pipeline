
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF3004- OO
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
SET @Language = 'en-US' 
SET @ModuleID = 'T';
SET @FormID = 'AF3004';

SET @LanguageValue = N'Save forward currency';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.ReportCode_AF3004', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Name';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.ReportName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'People Create';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.PeopleCreate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Unit(đồng)';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.AmountUnit', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report Date';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.DateCreate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Division';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.DivisionID', @FormID, @LanguageValue, @Language;

-- [Đình Hòa] [26/02/2021] - Bổ sung ngôn ngữ
SET @LanguageValue = N'Report information';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.GroupTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Filtering criteria';
EXEC ERP9AddLanguage @ModuleID, 'AF3004.GroupTitle2', @FormID, @LanguageValue, @Language;