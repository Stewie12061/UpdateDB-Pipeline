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
SET @FormID = 'CIF1000';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'課の名目';
EXEC ERP9AddLanguage @ModuleID, 'CIF1000.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'単位';
EXEC ERP9AddLanguage @ModuleID, 'CIF1000.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'課のコード';
EXEC ERP9AddLanguage @ModuleID, 'CIF1000.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'課の名前';
EXEC ERP9AddLanguage @ModuleID, 'CIF1000.DepartmentName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'表示しない';
EXEC ERP9AddLanguage @ModuleID, 'CIF1000.Disabled' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'共用';
EXEC ERP9AddLanguage @ModuleID, 'CIF1000.IsCommon' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;