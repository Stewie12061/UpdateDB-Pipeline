------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ kỳ kế toán
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
SET @Language = 'ja-JP' 
SET @ModuleID = '00';
SET @FormID = 'CloseBook';
------------------------------------------------------------------------------------------------------
-- Title
SET @LanguageValue = N'Close Book';
EXEC ERP9AddLanguage @ModuleID, 'CloseBook.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'DivisionID';
EXEC ERP9AddLanguage @ModuleID, 'CloseBook.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Division Name';
EXEC ERP9AddLanguage @ModuleID, 'CloseBook.DivisionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Current Period';
EXEC ERP9AddLanguage @ModuleID, 'CloseBook.CurrentPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Next Period';
EXEC ERP9AddLanguage @ModuleID, 'CloseBook.NextPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Begin Date';
EXEC ERP9AddLanguage @ModuleID, 'CloseBook.BeginDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'End Date';
EXEC ERP9AddLanguage @ModuleID, 'CloseBook.EndDate' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;