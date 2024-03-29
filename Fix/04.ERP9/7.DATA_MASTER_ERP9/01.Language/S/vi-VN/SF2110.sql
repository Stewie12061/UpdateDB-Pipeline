------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF2110 
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
SET @FormID = 'SF2110';
------------------------------------------------------------------------------------------------------
--- Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thiết lập mail server';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.Title' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Máy chủ (SMTP)';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.Server' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cổng kết nối (Port)';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.Port' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.DisplayName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.Email' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mật khẩu';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.Password' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sử dụng SSL (Secure Sockets Layer)';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.EnableSsl' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Máy chủ (POP/IMAP)';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.ServerReceives' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cổng kết nối (Port)';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.PortReceives' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.DisplayNameReceives', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.EmailReceives', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mật khẩu';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.PasswordReceives', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sử dụng SSL (Secure Sockets Layer)';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.EnableSslReceives', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập thông tin gửi mail';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.ThietLapThongTinGuiMail', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập thông tin nhận mail';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.ThietLapThongTinNhanMail', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập thông tin Văn bản điện tử';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.ThietLapThongTinVanBan', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tác eContract';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.EContractPartner', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email quản lý';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.EContractEmail', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mật khẩu';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.EContractPassword', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đường dẫn API';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.EContractUrl', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'ID';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.ID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'SF2110.Description.CB', @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;