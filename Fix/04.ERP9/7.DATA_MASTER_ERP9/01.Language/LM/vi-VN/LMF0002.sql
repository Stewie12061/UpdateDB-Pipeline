
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF0002- OO
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
SET @ModuleID = 'LM';
SET @FormID = 'LMF0002';

SET @LanguageValue = N'Định nghĩa tham số';
EXEC ERP9AddLanguage @ModuleID, 'LMF0002.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF0002.Used', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên gốc';
EXEC ERP9AddLanguage @ModuleID, 'LMF0002.SystemName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên gọi(VIE)';
EXEC ERP9AddLanguage @ModuleID, 'LMF0002.UserName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên gọi(ENG)';
EXEC ERP9AddLanguage @ModuleID, 'LMF0002.UserNameE', @FormID, @LanguageValue, @Language;
