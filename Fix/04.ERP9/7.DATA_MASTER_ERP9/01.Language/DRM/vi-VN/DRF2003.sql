
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2003 - DRM
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
SET @ModuleID = 'DRM';
SET @FormID = 'DRF2003';

SET @LanguageValue = N'Import hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.DRF2003Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.CustomerName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.DebtorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.DebtorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.ContractQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khu vực tính phí';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.FreePlace' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'CMND';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.IndentifyCardNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sinh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.Birthday' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nơi công tác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.DebtorCompany' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú công việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.JobNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sản phẩm, tài sản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.Asset' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin sản phẩm, tài sản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AssetInfo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoảng cấp vốn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.DebtAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số kỳ góp';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.DebtPeriod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày góp';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.DebtDay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày bắt đầu hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.ContractBeginDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày chốt số liệu';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.ContractEndDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoảng nợ quá hạn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.UnpaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.NearPaidDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hoạch toán lỗ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AccountingDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày trễ hạn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.OverDueDays' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.BankAccount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AddQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin khác';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.OtherNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử làm việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.WorkHistory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã địa chỉ 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AD01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AddressName1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã địa chỉ 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AD02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AddressName2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã địa chỉ 03';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AD03' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 03';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AddressName3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã địa chỉ 04';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AD04' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 04';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AddressName4' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã địa chỉ 05';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AD05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 05';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AddressName5' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã địa chỉ 06';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AD06' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 06';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AddressName6' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã địa chỉ 07';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AD07' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 07';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AddressName7' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã địa chỉ 08';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AD08' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 08';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AddressName8' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã địa chỉ 09';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AD09' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 09';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AddressName9' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã địa chỉ 10';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AD10' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ 10';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.AddressName10' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người nhận thư 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.MMSReceiver01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người nhận thư 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.MMSReceiver02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại di động 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.Mobiphone01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại di động 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.Mobiphone02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại nơi làm việc 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.Tel01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại nơi làm việc 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.Tel02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại nơi ở 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.Phone01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điện thoại nơi ở 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.Phone02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số fax 01';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.Fax01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số fax 02';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.Fax02' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email công ty';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.CompanyEmail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email nơi ở';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.HomeEmail' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày nhận hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.ContractReceiveDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.ContractTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân nhóm hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.ContractGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'% phí thu hồi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2003.RecoveryPercent' , @FormID, @LanguageValue, @Language;
