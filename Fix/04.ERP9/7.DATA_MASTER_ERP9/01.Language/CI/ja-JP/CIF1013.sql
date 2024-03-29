------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1013
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
SET @Language = 'ja-JP' 
SET @ModuleID = 'CI';
SET @FormID = 'CIF1013';
-----------------------------------------------------------------------------------------------------
---Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'チームに従業員を追加する';
EXEC ERP9AddLanguage @ModuleID, 'CIF1013.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'現在の従業員のリスト';
EXEC ERP9AddLanguage @ModuleID, 'CIF1013.Grid1Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'チームの従業員リスト';
EXEC ERP9AddLanguage @ModuleID, 'CIF1013.Grid2Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'チーム';
EXEC ERP9AddLanguage @ModuleID, 'CIF1013.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'班長';
EXEC ERP9AddLanguage @ModuleID, 'CIF1013.TeamLeaderID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'従業員のコード';
EXEC ERP9AddLanguage @ModuleID, 'CIF1013.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'従業員';
EXEC ERP9AddLanguage @ModuleID, 'CIF1013.EmployeeName' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;

