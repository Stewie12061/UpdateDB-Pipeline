------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF0010 - S
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
SET @Language = 'en-US ' 
SET @ModuleID = 'S';
SET @FormID = 'SF0010';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Title';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'User ID';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.UserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'User name';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.UserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Language';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.LanguageID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Page size';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.PageSize' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Language code';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.LanguageID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Language name';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.LanguageName.CB', @FormID, @LanguageValue, @Language;

-- [Đình Hòa] [26/02/2021] - Bổ sung ngôn ngữ
SET @LanguageValue = N'USER INFORMATION';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.USERINFORMATION' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.Email' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Password';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.Password' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Protocol';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.Protocol' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Server';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.Server' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Port';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.Port' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Protocol Send';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.ProtocolSend' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Server Send';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.ServerSend' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Port Send';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.PortSend' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Display Name';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.DisplayName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Enable Ssl';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.EnableSsl' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Email Default';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.EmailDefault' , @FormID, @LanguageValue, @Language;

-- 07/10/2021 - [Hoài Bảo] - Bổ sung ngôn ngữ cho cập nhật người dùng SF0010 - thông tin người dùng
SET @LanguageValue = N'Sip Address';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.SipID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sip Password';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.SipPassword', @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;