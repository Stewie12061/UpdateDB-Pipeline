------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ POSF0016 - POS
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
SET @FormID = 'POSF0016';
------------------------------------------------------------------------------------------------------
-- Title
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Danh sách phiếu bán hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.FromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.ToDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.FromPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.ToPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cửa hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.ShopID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.VoucherTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ tham chiếu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.EVoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.MemberID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hội viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.MemberName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.CurrencyName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.PaymentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số IMEI 1';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.IMEI1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số IMEI 2';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.IMEI2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền giảm giá';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.TotalRedureAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiền chiết khấu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.TotalDiscountAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng tiền';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.TotalAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thêm trả hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.ReturnInventory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thêm đổi hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.ChangeInventory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lập phiếu thu';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.Receipt' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lập phiếu xuất';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.ExportPrints' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.MemberIDFilterOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.MemberNameFilterOKIA' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái hủy';
EXEC ERP9AddLanguage @ModuleID, 'POSF0016.DeleteFlg' , @FormID, @LanguageValue, @Language;


------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;