declare @FormID varchar(50)
declare @ModuleID varchar(50)
declare @Language varchar(50)
declare @LanguageValue nvarchar(500)
SET @ModuleID = 'HRM'
SET @Language = 'vi-VN'

SET @FormID = 'HRMF2183'
SET @LanguageValue = N'Chọn nhân viên từ hợp đồng lao động';
EXEC ERP9AddLanguage @ModuleID, 'HRMF2183.Title' , @FormID, @LanguageValue, @Language;

SET @FormID = 'HRMF2183'
SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'HRMF2183.DivisionID' , @FormID, @LanguageValue, @Language;

SET @FormID = 'HRMF2183'
SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'HRMF2183.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @FormID = 'HRMF2183'
SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'HRMF2183.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @FormID = 'HRMF2183'
SET @LanguageValue = N'Tên phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'HRMF2183.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @FormID = 'HRMF2183'
SET @LanguageValue = N'Loại hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'HRMF2183.ContractTypeID' , @FormID, @LanguageValue, @Language;

SET @FormID = 'HRMF2183'
SET @LanguageValue = N'Loại hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'HRMF2183.ContractTypeName' , @FormID, @LanguageValue, @Language;

SET @FormID = 'HRMF2183'
SET @LanguageValue = N'Số hợp đồng';
EXEC ERP9AddLanguage @ModuleID, 'HRMF2183.ContractNo' , @FormID, @LanguageValue, @Language;

SET @FormID = 'HRMF2183'
SET @LanguageValue = N'Làm việc từ ngày';
EXEC ERP9AddLanguage @ModuleID, 'HRMF2183.WorkDate' , @FormID, @LanguageValue, @Language;

SET @FormID = 'HRMF2183'
SET @LanguageValue = N'Làm việc đến ngày';
EXEC ERP9AddLanguage @ModuleID, 'HRMF2183.WorkEndDate' , @FormID, @LanguageValue, @Language;


