
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF3000- OO
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
SET @ModuleID = 'T';
SET @FormID = 'AF3000';

SET @LanguageValue = N'Report';
EXEC ERP9AddLanguage @ModuleID, 'AF3000.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Statistic';
EXEC ERP9AddLanguage @ModuleID, 'AsoftT.Statistics' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Financial';
EXEC ERP9AddLanguage @ModuleID, 'AsoftT.G05' , @FormID, @LanguageValue, @Language;

