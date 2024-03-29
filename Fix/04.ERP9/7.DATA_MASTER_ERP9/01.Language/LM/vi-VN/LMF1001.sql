
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF1001- OO
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
SET @FormID = 'LMF1001';

SET @LanguageValue = N'Cập nhật hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1001.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1001.CreditFormID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1001.CreditFormName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'LMF1001.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'LMF1001.IsCommon', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'LMF1001.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1001.CreditTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1001.CreditTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1001.CreditTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1001.CreditTypeName.CB', @FormID, @LanguageValue, @Language;