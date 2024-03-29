
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2000 - DRM
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
SET @FormID = 'DRF2000';

SET @LanguageValue = N'Quản lý hồ sơ nợ thương mại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.DRF2000Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.FromDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.ToDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.FromPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.ToPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.DebtorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.DebtorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tiếp nhận hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.ContratReciveDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phường/xã';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.Ward' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận/huyện';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/thành';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.City' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.IsNew' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mới';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.New' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cũ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.Old' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.ContractGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hẹn làm việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.NextActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng gửi CV';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.DispathTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.PhoneNumber' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.NextActionAddress' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi tiếp theo 2';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.NextActionAddress2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi tiếp theo 3';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.NextActionAddress3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày nhận hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.ContractReceiveDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hành động gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.ActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hẹn làm việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.NextActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.NextActionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.AddressNotes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đường';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.Street' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Ngày thanh toán gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.NearPaidDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sử dụng PPTP NTD';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.IsNTDMethod' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền hẹn thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.NextPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'In công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2000.DispathStatus' , @FormID, @LanguageValue, @Language;


