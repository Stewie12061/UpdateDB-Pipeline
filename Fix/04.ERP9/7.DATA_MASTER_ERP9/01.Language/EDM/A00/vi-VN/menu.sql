
/*
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/

DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@LanguageValue NVARCHAR(4000),
@Language VARCHAR(10),
@KeyID VARCHAR(50)
SET @ModuleID = '00';
SET @FormID = 'A00';
SET @Language = 'vi-VN' 

-----------MENU EDM --------------------

SET @LanguageValue  = N'ASOFT-EDM'
EXEC ERP9AddLanguage @ModuleID, 'A00.ASOFT-EDM',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Quản lý học viên'
EXEC ERP9AddLanguage @ModuleID, 'A00.ItemEDM',  @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khối';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Grade' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Định mức';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Quota' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lớp';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Class' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Môn học';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Subjects' , @FormID, @LanguageValue, @Language

SET @LanguageValue = N'Năm học';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_SchoolYear' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hình thu';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_RevenueType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hoạt động';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_ActivityType' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Feeling';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Feelling' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều tra tâm lý';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Psychologize' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biểu phí';
EXEC ERP9AddLanguage @ModuleID, 'A00.List_Fee' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu thông tin tư vấn';
EXEC ERP9AddLanguage @ModuleID, 'Phieu_thong_tin_tu_van' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hồ sơ học sinh';
EXEC ERP9AddLanguage @ModuleID, 'A00.Business_StudentRecords' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều chuyển học sinh';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_TranferStudent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đăng ký dịch vụ';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_RegisterService' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu dự thu học phí';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Estimate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý tin tức';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_NewsManagement', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phiếu dự thu học phí';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Estimate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý tin tức';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_NewsManagement' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thời khóa biểu năm học';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_DailySchedule' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch học năm';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_YearlySchedule' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng khung chương trình';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_Program' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chương trình học tháng';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_ProgramMonth' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Bảo lưu';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_StudentReserve' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều chuyển giáo viên';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_TransferTeacher' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quyết định nghỉ học';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_DecideLeaveSchool' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xếp lớp';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_ArrangeClass', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân công giáo viên';
EXEC ERP9AddLanguage @ModuleID, N'A00.Business_AssignTeacher', @FormID, @LanguageValue, @Language;


SET @KeyID = 'A00.Business_Feedback'
SET @LanguageValue = N'Phản hồi ý kiến';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_Medicine'
SET @LanguageValue = N'Dặn thuốc';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_YearlySchedule'
SET @LanguageValue = N'Lịch năm học';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_Nutrition'
SET @LanguageValue = N'Dinh dưỡng';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_Nutrition_HealthRecords'
SET @LanguageValue = N'Hồ sơ sức khỏe';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_Nutrition_DailyMenu'
SET @LanguageValue = N'Thực đơn hàng ngày';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.List_Promotion'
SET @LanguageValue = N'Khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.List_Shuttle'
SET @LanguageValue = N'Đưa đón';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_ChangeFee'
SET @LanguageValue = N'Thay đổi mức đóng phí';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.ChangeFee'
SET @LanguageValue = N'Thay đổi biểu phí';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.AssignAction'
SET @LanguageValue = N'Chuyển nhượng';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.SettleAction'
SET @LanguageValue = N'Quyết toán';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;

SET @KeyID = 'A00.Business_SetNewYear'
SET @LanguageValue = N'Thiết lập phí đầu năm';
EXEC ERP9AddLanguage @ModuleID, @KeyID , @FormID, @LanguageValue, @Language;
