﻿declare @FormID varchar(50)
declare @ModuleID varchar(50)
declare @Language varchar(50)
declare @LanguageValue nvarchar(500)
SET @ModuleID = '00'
SET @Language = 'Vi-VN'


SET @FormID = 'CMNF9003'
SET @LanguageValue = N'Chọn nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9003.Title' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9003.EmployeeID' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9003.EmployeeName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Tên phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9003.DepartmentName' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Địa chỉ';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9003.Address' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Số điện thoại';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9003.Tel' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9003.Email' , @FormID, @LanguageValue, @Language;
SET @LanguageValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'CMNF9003.Delete' , @FormID, @LanguageValue, @Language;