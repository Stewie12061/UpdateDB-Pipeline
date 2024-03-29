
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2010 - DRM
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
SET @FormID = 'DRF2010';

SET @LanguageValue = N'Quản lý hồ sơ nợ tiêu dùng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.DRF2010Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.FromDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.ToDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.FromPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.ToPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.DebtorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.DebtorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tiếp nhận hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.ContratReciveDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phường/xã';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.Ward' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quận/huyện';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.District' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tỉnh/thành';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.City' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.IsNew' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mới';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.New' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cũ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.Old' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hẹn làm việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.NextActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hành động gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.ActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.ContractGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hẹn làm việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.NextActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng gửi CV';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.DispathTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.PhoneNumber' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.NextActionAddress' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi tiếp theo 2';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.NextActionAddress2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Địa chỉ đi tiếp theo 3';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.NextActionAddress3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày nhận hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.ContractReceiveDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.NearPaidDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hành động gần nhất';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.ActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hẹn làm việc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.NextActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.NextActionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.AddressNotes' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đường';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.Street' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền hẹn thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.NextPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'In công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.DispathStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mẫu hồ sơ - công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.Type' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'In hồ sơ - công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2010.DRF2004Title' , @FormID, @LanguageValue, @Language;
