------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0000 - POS
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
SET @ModuleID = 'S';
SET @FormID = 'SF1014';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Thiết lập mật khẩu';
EXEC ERP9AddLanguage @ModuleID, 'SF1014.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đổi mật khẩu';
EXEC ERP9AddLanguage @ModuleID, 'SF1016.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1014.UserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1014.UserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mật khẩu mới ';
EXEC ERP9AddLanguage @ModuleID, 'SF1014.Password' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lặp lại ';
EXEC ERP9AddLanguage @ModuleID, 'SF1014.NewPassword' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mật khẩu cũ ';
EXEC ERP9AddLanguage @ModuleID, 'SF1014.OldPassword' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;