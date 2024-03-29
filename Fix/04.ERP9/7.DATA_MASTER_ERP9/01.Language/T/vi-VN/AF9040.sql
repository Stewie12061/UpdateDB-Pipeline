
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF9040- T
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
SET @FormID = 'AF9040';

SET @LanguageValue = N'Danh mục cước vận chuyển';
EXEC ERP9AddLanguage @ModuleID, 'AF9040.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'AF9040.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảng mã cước';
EXEC ERP9AddLanguage @ModuleID, 'AF9040.ShippingFee', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF9040.ObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF9040.ObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'AF9040.ObjectID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'AF9040.ObjectName.CB', @FormID, @LanguageValue, @Language;
