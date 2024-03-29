------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1012
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
SET @Language = 'ja-JP' 
SET @ModuleID = 'CI';
SET @FormID = 'CIF1012';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'チームの詳細を見る';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'単位';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'単位名';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.DivisionName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'グループのコード';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.TeamID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'グループ名';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.TeamName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'課のコード';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'課の名前';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.DepartmentName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'給料の口座';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.AccountID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'給料の口座';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.AccountName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'注釈';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.Notes' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'注釈①';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.Notes01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'表示しない';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.Disabled' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'共用';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.IsCommon' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'作成者';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.CreateUserID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'作成日';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.CreateDate' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'修正日';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.LastModifyDate' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'修正者';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.LastModifyUserID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'チームの情報';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.CIF1012Group01Title' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'システムの情報';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.CIF1012Group02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'支店のコード';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'支店';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.AnaName' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;