
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2020 - DRM
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
SET @FormID = 'DRF2020';

SET @LanguageValue = N'Xử lý hàng ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.DRF2020Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.FromDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.ToDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.FromPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.ToPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.ProcessingID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.ActionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đối tượng tác động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.ActionObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Kết quả';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.ResultID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hẹn làm viêc';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.NextActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.DebtorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày hành động';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.ActionDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.DebtorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổ quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hành động tiếp theo';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.NextActionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.ActionEmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xử lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.ActionEmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xử lý 2';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.ActionEmployeeName2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người xử lý 3';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.ActionEmployeeName3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gửi CV từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.SendFromDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2020.SendToDate' , @FormID, @LanguageValue, @Language;