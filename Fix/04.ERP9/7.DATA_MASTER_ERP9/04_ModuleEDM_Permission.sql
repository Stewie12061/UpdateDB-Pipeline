-- Thêm dữ liệu vào bảng Master

DECLARE
	@ModuleID VARCHAR(50),
	@ScreenID VARCHAR(50),
	@ScreenName NVARCHAR(MAX),
	@ScreenNameE NVARCHAR(MAX),
	@ScreenType TINYINT

SET @ModuleID = N'ASOFTEDM'
------------------------------------------------ Thiết lập --------------------------------------------------------
SET @ScreenType = 4

SET @ScreenID = N'EDMF0000'
SET @ScreenName = N'Thiết lập hệ thống'
SET @ScreenNameE = N'System Setting'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF0001'
SET @ScreenName = N'Thiết lập khoản thu'
SET @ScreenNameE = N'System Setting'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1093'
SET @ScreenName = N'Chọn khối'
SET @ScreenNameE = N'Chosse Grade'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF9014'
SET @ScreenName = N'Chọn đầu mối'
SET @ScreenNameE = N'Choose clue'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2016'
SET @ScreenName = N'Kế thừa học sinh'
SET @ScreenNameE = N'Inherit student'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2023'
SET @ScreenName = N'Chọn học sinh'
SET @ScreenNameE = N'Choose student'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2024'
SET @ScreenName = N'Kế thừa xếp lớp'
SET @ScreenNameE = N'Inherit class sorting'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2043'
SET @ScreenName = N'Chọn xếp lớp'
SET @ScreenNameE = N'Choose class sorting'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2123'
SET @ScreenName = N'Kế thừa chương trình học tháng'
SET @ScreenNameE = N'Inherit Month Study Schedule'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2103'
SET @ScreenName = N'Kế thừa Thời khóa biểu năm học'
SET @ScreenNameE = N' '
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2073'
SET @ScreenName = N'Chọn giáo viên'
SET @ScreenNameE = N'Choose teacher'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2163'
SET @ScreenName = N'chọn biểu phí'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2003'
SET @ScreenName = N'Kế thừa điều chuyển học sinh'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2004'
SET @ScreenName = N'Chọn khuyến mãi'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF9003'
SET @ScreenName = N'Chọn nhân viên'
SET @ScreenNameE = N''
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'EDMF9004'
SET @ScreenName = N'Chọn đối tượng'
SET @ScreenNameE = N'Choose object'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, 91, NULL

---------------------------------------------- Danh mục ------------------------------------------------------------
SET @ScreenType = 2

