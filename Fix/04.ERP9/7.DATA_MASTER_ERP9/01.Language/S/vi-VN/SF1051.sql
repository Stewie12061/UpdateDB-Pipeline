-----------------------------------------------------------------------------------------------------
-- Script tạo message - S
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(5),
@FormID VARCHAR(50),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000),
@LanguageCustomValue NVARCHAR(4000),

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
@Finished BIT

/*
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'vi-VN'; 
SET @ModuleID = 'S';
SET @FormID = 'SF1051';

--------------------------------- Modified by Tấn Thành on 29/08/2020 ---------------------------------------
--SET @LanguageValue = N'Cập nhật vai trò';
SET @LanguageValue = N'Cập nhật thiết lập phân quyền dữ liệu';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1051.Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;
-------------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Mã vai trò';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1051.RoleID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tên vai trò';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1051.RoleName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Vai trò cha';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1051.ParentRoleID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Quyền mặc định';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1051.IsDefualtRoleID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Vai trò';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1051.Role' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Quyền dữ liệu';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1051.DataRole' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Quyền dữ liệu';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1051.DataRole' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Loại dữ liệu';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1051.DataID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Quyền xem';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1051.TypeID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Quyền mặc định';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1051.FillRoleType' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Mã';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1051.FillRoleType.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Quyền mặc định';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1051.FillRoleName.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Mã';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1051.ParentRoleID.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tên vai trò';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1051.ParentRoleName.CB' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Phân hệ';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1051.ModuleID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;
