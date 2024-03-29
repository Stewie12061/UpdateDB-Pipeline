------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1000 
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
SET @FormID = 'CIF1002';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'課の詳細を見る';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'単位';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'単位の名前';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.DivisionName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'課のコード';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'課の名前';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.DepartmentName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'給料の口座';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.AccountID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'給料の口座';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.AccountName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'表示しない';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.Disabled' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'共用';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.IsCommon' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'作成者';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.CreateUserID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'作成日';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.CreateDate' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'修正日';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.LastModifyDate' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'修正者';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.LastModifyUserID' , @FormID, @LanguageValue, @Language;



SET @LanguageValue = N'課の情報';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.CIF1002Group01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'システムの情報';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.CIF1002Group02Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;