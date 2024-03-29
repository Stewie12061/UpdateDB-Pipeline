
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2004- OO
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
SET @ModuleID = 'HRM';
SET @FormID = 'OOF2004';

SET @LanguageValue = N'Thông tin nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2004.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2004.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'OOF2004.EmployeeName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'OOF2004.DepartmentName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chức vụ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2004.DutyName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời gian nghỉ việc';
EXEC ERP9AddLanguage @ModuleID, 'OOF2004.ConvertLeaveDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lý do nghỉ';
EXEC ERP9AddLanguage @ModuleID, 'OOF2004.Reason' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử đánh giá năng lực';
EXEC ERP9AddLanguage @ModuleID, 'OOF2004.btnHistory' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên Nhân viên vi phạm';
EXEC ERP9AddLanguage @ModuleID, 'OOF2004.UserBlackList' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lỗi vi phạm';
EXEC ERP9AddLanguage @ModuleID, 'OOF2004.DetailBlackList' , @FormID, @LanguageValue, @Language;