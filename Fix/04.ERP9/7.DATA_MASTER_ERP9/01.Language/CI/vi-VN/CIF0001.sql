------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF0001
-----------------------------------------------------------------------------------------------------
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
SET @ModuleID = 'CI';
SET @FormID = 'CIF0001';
------------------------------------------------------------------------------------------------------
--- Title
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thiết lập mã phân tích';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.CIF0001Title' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã phân tích hợp đồng mua';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.ContractAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích hợp đồng bán';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.SalesContractAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.DepartmentAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.TeamAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích dự án';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.ProjectAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích doanh thu';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.SalesAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích chi phí';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.CostAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích chi tiết chi phí';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.CostDetailAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích trường';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.SchoolAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích ngân sách';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.BudgetAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân tích cơ hội';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.OpportunityAnaTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lí giá';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.IsPriceControl' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lí số lượng';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.IsQuantityControl' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý mặt hàng theo quy cách';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.IsSpecificate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân quyền xem dữ liệu của người khác';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.IsPermissionView' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lí mặt hàng theo seri';
EXEC ERP9AddLanguage @ModuleID, 'CIF0001.IsAutoSeri' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;