
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF2080 - DRM
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
SET @FormID = 'DRF2080';

SET @LanguageValue = N'Công văn đã in';
EXEC ERP9AddLanguage @ModuleID, 'DRF2080.DRF2080Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2080.FromDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'DRF2080.ToDateFilter' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'DRF2080.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2080.CustomerID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người gửi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2080.UserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người gửi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2080.UserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2080.DebtorID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên khách nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2080.DebtorName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2080.ContractNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhóm quản lý';
EXEC ERP9AddLanguage @ModuleID, 'DRF2080.TeamID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2080.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2080.SendNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày gửi';
EXEC ERP9AddLanguage @ModuleID, 'DRF2080.SendDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại công văn';
EXEC ERP9AddLanguage @ModuleID, 'DRF2080.DispatchTypeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khách hàng';
EXEC ERP9AddLanguage @ModuleID, 'DRF2080.CustomerName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân loại nợ';
EXEC ERP9AddLanguage @ModuleID, 'DRF2080.DebtGroupID' , @FormID, @LanguageValue, @Language;

