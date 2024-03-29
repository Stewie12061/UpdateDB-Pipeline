------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1001 
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
SET @FormID = 'CIF1001';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'課の更新';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'単位';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'単位の名前';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.DivisionName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'課のコード';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'課の名前';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.DepartmentName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tk Chi phí lương';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.AccountID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'口座名';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.AccountName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'表示しない';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.Disabled' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'共用';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.IsCommon' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;