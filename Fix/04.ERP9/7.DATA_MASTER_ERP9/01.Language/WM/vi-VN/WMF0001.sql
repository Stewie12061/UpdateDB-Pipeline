
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0405- OO
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
SET @ModuleID = 'WM';
SET @FormID = 'WMF0001';

SET @LanguageValue = N'Thiết lập cấp quản lý theo vị trí';
EXEC ERP9AddLanguage @ModuleID, 'WMF0001.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'WMF0001.IsUsed' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên cấp';
EXEC ERP9AddLanguage @ModuleID, 'WMF0001.LevelName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'WMF0001.SystemName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Định nghĩa tên sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'WMF0001.UserName' , @FormID, @LanguageValue, @Language;