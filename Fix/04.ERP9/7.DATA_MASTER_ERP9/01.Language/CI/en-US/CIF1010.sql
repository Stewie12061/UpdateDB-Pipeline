------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1010
--Người tạo: Hồ Hoàng Tú-10/10/2014
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
SET @ModuleID = 'CI';
SET @FormID = 'CIF1010';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'List of team';
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Division';
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Department code';
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Team code';
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.TeamID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Team name';
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.TeamName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Notes';
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.Notes' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Notes 1' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.Notes01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Disable' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Branch' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1010.BranchID' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;