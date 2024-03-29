
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF1000 - DRM
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
SET @Language = 'vi-VN' 
SET @ModuleID = 'DRM';
SET @FormID = 'DRF0120';

SET @LanguageValue = N'Thiết lập tỉ lệ phân bổ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0120.DRF0120Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'DRF0120.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chỉ tiêu';
EXEC ERP9AddLanguage @ModuleID, 'DRF0120.Indicator' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nợ tiêu dùng';
EXEC ERP9AddLanguage @ModuleID, 'DRF0120.NTDAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nợ thương mại';
EXEC ERP9AddLanguage @ModuleID, 'DRF0120.NTMAmount' , @FormID, @LanguageValue, @Language;




