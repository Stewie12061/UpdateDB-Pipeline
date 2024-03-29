
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ WMF2321- WM
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
SET @ModuleID = 'WM';
SET @FormID = 'WMF2321';

 

SET @LanguageValue = N'Cập nhật phiếu lắp rắp';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.VoucherDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.Description' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.ObjectName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người lập phiếu';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.ObjectName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.ObjectID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.VoucherTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên kho nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.ImWareHouseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tham chiếu 1';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.Ref01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tham chiếu 2';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.Ref02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bộ định mức';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.ApportionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.InventoryID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị tính';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.UnitID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.ActualQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn giá';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.UnitPrice' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành tiền';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.OriginalAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.ImWareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản nợ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.DebitAccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thủ kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.ImStoreManID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.Notes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lô nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.SourceNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.LimitDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên mặt hàng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.InventoryName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉ lệ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.Rate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.ExQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tài khoản có';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.CreditAccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.ExWareHouseID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.ExWareHouseName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chứng từ nhập';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.ReVoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chứng từ không định khoản sổ cái';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.IsLedger' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thủ kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2321.ExStoreManID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã kho';
EXEC ERP9AddLanguage @ModuleID,  N'WMF2321.WareHouseID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên kho';
EXEC ERP9AddLanguage @ModuleID,  N'WMF2321.WareHouseName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại';
EXEC ERP9AddLanguage @ModuleID,  N'WMF2321.VoucherTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại';
EXEC ERP9AddLanguage @ModuleID,  N'WMF2321.VoucherTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã bộ';
EXEC ERP9AddLanguage @ModuleID,  N'WMF2321.ApportionID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên bộ';
EXEC ERP9AddLanguage @ModuleID,  N'WMF2321.ApportionName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã TK';
EXEC ERP9AddLanguage @ModuleID,  N'WMF2321.AccountID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên TK';
EXEC ERP9AddLanguage @ModuleID,  N'WMF2321.AccountName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thủ kho';
EXEC ERP9AddLanguage @ModuleID,  N'WMF2321.EmployeeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên thủ kho';
EXEC ERP9AddLanguage @ModuleID,  N'WMF2321.EmployeeName.CB', @FormID, @LanguageValue, @Language;
