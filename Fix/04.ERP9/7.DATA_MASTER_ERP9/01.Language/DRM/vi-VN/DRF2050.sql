
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2050 - DRM
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
SET @FormID = 'DRF2050';

SET @LanguageValue = N'Đóng hồ sơ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.DRF2050Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.FromDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.ToDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.FromPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.ToPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.DebtorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.DebtorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.ContractStatusID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày đóng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.CloseDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.SuggestID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.SuggestEmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.SuggestDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.CustomerName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trưởng nhóm xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.TeamLeaderConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.ManagerConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng thông tin xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.InfoRoomConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày đóng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.CloseDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.DebtorGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.ManagerStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trưởng nhóm';
EXEC ERP9AddLanguage @ModuleID, 'DRF2050.TeamLeaderStatus' , @FormID, @LanguageValue, @Language;
