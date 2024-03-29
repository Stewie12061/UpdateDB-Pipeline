
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF1000- OO
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
SET @FormID = 'LMF1000';

SET @LanguageValue = N'Danh sách hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1000.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1000.CreditFormID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1000.CreditFormName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'LMF1000.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'LMF1000.IsCommon', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'LMF1000.Disabled', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1000.CreditTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1000.CreditTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1000.CreditTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'LMF1000.CreditTypeName.CB', @FormID, @LanguageValue, @Language;
