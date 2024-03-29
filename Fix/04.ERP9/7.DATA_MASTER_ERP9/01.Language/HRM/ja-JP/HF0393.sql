
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0393- OO
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
SET @Language = 'ja-JP' 
SET @ModuleID = 'HRM';
SET @FormID = 'HF0393';

SET @LanguageValue = N'Cập nhật phép thâm niên';
EXEC ERP9AddLanguage @ModuleID, 'HF0393.HF0393Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thâm niên';
EXEC ERP9AddLanguage @ModuleID, 'HF0393.SeniorityID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'HF0393.DescriptionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'HF0393.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'>= Giá trị (năm)';
EXEC ERP9AddLanguage @ModuleID, 'HF0393.FromValues', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'< Giá trị (năm)';
EXEC ERP9AddLanguage @ModuleID, 'HF0393.ToValues', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày phép tăng';
EXEC ERP9AddLanguage @ModuleID, 'HF0393.VacSeniorDays', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày phép tồn được chuyển sang năm';
EXEC ERP9AddLanguage @ModuleID, 'HF0393.VacSeniorPrevDays', @FormID, @LanguageValue, @Language;
