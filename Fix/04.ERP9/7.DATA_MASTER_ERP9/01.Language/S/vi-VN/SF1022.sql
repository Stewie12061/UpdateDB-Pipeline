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
SET @FormID = 'SF1022';

SET @LanguageValue = N'Custom Name';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1022.CustomName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Màn hình';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1022.FormID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Mã ngôn ngữ';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1022.ID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Loại ngôn ngữ';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1022.LanguageID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Phân hệ';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1022.Module' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Nội dung';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1022.Name' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Xem chi tiết ngôn ngữ';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1022.SF1022Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Thông tin chung';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'SF1022.SF1022Title1' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;