SET @ScreenID = N'EDMF1000'
SET @ScreenName = N'Danh mục khối'
SET @ScreenNameE = N'Danh mục khối'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1010'
SET @ScreenName = N'Danh mục định mức'
SET @ScreenNameE = N'Danh mục định mức'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1020'
SET @ScreenName = N'Danh mục lớp'
SET @ScreenNameE = N'Danh mục lớp'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1030'
SET @ScreenName = N'Danh mục môn học'
SET @ScreenNameE = N'Danh mục môn học'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1040'
SET @ScreenName = N'Danh mục năm học'
SET @ScreenNameE = N'Danh mục năm học'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1050'
SET @ScreenName = N'Danh mục loại hình thu'
SET @ScreenNameE = N'Receipt Type'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1060'
SET @ScreenName = N'Danh mục loại hoạt động'
SET @ScreenNameE = N'Activity Type'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1080'
SET @ScreenName = N'Danh mục Feelling'
SET @ScreenNameE = N'Feeling'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1070'
SET @ScreenName = N'Danh mục điều tra tâm lý'
SET @ScreenNameE = N'Psychologize'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1090'
SET @ScreenName = N'Danh mục biểu phí'
SET @ScreenNameE = N'Fee'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1100'
SET @ScreenName = N'Danh mục khuyến mãi'
SET @ScreenNameE = N'Promotion'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1110'
SET @ScreenName = N'Danh mục đưa đón'
SET @ScreenNameE = N'Shuttle'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2000'
SET @ScreenName = N'Thông tin tư vấn học sinh'
SET @ScreenNameE = N'Consulting information'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2010'
SET @ScreenName = N'Hồ sơ học sinh'
SET @ScreenNameE = N'Student profile'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2020'
SET @ScreenName = N'Xếp lớp'
SET @ScreenNameE = N'Arrange class'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2030'
SET @ScreenName = N'Phân công giáo viên'
SET @ScreenNameE = N'Assign Teacher'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2130'
SET @ScreenName = N'Đăng ký dịch vụ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2140'
SET @ScreenName = N'Điều chuyển học sinh'
SET @ScreenNameE = N'Student Transfer'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2150'
SET @ScreenName = N'Bảo lưu học sinh'
SET @ScreenNameE = N'Student Reserve'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2170'
SET @ScreenName = N'Quản lý tin tức'
SET @ScreenNameE = N'Information Management'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2090'
SET @ScreenName = N'Lịch học năm'
SET @ScreenNameE = N'Study Schedule'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2100'
SET @ScreenName = N'Lịch học cơ sở'
SET @ScreenNameE = N'Junior Study Schedule'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2092'
SET @ScreenName = N'Xem thông tin lịch học năm'
SET @ScreenNameE = N'View Study Schedule'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2120'
SET @ScreenName = N'Chương trình học tháng'
SET @ScreenNameE = N'Month Study Schedule'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2040'
SET @ScreenName = N'Điểm danh'
SET @ScreenNameE = N'Attendance'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2050'
SET @ScreenName = N'Kết quả học tập'
SET @ScreenNameE = N'Learning result'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2060'
SET @ScreenName = N'Kết quả dự giờ'
SET @ScreenNameE = N'Class result'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2070'
SET @ScreenName = N'Điều chuyển giáo viên'
SET @ScreenNameE = N'Transfer of teachers'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2160'
SET @ScreenName = N'Dự thu học phí'
SET @ScreenNameE = N'Fee Forecast'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2080'
SET @ScreenName = N'Quyết định nghỉ học'
SET @ScreenNameE = N'Decision to leave school'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2100'
SET @ScreenName = N'Lịch học cơ sở'
SET @ScreenNameE = N'Basic Study Schedule'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2110'
SET @ScreenName = N'Tổng khung chương trình'
SET @ScreenNameE = N'General Progam Framework'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2180'
SET @ScreenName = N'Phản hồi ý kiến'
SET @ScreenNameE = N'FeedBack'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2190'
SET @ScreenName = N'Dặn thuốc'
SET @ScreenNameE = N'Medicine'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2200'
SET @ScreenName = N'Thay đổi mức đóng phí'
SET @ScreenNameE = N'Change Fee'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2210'
SET @ScreenName = N'Thiết lập phí đầu năm'
SET @ScreenNameE = N'Set New Year'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--- ĐÌnh Hòa - [05/04/2021] - Chuyển màn hình từ NM sang EDM
SET @ScreenID = N'NMF2060'
SET @ScreenName = N'Nghiệp vụ hồ sơ sức khỏe'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE,-1,'ERP9'

SET @ScreenID = N'NMF2010'
SET @ScreenName = N'Nghiệp vụ thực đơn ngày'
SET @ScreenNameE = N'Daily Menu'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE,-1,'ERP9'

---------------------------------------------- Cập nhật ------------------------------------------------------------
SET @ScreenType = 3

