-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF0009 - S
-----------------------------------------------------------------------------------------------------

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
SET @FormID = 'SF0009';

SET @LanguageValue = N'Phân quyền cảnh báo';
EXEC ERP9AddLanguage @ModuleID, 'SF0009.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF0009.GroupID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách cảnh báo chưa có quyền';
EXEC ERP9AddLanguage @ModuleID, 'SF0009.Grid1Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách cảnh báo có quyền';
EXEC ERP9AddLanguage @ModuleID, 'SF0009.Grid2Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'STT';
EXEC ERP9AddLanguage @ModuleID, 'SF0009.OrderNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại cảnh báo';
EXEC ERP9AddLanguage @ModuleID, 'SF0009.Description', @FormID, @LanguageValue, @Language;
