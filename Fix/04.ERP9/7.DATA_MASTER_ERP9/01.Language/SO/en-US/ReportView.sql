
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ ReportView- OO
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
SET @Language = 'en-US' 
SET @ModuleID = 'SO';
SET @FormID = 'ReportView';

SET @LanguageValue = N'Currency ID';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.CurrencyID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Currency name';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.CurrencyName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Area ID';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AreaID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Area name';
EXEC ERP9AddLanguage @ModuleID, 'ReportView.AreaName.CB' , @FormID, @LanguageValue, @Language;

