-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0393- OO
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
SET @ModuleID = 'FN';
SET @FormID = 'FNF2004';

SET @LanguageValue = N'Kế thừa yêu cầu mua hàng';
EXEC ERP9AddLanguage @ModuleID, 'FNF2004.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2004.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mức độ ưu tiên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2004.PriorityID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'FNF2004.ID.CB', @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2004.Description.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2004.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'FNF2004.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2004.OriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2004.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thuế Nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2004.VATOriginalAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thuế Quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2004.VATConvertedAmount', @FormID, @LanguageValue, @Language;

