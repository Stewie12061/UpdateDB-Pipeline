-----------------------------------------------------------------------------------------------------
-- Script tạo message - MT
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
SET @ModuleID = 'MT';
SET @FormID = 'MTF0010';

SET @LanguageValue = N'Thiết lập hệ thống';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'A00.MTF0020Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Thông tin thiết lập hệ thống';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'A00.MTF0020TitleNotes' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Chọn kỳ kế toán';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'A00.MTF0030Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Thông tin kỳ kế toán';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'A00.MTF0030TitleNotes' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Quản lý báo cáo';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'A00.MTF0050Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Thông tin quản lý báo cáo';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'A00.MTF0050TitleNotes' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Thiết lập hệ thống';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'A00.PanelMasterTitle' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;
