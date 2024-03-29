------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1001 
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
SET @FormID = 'CIF1001';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Cập nhật phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.DivisionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tk Chi phí lương';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.AccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tk chi phí lương quản lý';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.ManagerExpAccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tk phải trả';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.PayableAccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tk thuế TNCN';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.PITAccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên tài khoản';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.AccountName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người liên hệ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.ContactPerson' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gắn vào sơ đồ tổ chức';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.IsOrganizationDiagram' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chức năng hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'CIF1001.SystemFunctionID' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;