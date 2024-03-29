
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ AF9041- T
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
SET @FormID = 'AF9041';

SET @LanguageValue = N'Danh mục cước vận chuyển';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.DivisionID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảng mã cước';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.ShippingFee', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.ObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.ObjectName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ giao hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.Address', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại xe';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.TruckType', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại cước';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.ShippingFeeCode', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá tiền';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.TotalPrice', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phần trăm chiết khấu';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.Discount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền cước sau khi khấu trừ';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.AmountAfterDiscount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại xe';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.TruckType.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mô Tả';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.Description.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại mã cước';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.ShippingFeeCode.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.ObjectID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.ObjectName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.DeliveryAddressID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'AF9041.DeliveryAddressName.CB', @FormID, @LanguageValue, @Language;
