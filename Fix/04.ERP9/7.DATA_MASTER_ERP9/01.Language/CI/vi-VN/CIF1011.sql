------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1011
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
SET @FormID = 'CIF1011';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cập nhật tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.DivisionName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mã tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.TeamID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.TeamName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.Notes' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Ghi chú 1' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.Notes01' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Không hiển thị' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.Disabled' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Phòng ban' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên phòng ban' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.DepartmentName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tk chi phí lương' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.AccountID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên tk chi phí lương' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.AccountName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Chi nhánh' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.BranchID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Người liên hệ' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.ContactPerson' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Gắn vào sơ đồ tổ chức' ;
EXEC ERP9AddLanguage @ModuleID, 'CIF1011.IsOrganizationDiagram' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;