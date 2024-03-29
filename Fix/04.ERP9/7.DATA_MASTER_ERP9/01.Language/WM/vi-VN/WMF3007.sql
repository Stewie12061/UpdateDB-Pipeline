
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
SET @Language = 'vi-VN' 
SET @ModuleID = 'WM';
SET @FormID = 'WMF3007';

SET @LanguageValue = N'Báo cáo tồn kho theo nhà phân phối';
EXEC ERP9AddLanguage @ModuleID, 'WMF3007.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Theo kỳ';
EXEC ERP9AddLanguage @ModuleID, 'WMF3007.PeriodID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF3007.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhà phân phối';
	EXEC ERP9AddLanguage @ModuleID, 'WMF3007.DealerID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm hàng';
	EXEC ERP9AddLanguage @ModuleID, 'WMF3007.I08ID', @FormID, @LanguageValue, @Language;