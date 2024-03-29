
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SOF2055- OO
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
SET @FormID = 'SOF2055';

SET @LanguageValue = N'Danh sách đơn hàng sắp đến ngày giao';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.OrderDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.VoucherTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.OrderStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.ObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ giao hàng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.DeliveryAddress' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại đơn hàng bán';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.ClassifyName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.FullName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày ký hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.ContractDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.CurrencyID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỷ giá';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.ExchangeRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nguyên tệ';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.OriginalAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quy đổi';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.ConvertedAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'SOF2055.Notes' , @FormID, @LanguageValue, @Language;

