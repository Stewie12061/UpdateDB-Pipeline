
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF9020- T
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
SET @FormID = 'AF9020';

SET @LanguageValue = N'Danh mục đối tượng có công nợ quá hạn';
EXEC ERP9AddLanguage @ModuleID, 'AF9020.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'AF9020.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF9020.ObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'AF9020.ObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'AF9020.Tel', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số thuế';
EXEC ERP9AddLanguage @ModuleID, 'AF9020.VATNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nợ phải thu';
EXEC ERP9AddLanguage @ModuleID, 'AF9020.ReceiveDebt', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'AF9020.ReceiveDay', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nợ phải trả';
EXEC ERP9AddLanguage @ModuleID, 'AF9020.PayableDebt', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày nợ NCC';
EXEC ERP9AddLanguage @ModuleID, 'AF9020.PayableDay', @FormID, @LanguageValue, @Language;
