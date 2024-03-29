
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ MF3000- OO
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
SET @ModuleID = 'M';
SET @FormID = 'MF3000';

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'MF3000.MF3000Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'MF3000.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Statistics';
EXEC ERP9AddLanguage @ModuleID, 'AsoftM.Statistics_M', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'AsoftM.Report_M', @FormID, @LanguageValue, @Language;
