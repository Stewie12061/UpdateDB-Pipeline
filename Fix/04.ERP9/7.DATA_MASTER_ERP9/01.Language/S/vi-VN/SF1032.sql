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
SET @FormID = 'SF1032';

SET @LanguageValue = N'Mã thông báo';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1032.ID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Loại ngôn ngữ';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1032.LanguageID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Phân hệ';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1032.Module' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Nội dung';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1032.Name' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Xem chi tiết thông báo';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1032.SF1032Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Thông tin chung';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1032.SF1032Title1' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;
