
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0394- OO
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
SET @ModuleID = 'HRM';
SET @FormID = 'HF0394';

SET @LanguageValue = N'Xem thông tin phép thâm niên';
EXEC ERP9AddLanguage @ModuleID, 'HF0394.HF0394Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xem thông tin phép thâm niên';
EXEC ERP9AddLanguage @ModuleID, 'HF0394.SubTitle1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thâm niên';
EXEC ERP9AddLanguage @ModuleID, 'HF0394.SeniorityID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'HF0394.DescriptionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'HF0394.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'>= Giá trị (năm)';
EXEC ERP9AddLanguage @ModuleID, 'HF0394.FromValues', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'< Giá trị (năm)';
EXEC ERP9AddLanguage @ModuleID, 'HF0394.ToValues', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày phép tăng';
EXEC ERP9AddLanguage @ModuleID, 'HF0394.VacSeniorDays', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày phép tồn được chuyển sang năm';
EXEC ERP9AddLanguage @ModuleID, 'HF0394.VacSeniorPrevDays', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'HF0394.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'HF0394.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'HF0394.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'HF0394.LastModifyDate' , @FormID, @LanguageValue, @Language;