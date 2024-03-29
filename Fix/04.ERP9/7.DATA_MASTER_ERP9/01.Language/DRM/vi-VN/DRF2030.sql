
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2030 - DRM
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
SET @FormID = 'DRF2030';

SET @LanguageValue = N'Tình hình thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.DRF2030Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.FromDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.ToDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.FromPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến kỳ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.ToPeriodFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.PaidID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.DebtID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.DebtorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.PaidDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.PaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khoản nợ quá hạn còn lại';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.UnPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.PaidNote' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.DebtGroupID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng thanh toán';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.TotalPaidAmount' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tổ quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2030.TeamID' , @FormID, @LanguageValue, @Language;




