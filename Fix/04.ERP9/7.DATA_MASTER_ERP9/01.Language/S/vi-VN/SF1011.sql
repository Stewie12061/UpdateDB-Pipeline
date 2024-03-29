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
SET @FormID = 'SF1011';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Cập nhật nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1011.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhóm';
EXEC ERP9AddLanguage @ModuleID, 'SF1011.GroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhóm';
EXEC ERP9AddLanguage @ModuleID, 'SF1011.GroupName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'SF1011.Disabled' , @FormID, @LanguageValue, @Language;

----------------------------- 20/08/2020 - Modified by Tấn Thành--------------------------------------
SET @LanguageValue = N'Vai trò mặc định';
EXEC ERP9AddLanguage @ModuleID, 'SF1011.RoleDefaultID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã vai trò';
EXEC ERP9AddLanguage @ModuleID, 'SF1011.ParentRoleID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên vai trò';
EXEC ERP9AddLanguage @ModuleID, 'SF1011.ParentRoleName.CB' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;