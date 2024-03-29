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
SET @FormID = 'SF1012';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Xem thông tin chi tiết nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin mã nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.Title2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.GroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.GroupName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.UserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.UserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thêm người dùng vào nhóm';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.InsertUser' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân quyền đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.PermissionDivision' , @FormID, @LanguageValue, @Language;

----------------------------- 20/08/2020 - Modified by Tấn Thành--------------------------------------
SET @LanguageValue = N'Vai trò mặc định';
EXEC ERP9AddLanguage @ModuleID, 'SF1012.RoleDefaultName' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;