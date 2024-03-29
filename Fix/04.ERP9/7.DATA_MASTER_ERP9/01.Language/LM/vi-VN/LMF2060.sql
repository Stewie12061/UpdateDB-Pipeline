
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ LMF2060- OO
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
SET @FormID = 'LMF2060';

SET @LanguageValue = N'Danh sách giải chấp tài sản';
EXEC ERP9AddLanguage @ModuleID, 'LMF2060.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng vay';
EXEC ERP9AddLanguage @ModuleID, 'LMF2060.LoanVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'LMF2060.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hiệu lực từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'LMF2060.FromDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hiệu lực đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'LMF2060.ToDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'LMF2060.LoanConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày giải chấp';
EXEC ERP9AddLanguage @ModuleID, 'LMF2060.UnwindDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị giải chấp';
EXEC ERP9AddLanguage @ModuleID, 'LMF2060.UnwindAmount', @FormID, @LanguageValue, @Language;
