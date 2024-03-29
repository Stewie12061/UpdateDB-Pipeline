-----------------------------------------------------------------------------------------------------
-- Script tạo message - MT
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(5),
@FormID VARCHAR(50),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000),
@LanguageCustomValue NVARCHAR(4000),

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
@Finished BIT

/*
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'vi-VN'; 
SET @ModuleID = 'MT';
SET @FormID = 'MTF1040';

SET @LanguageValue = N'Ngày bắt đầu';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.BeginDate' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Chi nhánh';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.BranchID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Mã lớp học';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.ClassID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tên lớp học';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.ClassName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Học kỳ';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.CourseID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Khóa học';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.CourseName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Không sử dụng';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.Disabled' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Đơn vị';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.DivisionID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Ngày kết thúc';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.EndDate' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'CT Đào tạo';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.LevelID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'CT Đào tạo';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.LevelName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Danh mục lớp học';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.MTF1040Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Cập nhật lớp học';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.MTF1041Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Chi tiết lớp học';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.MTF1042TimeInfo' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Xem chi tiết lớp học';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.MTF1042Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Cập nhật giáo viên';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.MTF1043Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Ghi chú';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.Notes' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Phân loại';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.S' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Giờ học';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.SchoolTimeID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Giờ học';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.SchoolTimeName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'STT';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.STT' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Mã Giáo viên';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.TeacherID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Giáo viên';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF1040.TeacherName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;
