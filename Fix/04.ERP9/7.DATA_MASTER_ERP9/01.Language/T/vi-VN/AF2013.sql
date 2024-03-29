-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF2013- T
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
SET @ModuleID = 'T';
SET @FormID = 'AF2013';

SET @LanguageValue = N'Kế thừa';
EXEC ERP9AddLanguage @ModuleID, 'AF2013.Title', @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Nguồn kế thừa';
EXEC ERP9AddLanguage @ModuleID, 'AF2013.InheritTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF2013.ObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'AF2013.CurrencyID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF2013.ObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hạch toán';
EXEC ERP9AddLanguage @ModuleID, 'AF2013.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'AF2013.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngoài hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'AF2013.InvoiceDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số hóa đơn';
EXEC ERP9AddLanguage @ModuleID, 'AF2013.InvoiceNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số serial';
EXEC ERP9AddLanguage @ModuleID, 'AF2013.Serial', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho nhập';
EXEC ERP9AddLanguage @ModuleID, 'AF2013.ImWareHouseID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK có';
EXEC ERP9AddLanguage @ModuleID, 'AF2013.CreditAccountID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nguồn';
EXEC ERP9AddLanguage @ModuleID, 'AF2013.InheritTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nguồn kế thừa';
EXEC ERP9AddLanguage @ModuleID, 'AF2013.InheritTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF2013.ObjectID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF2013.ObjectName.CB', @FormID, @LanguageValue, @Language;