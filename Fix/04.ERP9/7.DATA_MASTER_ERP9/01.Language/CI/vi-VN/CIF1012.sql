------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1012
--Người tạo: Hồ Hoàng Tú-10/10/2014
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
SET @FormID = 'CIF1012';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Xem chi tiết tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.DivisionName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mã nhóm';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.TeamID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên nhóm';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.TeamName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mã phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.DepartmentName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'TK Chi phí lương';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.AccountID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'TK Chi phí lương';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.AccountName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.Notes' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Ghi chú 01';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.Notes01' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.Disabled' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.IsCommon' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.CreateUserID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.CreateDate' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.LastModifyDate' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.LastModifyUserID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thông tin tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.CIF1012Group01Title' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Thông tin hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.CIF1012Group02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.BranchID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chi nhánh';
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.AnaName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người liên hệ' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.ContactPerson' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Gắn vào sơ đồ tổ chức' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1012.IsOrganizationDiagram' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;