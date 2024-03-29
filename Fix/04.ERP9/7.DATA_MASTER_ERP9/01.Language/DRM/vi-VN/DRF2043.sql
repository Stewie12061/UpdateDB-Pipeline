------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2043 - DRM
--            Ngày tạo                                    Người tạo
--            14/11/2014                                  trithien
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000)
------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thu thi truy van
-- SELECT * FROM A00001 WHERE FormID = 'DRF2043'
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'vi-VN';
SET @ModuleID = 'DRM';
SET @FormID = 'DRF2043';
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Kế thừa hồ sơ lương';
EXEC ERP9AddLanguage @ModuleID, 'DRF2043.DRF2043Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa từ hồ sơ nhân sự';
EXEC ERP9AddLanguage @ModuleID, 'DRF2043.FromEmployeeFile' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kế thừa từ hồ sơ lương';
EXEC ERP9AddLanguage @ModuleID, 'DRF2043.FromSalaryFile' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2043.Period' , @FormID, @LanguageValue, @Language;

