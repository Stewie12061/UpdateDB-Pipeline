
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SOF2050- OO
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
SET @ModuleID = 'SO';
SET @FormID = 'SOF2050';

SET @LanguageValue = N'Danh sách hạn mức Quota theo nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'SOF2050.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'SOF2050.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Năm';
EXEC ERP9AddLanguage @ModuleID, 'SOF2050.Year' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'SOF2050.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'SOF2050.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức được cấp';
EXEC ERP9AddLanguage @ModuleID, 'SOF2050.TotalQuota' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'SOF2050.CreateDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'SOF2050.CreateUserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hạn mức còn nợ';
EXEC ERP9AddLanguage @ModuleID, 'SOF2050.Beginning' , @FormID, @LanguageValue, @Language;

