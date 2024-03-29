
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
SET @FormID = 'DRF0020';

SET @LanguageValue = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'DRF0020.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'DRF0020.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ kế toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF0020.Period' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã PT chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'DRF0020.BranchAna' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email gửi CVXR';
EXEC ERP9AddLanguage @ModuleID, 'DRF0020.XRTemplate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email gửi CVVPL';
EXEC ERP9AddLanguage @ModuleID, 'DRF0020.VPLTemplate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email đóng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF0020.CloseTemplate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công văn Xương Rồng 1';
EXEC ERP9AddLanguage @ModuleID, 'DRF0020.XR1TemplateHTML' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công văn Văn phòng luật';
EXEC ERP9AddLanguage @ModuleID, 'DRF0020.VPLTemplateHTML' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công văn Xương Rồng 2';
EXEC ERP9AddLanguage @ModuleID, 'DRF0020.XR2TemplateHTML' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công văn Công an';
EXEC ERP9AddLanguage @ModuleID, 'DRF0020.CVCATemplateHTML' , @FormID, @LanguageValue, @Language;