
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF1000- OO
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
SET @FormID = 'OOF1000';

SET @LanguageValue = N'Danh mục loại phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.AbsentTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại phép';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.AbsentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải(Eng)';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.DescriptionE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại công';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.TypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại công';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.TypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại công';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.TypeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại công';
EXEC ERP9AddLanguage @ModuleID, 'OOF1000.TypeName.CB' , @FormID, @LanguageValue, @Language;

