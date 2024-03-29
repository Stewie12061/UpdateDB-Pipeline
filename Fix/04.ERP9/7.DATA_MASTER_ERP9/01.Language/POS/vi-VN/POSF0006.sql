------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0006 - POS
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
SET @ModuleID = 'POS';
SET @FormID = 'POSF0006';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------


SET @LanguageValue = N'Thiết lập phương thức thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'POSF0006.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0006.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức thanh toán 1';
EXEC ERP9AddLanguage @ModuleID, 'POSF0006.PaymentID01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại đối tượng 1';
EXEC ERP9AddLanguage @ModuleID, 'POSF0006.ObjectTypeID01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức thanh toán 2';
EXEC ERP9AddLanguage @ModuleID, 'POSF0006.PaymentID02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại đối tượng 2';
EXEC ERP9AddLanguage @ModuleID, 'POSF0006.ObjectTypeID02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mặc định';
EXEC ERP9AddLanguage @ModuleID, 'POSF0006.IsDefault' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;