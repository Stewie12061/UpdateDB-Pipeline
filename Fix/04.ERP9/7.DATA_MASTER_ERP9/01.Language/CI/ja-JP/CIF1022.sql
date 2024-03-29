------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1022
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
SET @FormID = 'CIF1022';
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'役職の詳細を見る';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'単位';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.DivisionID' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'単位名';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.DivisionName' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------


SET @LanguageValue = N'役職の係数';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.DutyRate' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'役職のコード';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.DutyID' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'役職名';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.DutyName' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'表示しない';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.Disabled' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'作成者';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.CreateUserID' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'作成日';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.CreateDate' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'修正日';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.LastModifyDate' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'修正者';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'役職の情報';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.CIF1022Group01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'システムの情報';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.CIF1022Group02Title' , @FormID, @LanguageValue, @Language;
;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;