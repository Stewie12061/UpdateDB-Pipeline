
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SOF2054- OO
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
SET @ModuleID = 'SO';
SET @FormID = 'SOF2054';

SET @LanguageValue = N'Danh sách đơn hàng giao trễ';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.OrderDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.VoucherTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.OrderStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.ObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ giao hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.DeliveryAddress' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại đơn hàng bán';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.ClassifyName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày ký hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.ContractDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.CurrencyID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ giá';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.ExchangeRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.OriginalAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.ConvertedAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'SOF2054.Notes' , @FormID, @LanguageValue, @Language;