SET @ScreenID = N'EDMF1001'
SET @ScreenName = N'Cập nhật danh mục khối'
SET @ScreenNameE = N'Cập nhật danh mục khối'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1011'
SET @ScreenName = N'Cập nhật danh mục định mức'
SET @ScreenNameE = N'Cập nhật danh mục định mức'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1021'
SET @ScreenName = N'Cập nhật danh mục lớp'
SET @ScreenNameE = N'Cập nhật danh mục lớp'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1031'
SET @ScreenName = N'Cập nhật danh mục môn học'
SET @ScreenNameE = N'Cập nhật danh mục môn học'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1041'
SET @ScreenName = N'Cập nhật danh năm môn học'
SET @ScreenNameE = N'Cập nhật danh năm môn học'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1051'
SET @ScreenName = N'Cập nhật loại hình thu'
SET @ScreenNameE = N'Update Receipt Type'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1061'
SET @ScreenName = N'Cập nhật loại hoạt động'
SET @ScreenNameE = N'Update activity Type'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1081'
SET @ScreenName = N'Danh mục Feelling'
SET @ScreenNameE = N'Feeling'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1071'
SET @ScreenName = N'Cập nhật điều tra tâm lý'
SET @ScreenNameE = N'Psychologize'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1091'
SET @ScreenName = N'Cập nhật biểu phí'
SET @ScreenNameE = N'Fee'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1101'
SET @ScreenName = N'Cập nhật khuyến mãi'
SET @ScreenNameE = N'Update Promotion'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1111'
SET @ScreenName = N'Cập nhật đưa đón'
SET @ScreenNameE = N'Update Shuttle'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2001'
SET @ScreenName = N'Cập nhật thông tin tư vấn'
SET @ScreenNameE = N'Update consulting information'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2011'
SET @ScreenName = N'Cập nhật hồ sơ học sinh'
SET @ScreenNameE = N'Update consulting information'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2021'
SET @ScreenName = N'Cập nhật xếp lớp'
SET @ScreenNameE = N'Update arange class'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2031'
SET @ScreenName = N'Cập nhật phân công giáo viên'
SET @ScreenNameE = N'Update assign teacher'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2012'
SET @ScreenName = N'Cập nhật uỷ quyền đơn học sinh'
SET @ScreenNameE = N'Update consulting information'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2022'
SET @ScreenName = N'Xem thông tin xếp lớp'
SET @ScreenNameE = N'View arange class'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2032'
SET @ScreenName = N'Xem thông tin phân công giáo viên'
SET @ScreenNameE = N'View assign teacher'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2013'
SET @ScreenName = N'Cập nhật ủy quyền học sinh'
SET @ScreenNameE = N'Update student authority '
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2014'
SET @ScreenName = N'Cập nhật điều tra tâm lý học sinh'
SET @ScreenNameE = N'Updated student psychology survey'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2015'
SET @ScreenName = N'Cập nhật xác nhận hồ sơ học sinh'
SET @ScreenNameE = N'Update student profile confirmation '
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2017'
SET @ScreenName = N'Cập nhật trạng thái học sinh'
SET @ScreenNameE = N'Update student status'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2131'
SET @ScreenName = N'Cập nhật đăng ký dịch vụ'
SET @ScreenNameE = N'Update Service Register'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2141'
SET @ScreenName = N'Cập nhật điều chuyển học sinh'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2151'
SET @ScreenName = N'Cập nhật bảo lưu học sinh'
SET @ScreenNameE = N'Update Student Reverse'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2171'
SET @ScreenName = N'Cập nhật Quản lý tin tức'
SET @ScreenNameE = N'Update Information Management'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2091'
SET @ScreenName = N'Lịch học năm'
SET @ScreenNameE = N'Year Study Schedule'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2093'
SET @ScreenName = N'Cập nhật nội dung'
SET @ScreenNameE = N'Update Contents'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2101'
SET @ScreenName = N'Lịch học cơ sở'
SET @ScreenNameE = N'Junior Study Schedule'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2111'
SET @ScreenName = N'Cập nhật tổng khung chương trình'
SET @ScreenNameE = N'Updapte General Term'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2121'
SET @ScreenName = N'Cập nhật Chương trình học tháng'
SET @ScreenNameE = N'Update Month Study Schedule'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2071'
SET @ScreenName = N'Cập nhật điều chuyển giáo viên'
SET @ScreenNameE = N'Update transfer of teachers'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2081'
SET @ScreenName = N'Cập nhật quyết định nghỉ học'
SET @ScreenNameE = N'Update decision to leave school'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2161'
SET @ScreenName = N'Cập nhật dự thu học phí'
SET @ScreenNameE = N'Fee Forecast'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2083'
SET @ScreenName = N'Quyết toán'
SET @ScreenNameE = N'Quyết toán'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2101'
SET @ScreenName = N'Cập nhật lịch học cơ sở'
SET @ScreenNameE = N'Update Basic Study Schedult'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2111'
SET @ScreenName = N'Cập nhật tổng khung chương trình'
SET @ScreenNameE = N'Update General Program Framework'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2041'
SET @ScreenName = N'Cập nhật điểm danh'
SET @ScreenNameE = N'Update attendance'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2051'
SET @ScreenName = N'Cập nhật kết quả học tập'
SET @ScreenNameE = N'Update learning result'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2061'
SET @ScreenName = N'Cập nhật kết quả dự giờ'
SET @ScreenNameE = N'Update learning result'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2201'
SET @ScreenName = N'Cập nhật Thay đổi mức đóng phí'
SET @ScreenNameE = N'Change Fee'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2153'
SET @ScreenName = N'Chuyển nhượng'
SET @ScreenNameE = N' '
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2211'
SET @ScreenName = N'Thiết lập mức phí đầu năm'
SET @ScreenNameE = N' '
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


SET @ScreenID = N'EDMF2213'
SET @ScreenName = N'Thiết lập mức phí đầu năm hàng loạt'
SET @ScreenNameE = N' '
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--- ĐÌnh Hòa - [05/04/2021] - Chuyển màn hình từ NM sang EDM
SET @ScreenID = N'NMF2061'
SET @ScreenName = N'Cập nhật hồ sơ sức khỏe'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE,-1,'ERP9'

SET @ScreenID = N'NMF2011'
SET @ScreenName = N'Cập nhật thực đơn ngày'
SET @ScreenNameE = N'Update Daily Menu'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE,-1,'ERP9'

SET @ScreenID = N'NMF2013'
SET @ScreenName = N'Import thực đơn ngày'
SET @ScreenNameE = N'Import Daily Menu'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE,-1,'ERP9'

---------------------------------------------- Báo cáo ------------------------------------------------------------
SET @ScreenType = 1
SET @ScreenID = N'EDMF30001'
SET @ScreenName = N'Báo cáo tình hình hoạt động trong tháng'
SET @ScreenNameE = N'Activity In Month Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF30002'
SET @ScreenName = N'Báo cáo danh sách bé nghỉ học trong tháng'
SET @ScreenNameE = N'Absent Student Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF30003'
SET @ScreenName = N'Sổ điểm danh học viên'
SET @ScreenNameE = N'Attendance Student Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF30004'
SET @ScreenName = N'Báo cáo danh sách hoàn trả tiền ăn'
SET @ScreenNameE = N'Refund Money for Meals Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF30005'
SET @ScreenName = N'Báo cáo sĩ số hàng ngày'
SET @ScreenNameE = N'Daily Figures Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF30007'
SET @ScreenName = N'Báo cáo danh sách bé nghỉ học trong tháng'
SET @ScreenNameE = N'Absent Student Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF30008'
SET @ScreenName = N'Báo cáo số lượng bé tăng giảm tại các cơ sở'
SET @ScreenNameE = N'Student Quantity Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF30010'
SET @ScreenName = N'Báo cáo danh sách tham quan'
SET @ScreenNameE = N'Sightseeing List Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF30012'
SET @ScreenName = N'BÁO CÁO TÌNH HÌNH HOẠT ĐỘNG THÁNG'
SET @ScreenNameE = N' '
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


---------------------------------------------- Xem chi tiết --------------------------------------------------------
SET @ScreenType = 5

