-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF0009 - S
-----------------------------------------------------------------------------------------------------

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
SET @ModuleID = 'S';
SET @FormID = 'SF0009';

SET @LanguageValue = N'Assign warnings';
EXEC ERP9AddLanguage @ModuleID, 'SF0009.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'User group';
EXEC ERP9AddLanguage @ModuleID, 'SF0009.GroupID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'List of warning no rights';
EXEC ERP9AddLanguage @ModuleID, 'SF0009.Grid1Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'List of warning have the right';
EXEC ERP9AddLanguage @ModuleID, 'SF0009.Grid2Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'No.';
EXEC ERP9AddLanguage @ModuleID, 'SF0009.OrderNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Warning type';
EXEC ERP9AddLanguage @ModuleID, 'SF0009.Description', @FormID, @LanguageValue, @Language;
