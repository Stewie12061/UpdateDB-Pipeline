
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF1001- OO
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
SET @FormID = 'OOF1001';

SET @LanguageValue = N'Cập nhật loại phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.AbsentTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải (Vie)';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải (Eng)';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.DescriptionE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại công';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.TypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại công';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.TypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại công';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.TypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại công';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.TypeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại phép đi trễ về sớm';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.IsDTVS' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quy định';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.RestrictID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã quy định';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.RestrictID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên quy định';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.RestrictName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên quy định';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.RestrictName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại phép nghỉ bệnh';
EXEC ERP9AddLanguage @ModuleID, 'OOF1001.IsSickLeave' , @FormID, @LanguageValue, @Language;