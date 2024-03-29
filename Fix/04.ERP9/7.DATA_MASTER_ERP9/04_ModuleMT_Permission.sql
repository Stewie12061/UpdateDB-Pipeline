-- CREATE BY Nguyễn Đức Quý ON 15/01/2014
-- Thêm dữ liệu vào bảng Master

DECLARE
	@ModuleID VARCHAR(50), --Tên module ví dụ ASOFTMT
	@ScreenID VARCHAR(50), -- Mã màn hình ví dụ MTF1000
	@ScreenName NVARCHAR(MAX), -- Tên màn hình ví dụ Khóa học
	@ScreenNameE NVARCHAR(MAX), -- Tên tiếng Anh màn hình 
	@ScreenType TINYINT -- Loại màn hình ví dụ loại 1 - màn hình truy vấn

SET @ModuleID = 'ASOFTMT'
------------------------------------------------ Thiết lập --------------------------------------------------------
SET @ScreenType = 4

SET @ScreenID = N'MTFXXXX'
SET @ScreenName = N'Mở số kỳ kế toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF0010'
SET @ScreenName = N'Hệ thống'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF0020'
SET @ScreenName = N'Thiết lập hệ thống'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF0030'
SET @ScreenName = N'Chọn kỳ kế toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF0040'
SET @ScreenName = N'Khóa sổ kỳ kế toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF0080'
SET @ScreenName = N'Chọn đối tượng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF0090'
SET @ScreenName = N'Thiết lập phân quyền chức năng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

------------------------------------------------ Danh mục --------------------------------------------------------
SET @ScreenType = 2

SET @ScreenID = N'MTF1000'
SET @ScreenName = N'Khóa học'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF1010'
SET @ScreenName = N'Chương trình đào tạo'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF1020'
SET @ScreenName = N'Giờ học'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF1030'
SET @ScreenName = N'Lý do thôi học'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF1040'
SET @ScreenName = N'Lớp học'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF2000'
SET @ScreenName = N'Quản lý học viên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF2010'
SET @ScreenName = N'Quá trình học tập'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF2020'
SET @ScreenName = N'Thôi học'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

------------------------------------------------ Cập nhật --------------------------------------------------------
SET @ScreenType = 3

SET @ScreenID = N'MTF1002'
SET @ScreenName = N'Xem chi tiết khóa học'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF1012'
SET @ScreenName = N'Xem chi tiết chương trình đào tạo'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF1022'
SET @ScreenName = N'Xem chi tiết giờ học'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF1032'
SET @ScreenName = N'Xem chi tiết lý do thôi học'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF1042'
SET @ScreenName = N'Xem chi tiết lớp học'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF2002'
SET @ScreenName = N'Xem chi tiết học viên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF2012'
SET @ScreenName = N'Xem chi tiết quá trình học tập'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF2022'
SET @ScreenName = N'Xem chi tiết thông tin thôi học'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

------------------------------------------------ Báo cáo --------------------------------------------------------
SET @ScreenType = 1

SET @ScreenID = N'MTF0070'
SET @ScreenName = N'Báo cáo biểu đồ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MTF0060'
SET @ScreenName = N'Báo cáo'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
			
SET @ScreenID = N'MTF0061'
SET @ScreenName = N'Báo cáo'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
