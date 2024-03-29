-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ HF0393- OO
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
SET @ModuleID = 'EDM';
SET @FormID = 'EDMF0000';

SET @LanguageValue = N'Thiết lập hệ thống EDM';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin chung';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.Tab1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xét duyệt';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.Tab2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Xếp lớp';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.tabChild1', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phân công giáo viên'
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.tabChild2', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điều chuyển học sinh'
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.tabChild3', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số học viên tối thiểu';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.MinstudentQuantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số học viên tối thiểu';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.MinstudentQuantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số học viên tối đa';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.MaxStudentQuantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số giáo viên tối thiểu';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.MinTeacherQuantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số giáo viên tối đa';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.MaxTeacherQuantity', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hình đưa đón';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.TransportTypeAnalyst', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại hình thu giữ ngoài giờ';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.WorkOvertimeTypeAnalyst', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT thông tin tư vấn';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherConsultancy', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phụ huynh';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherObject', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã học sinh';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherStudent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT xếp lớp';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherInterstratify', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT phân công giáo viên';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherAssignedTeacher', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT điểm danh';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherRollcall', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT kết quả học tập';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherLearnningResult', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT đánh giá dự giờ';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherClassObservation', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT quyết định điều chuyển GV';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherTranferTeacher', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT quyết định nghỉ học';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherLeaveSchool', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT lịch học năm';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherScheduleYear', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT lịch học cơ sở';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherSchedule', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT tổng khung chương trình';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherCurriculum', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT chương trình theo tháng';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherCurriculumMonth', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT đăng ký dịch vụ';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherRegisterService', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT điều chuyển học sinh';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherAssignedStudent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT bảo lưu';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherReserve', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT dự thu học phí';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherTuition', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT quản lý tin tức';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherNews', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp duyệt';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.RollLevelXL', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp duyệt';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.RollLevelPCGV', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cấp duyệt';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.RollLevelDCHS', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.TypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.TypeName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã loại';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.ID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên loại';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.Description.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Loại';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.STypeID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.SName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.S.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân loại 1';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.SType01ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân loại 2';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.SType02ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân loại 3';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.SType03ID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân loại 1';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.SType01IDS', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân loại 2';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.SType02IDS', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã phân loại 3';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.SType03IDS', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phụ huynh';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.GroupParent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Học sinh';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.GroupStudent', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT Thay đổi mức đóng phí';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherFeeChange', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số CT Thiết lập mức đóng phí đầu năm';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.VoucherSetNewYear', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày hoàn trả tiền ăn trưa/xế';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.DayEatLunch', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày hoàn trả tiền ăn ngày';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.DayEat', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin cảnh báo';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.InforWarningGroup' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cảnh báo sắp đến ngày đóng phí';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.IsFeePay' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày';
EXEC ERP9AddLanguage @ModuleID, 'EDMF0000.DatePay' , @FormID, @LanguageValue, @Language;