SET @ScreenID = N'EDMF1002'
SET @ScreenName = N'Xem danh mục khối'
SET @ScreenNameE = N'Xem danh mục khối'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1012'
SET @ScreenName = N'Xem danh mục định mức'
SET @ScreenNameE = N'Xem danh mục định mức'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1022'
SET @ScreenName = N'Xem danh mục lớp'
SET @ScreenNameE = N'Xem danh mục lớp'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1032'
SET @ScreenName = N'Xem danh mục môn học'
SET @ScreenNameE = N'Xem danh mục môn học'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1042'
SET @ScreenName = N'Xem danh mục năm học'
SET @ScreenNameE = N'Xem danh mục năm học'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1052'
SET @ScreenName = N'Xem chi tiết loại hình thu'
SET @ScreenNameE = N'View Receipt Type'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1062'
SET @ScreenName = N'Xem chi tiết loại hoạt động'
SET @ScreenNameE = N'View Activity Type'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1082'
SET @ScreenName = N'Danh mục Feelling'
SET @ScreenNameE = N'Feeling'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1072'
SET @ScreenName = N'Xem chi tiết điều tra tâm lý'
SET @ScreenNameE = N'Psychologize'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1092'
SET @ScreenName = N'Xem chi tiết biểu phí'
SET @ScreenNameE = N'Fee'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1102'
SET @ScreenName = N'Xem chi tiết khuyến mãi'
SET @ScreenNameE = N'Promotion Detail'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF1112'
SET @ScreenName = N'Chi tiết đưa đón'
SET @ScreenNameE = N'Shuttle Detail'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2002'
SET @ScreenName = N'Xem thông tin tư vấn học sinh'
SET @ScreenNameE = N'View consulting information'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2132'
SET @ScreenName = N'Xem thông tin đăng ký dịch vụ'
SET @ScreenNameE = N'View service register info'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2142'
SET @ScreenName = N'Xem thông tin điều chuyển học sinh'
SET @ScreenNameE = N'View student transfer info'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2152'
SET @ScreenName = N'Xem thông tin bảo lưu học sinh'
SET @ScreenNameE = N'View student reserve info'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2172'
SET @ScreenName = N'Xem thông tin Quản lý tin tức'
SET @ScreenNameE = N'View news management info'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2092'
SET @ScreenName = N'Xem thông tin lịch học năm'
SET @ScreenNameE = N'View year study schedule info'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2102'
SET @ScreenName = N'Xem thông tin lịch học cơ sở'
SET @ScreenNameE = N'View basic study schedule info'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2112'
SET @ScreenName = N'Xem thông tin tổng khung chương trình'
SET @ScreenNameE = N'View general program pattern info'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2122'
SET @ScreenName = N'Xem thông Chương trình học tháng'
SET @ScreenNameE = N'View month study pattern info'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2042'
SET @ScreenName = N'Xem thông tin điểm danh'
SET @ScreenNameE = N'View attendance info'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2052'
SET @ScreenName = N'Xem kết quả học tập'
SET @ScreenNameE = N'View learning result'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2062'
SET @ScreenName = N'Xem kết quả dự giờ'
SET @ScreenNameE = N'View class result'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2072'
SET @ScreenName = N'Xem điều chuyển giáo viên'
SET @ScreenNameE = N'View transfer of teachers'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2082'
SET @ScreenName = N'Xem quyết định nghỉ học'
SET @ScreenNameE = N'View decision to leave school'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2162'
SET @ScreenName = N'Xem thông tin dự thu học phí'
SET @ScreenNameE = N'Fee Forecast'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2182'
SET @ScreenName = N'Chi tiết Phản hồi ý kiến'
SET @ScreenNameE = N'FeedBack (Detail)'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2192'
SET @ScreenName = N'Chi tiết Dặn thuốc'
SET @ScreenNameE = N'Medicine (Detail)'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2082'
SET @ScreenName = N'Xem quyết định nghỉ học'
SET @ScreenNameE = N'View decision to leave school'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2102'
SET @ScreenName = N'Xem thông tin lịch học cơ sở'
SET @ScreenNameE = N'View Basic Study Schedule'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2112'
SET @ScreenName = N'Xem thông tin tổng khung chương trình'
SET @ScreenNameE = N'View General Program Framework'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2202'
SET @ScreenName = N'Chi tiết Thay đổi mức đóng phí'
SET @ScreenNameE = N'Change Fee'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'EDMF2212'
SET @ScreenName = N'Chi tiết thiết lập phí đầu năm'
SET @ScreenNameE = N'Set New Year'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--- ĐÌnh Hòa - [05/04/2021] - Chuyển màn hình từ NM sang EDM
SET @ScreenID = N'NMF2062'
SET @ScreenName = N'Xem thông hồ sơ sức khỏe'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE,-1,'ERP9'

SET @ScreenID = N'NMF2012'
SET @ScreenName = N'Xem chi tiết thực đơn ngày'
SET @ScreenNameE = N'View daily type'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE,-1,'ERP9'
