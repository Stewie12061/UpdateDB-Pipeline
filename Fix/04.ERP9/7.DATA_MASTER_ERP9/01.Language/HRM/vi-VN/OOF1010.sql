
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF1010- OO
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
SET @FormID = 'OOF1010';

SET @LanguageValue = N'Danh mục loại bất thường';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại bất thường';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.UnusualTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải(Eng)';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.DescriptionE' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức xử lý';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.HandleMethodID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức xử lý';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.HandleMethodName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phương thức xử lý';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.ID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phương thức xử lý';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.Description.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.Note' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'OOF1010.CreateDate' , @FormID, @LanguageValue, @Language;

