------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF1000 - S
--Người tạo: Hồ Hoàng Tú-09/10/2014
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
SET @ModuleID = 'S';
SET @FormID = 'SF1000';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Danh mục người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.DivisionID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.DepartmentID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tổ nhóm';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.TeamID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mã người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.EmployeeID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.FullName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.Address' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Số điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.Tel' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.Email' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Máy nhánh';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.Fax' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.Disabled' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.IsCommon' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Khóa';
EXEC ERP9AddLanguage @ModuleID, 'SF1000.IsLock' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;