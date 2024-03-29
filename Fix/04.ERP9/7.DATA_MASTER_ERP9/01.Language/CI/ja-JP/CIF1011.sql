------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1011
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
SET @FormID = 'CIF1011';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'チームの更新';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'単位';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'単位名';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.DivisionName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'チームのコード';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.TeamID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'チーム名';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.TeamName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'注釈';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.Notes' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'注釈①' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.Notes01' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'表示しない' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.Disabled' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'課のコード' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'課の名前' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.DepartmentName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'給料の口座' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.AccountID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'給料の口座名' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.AccountName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'支店' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.BranchID' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;