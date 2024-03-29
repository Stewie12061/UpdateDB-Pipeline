
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
SET @Language = 'zh-CN' 
SET @ModuleID = 'WM';
SET @FormID = 'WMF3007';

SET @LanguageValue = N'按經銷商劃分的庫存報告';
EXEC ERP9AddLanguage @ModuleID, 'WMF3007.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'按時期';
EXEC ERP9AddLanguage @ModuleID, 'WMF3007.PeriodID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'單元';
EXEC ERP9AddLanguage @ModuleID, 'WMF3007.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'經銷商';
	EXEC ERP9AddLanguage @ModuleID, 'WMF3007.DealerID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'一組貨物';
	EXEC ERP9AddLanguage @ModuleID, 'WMF3007.I08ID', @FormID, @LanguageValue, @Language;