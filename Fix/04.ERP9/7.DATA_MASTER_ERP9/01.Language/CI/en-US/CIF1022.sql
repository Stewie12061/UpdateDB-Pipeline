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
SET @Language = 'en-US' 
SET @ModuleID = 'CI';
SET @FormID = 'CIF1022';
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Detail duty';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Division';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.DivisionID' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Division name';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.DivisionName' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------


SET @LanguageValue = N'Duty rate';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.DutyRate' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Duty code';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.DutyID' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Duty name';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.DutyName' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Disable';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.Disabled' , @FormID, @LanguageValue, @Language;---------
------------------------------------------------------------------------------------------------------
SET @LanguageValue  = N'Create date';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.CreateDate',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Last modify date';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.LastModifyDate',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Last modify user';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.LastModifyUserID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Create user';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.CreateUserID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Information duty ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.CIF1022Group01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'System Information';
EXEC ERP9AddLanguage @ModuleID, 'CIF1022.CIF1022Group02Title' , @FormID, @LanguageValue, @Language;
;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;