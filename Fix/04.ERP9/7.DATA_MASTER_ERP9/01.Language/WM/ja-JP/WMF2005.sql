
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ WMF2005- OO
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
SET @Language = 'ja-JP' 
SET @ModuleID = 'WM';
SET @FormID = 'WMF2005';

SET @LanguageValue = N'Yêu cầu xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.WMF2005Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.ContractNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.WarehouseID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.Status', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.FromDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.ToDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.VoucherTypeID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hoạch toán';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.VoucherDate', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành tiền';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.ConvertedAmount', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.ObjectID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho xuất';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.ExWareHouseName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trạng thái';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.StatusName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tham chiếu 1';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.RefNo01', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã tham chiếu 2';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.RefNo02', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.Notes', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.CreateUserName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.WareHouseID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.WareHouseName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'WR0096 - Phiếu yêu cầu xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.Report01', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'WR0096B - Phiếu đề nghị xuất kho';
EXEC ERP9AddLanguage @ModuleID, 'WMF2005.Report02', @FormID, @LanguageValue, @Language;