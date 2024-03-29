
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF9022- T
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
SET @FormID = 'AF9022';

SET @LanguageValue = N'Danh mục đối tượng có công nợ quá hạn';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin công nợ của đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.DebtInfo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi tiết công nợ phải thu';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.ReceiveDebtInfo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi tiết công nợ phải trả';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.PayableDebtInfo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.ObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.ObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.Tel', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số thuế';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.VATNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nợ phải thu';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.ReceiveDebt', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.ReceiveDay', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nợ phải trả';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.PayableDebt', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày nợ NCC';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.PayableDay', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng tiền';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày nợ';
EXEC ERP9AddLanguage @ModuleID, 'AF9022.DebtDay', @FormID, @LanguageValue, @Language;	
