
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2060 - DRM
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
SET @FormID = 'DRF2060';

SET @LanguageValue = N'Gửi công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.DRF2060Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.FromDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.ToDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.FromPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.ToPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.DebtorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.DebtorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình trạng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.ContractStatusID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày đóng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.CloseDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.SendID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.SendEmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày gửi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.SendDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.DispatchTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.CustomerName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trưởng nhóm xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.TeamLeaderConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý xác nhận';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.ManagerConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng T.Tin đã gửi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.InfoRoomConfirm' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày đóng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.CloseDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.DebtGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.ManagerStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Trưởng nhóm';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.TeamLeaderStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'In công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.DispathStatus' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.SuggestPersonID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người đề nghị';
EXEC ERP9AddLanguage @ModuleID, 'DRF2060.SuggestPersonName' , @FormID, @LanguageValue, @Language;