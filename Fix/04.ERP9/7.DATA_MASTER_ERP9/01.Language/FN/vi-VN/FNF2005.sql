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
SET @FormID = 'FNF2005';

SET @LanguageValue = N'Kế thừa quản lý vay';
EXEC ERP9AddLanguage @ModuleID, 'FNF2005.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số hợp đồng vay';
EXEC ERP9AddLanguage @ModuleID, 'FNF2005.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'FNF2005.Status', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'FNF2005.OrderNo.CB', @FormID, @LanguageValue, @Language;
	
SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'FNF2005.Description.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'FNF2005.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'FNF2005.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'FNF2005.Status', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hình thức tín dụng';
EXEC ERP9AddLanguage @ModuleID, 'FNF2005.CreditFormName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian hiệu lực';
EXEC ERP9AddLanguage @ModuleID, 'FNF2005.FromToDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'FNF2005.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'FNF2005.OAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'FNF2005.CAmount', @FormID, @LanguageValue, @Language;

