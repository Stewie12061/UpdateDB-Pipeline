-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ 
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
SET @ModuleID = 'NM';
SET @FormID = 'NMF0001';

SET @LanguageValue = N'Tên hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.SystemID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tiếng Việt';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.SystemName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tiếng Anh';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.SystemNameE', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kho';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.WareHouseName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.IsUse', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.IsCommon', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thiết lập hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành phần dinh dưỡng';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.TabNMT0001Nutrition', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách kho';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.TabNMT0001Warehouse', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.TabNMT0001Voucher', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã kho';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.WareHouseID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên kho';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.WareHouseName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.VoucherTypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.VoucherTypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nghiệp vụ';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.BusinessName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại chứng từ';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.VoucherTypeName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thực đơn tổng';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.VoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thực đơn ngày';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.MenuDateVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu kê chợ';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.MarketVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu điều tra dinh dưỡng';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.InvestigateVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tính tiền chợ';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.MarketCostVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tiếp phẩm ba bước';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.ThreeStepSuppliesVoucherNo', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hồ sơ sức khỏe';
EXEC ERP9AddLanguage @ModuleID, 'NMF0001.HealthVoucherNo', @FormID, @LanguageValue, @Language;