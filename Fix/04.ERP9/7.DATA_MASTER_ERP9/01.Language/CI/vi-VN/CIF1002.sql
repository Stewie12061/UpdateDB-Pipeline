------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1000 
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
SET @FormID = 'CIF1002';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Xem chi tiết phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.DivisionName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.DepartmentID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N' Tên phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'TK Chi phí lương';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.AccountID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tk chi phí lương';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.AccountName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.Disabled' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.IsCommon' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sửa';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.LastModifyDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người sửa';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.LastModifyUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người liên hệ';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.ContactPerson' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Gắn vào sơ đồ tổ chức';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.IsOrganizationDiagram' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tk chi phí lương quản lý';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.ManagerExpAccountName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tk phải trả';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.PayableAccountName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tk thuế TNCN';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.PITAccountName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.CIF1002Group01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.CIF1002Group02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chức năng hệ thống';
EXEC ERP9AddLanguage @ModuleID, 'CIF1002.SystemFunctionName' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;