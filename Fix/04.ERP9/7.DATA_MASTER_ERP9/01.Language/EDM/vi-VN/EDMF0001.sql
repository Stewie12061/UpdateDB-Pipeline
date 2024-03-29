-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ 
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
SET @ModuleID = 'EDM';
SET @FormID = 'EDMF0001';

SET @LanguageValue = N'Thiết lập khoản thu';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0001.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0001.IsUsed', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0001.AnaName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0001.AccountName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hình thu';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0001.ReceiptTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0001.AccountID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0001.AccountName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại hình';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0001.ReceiptTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại hình';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0001.ReceiptTypeName.CB', @FormID, @LanguageValue, @Language;




