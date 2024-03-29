------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF10001 - S
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
SET @FormID = 'SF1010';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Danh mục nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1010.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'SF1010.DivisionIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1010.GroupIDFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1010.GroupNameFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'SF1010.DisabledFilter' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;