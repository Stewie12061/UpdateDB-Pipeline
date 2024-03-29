-- CREATE BY Nguyễn Đức Quý ON 14/11/2014
-- Thêm dữ liệu vào bảng Master

DECLARE
	@ModuleID VARCHAR(50),
	@ScreenID VARCHAR(50),
	@ScreenName NVARCHAR(MAX),
	@ScreenNameE NVARCHAR(MAX),
	@ScreenType TINYINT

SET @ModuleID = N'ASOFTDRM'
------------------------------------------------ Thiết lập --------------------------------------------------------
SET @ScreenType = 4

SET @ScreenID = N'DRF0000'
SET @ScreenName = N'DrashBoard'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRFXXXX'
SET @ScreenName = N'Mở số kỳ kế toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0020'
SET @ScreenName = N'Thiết lập hệ thống'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0030'
SET @ScreenName = N'Chọn kỳ kế toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0040'
SET @ScreenName = N'Khóa sổ kỳ kế toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0060'
SET @ScreenName = N'Thiết lập tỉ lệ phí thu hồi - khách hàng nhóm A'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0070'
SET @ScreenName = N'Thiết lập tỉ lệ phí thu hồi - khách hàng nhóm B'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0080'
SET @ScreenName = N'Thiết lập tỉ lệ phí thu hồi - khách hàng nhóm C'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0090'
SET @ScreenName = N'Thiết lập tỉ lệ phí thu hồi - khách hàng nhóm D'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0160'
SET @ScreenName = N'Thiết lập tỉ lệ phí thu hồi - khách hàng nhóm E'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0170'
SET @ScreenName = N'Thiết lập tỉ lệ phí thu hồi - khách hàng nhóm F'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0180'
SET @ScreenName = N'Thiết lập tỉ lệ phí thu hồi - khách hàng nhóm G'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0100'
SET @ScreenName = N'Thiết lập chỉ tiêu lợi nhuận'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0110'
SET @ScreenName = N'Thiết lập tỉ lệ thù lao nhóm'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0120'
SET @ScreenName = N'Thiết lập tỉ lệ phân bổ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0130'
SET @ScreenName = N'Phân quyền theo chức năng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0131'
SET @ScreenName = N'Phân quyền chi tiết cập nhật thông tin hồ sơ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0200'
SET @ScreenName = N'Thiết lập phí thu hồi so với mức thấp nhất'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0210'
SET @ScreenName = N'Chốt số liệu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0220'
SET @ScreenName = N'Thiết lập tỉ lệ phí thù lao mới'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2003'
SET @ScreenName = N'Import dữ liệu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2006'
SET @ScreenName = N'Chọn hợp đồng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2043'
SET @ScreenName = N'Kế thừa hồ sơ lương'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2051'
SET @ScreenName = N'Cập nhật đóng hồ sơ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2061'
SET @ScreenName = N'Cập nhật gửi công văn'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2062'
SET @ScreenName = N'Gửi công văn'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
------------------------------------------------ Danh mục --------------------------------------------------------
SET @ScreenType = 2

SET @ScreenID = N'DRF1000'
SET @ScreenName = N'Danh mục nhân viên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF1010'
SET @ScreenName = N'Danh mục khách hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF1020'
SET @ScreenName = N'Danh mục thông tin chung'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2000'
SET @ScreenName = N'Hồ sơ nợ thương mại'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2010'
SET @ScreenName = N'Hồ sơ nợ tiêu dùng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2020'
SET @ScreenName = N'Xử lý hàng ngày'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2030'
SET @ScreenName = N'Tình hình thanh toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2040'
SET @ScreenName = N'Hồ sơ lương'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2050'
SET @ScreenName = N'Đóng hồ sơ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2060'
SET @ScreenName = N'Gửi công văn'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2080'
SET @ScreenName = N'Công văn đã gửi'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
------------------------------------------------ Cập nhật --------------------------------------------------------
SET @ScreenType = 3

SET @ScreenID = N'DRF1001'
SET @ScreenName = N'Cập nhật nhân viên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF1011'
SET @ScreenName = N'Cập nhật khách hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF1021'
SET @ScreenName = N'Cập nhật thông tin chung'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2001'
SET @ScreenName = N'Cập nhật hồ sơ nợ thương mại'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2013'
SET @ScreenName = N'Đề nghị'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2011'
SET @ScreenName = N'Cập nhật hồ sợ nợ tiêu dùng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2021'
SET @ScreenName = N'Cập nhật xử lý hàng ngày'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2031'
SET @ScreenName = N'Cập nhật tình hình thanh toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2041'
SET @ScreenName = N'Cập nhật hồ sơ lương'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

------------------------------------------------ Báo cáo --------------------------------------------------------
SET @ScreenType = 1

SET @ScreenID = N'DRF0150'
SET @ScreenName = N'Danh sách báo cáo'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0150_NTM'
SET @ScreenName = N'Danh sách báo cáo nợ thương mại'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0150_NTD'
SET @ScreenName = N'Danh sách báo cáo nợ tiêu dùng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0140'
SET @ScreenName = N'In Báo cáo'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF0190'
SET @ScreenName = N'In báo cáo'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2004'
SET @ScreenName = N'In hồ sơ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

------------------------------------------------ Xem chi tiết --------------------------------------------------------
SET @ScreenType = 5

SET @ScreenID = N'DRF1002'
SET @ScreenName = N'Xem thông tin nhân viên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF1012'
SET @ScreenName = N'Xem thông tin khách hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF1022'
SET @ScreenName = N'Xem thông tin chung'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2002'
SET @ScreenName = N'Xem thông tin hồ sơ nợ thương mại'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2012'
SET @ScreenName = N'Xem thông tin hồ sơ nợ tiêu dùng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2022'
SET @ScreenName = N'Xem thông tin xử lý hàng ngày'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2032'
SET @ScreenName = N'Xem thông tin thanh toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'DRF2042'
SET @ScreenName = N'Xem thông tin hồ sơ lương'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE