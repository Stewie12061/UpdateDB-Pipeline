------------------------------------------------------------------------------------------------------
-- Fix Bổ sung phân quyền màn hình -- Module HRM
-- ScreenID: 1-Báo cáo; 2-Danh mục; 3-Nhập liệu; 4-Khác
------------------------------------------------------------------------------------------------------
-- Store Insert dữ liệu vào Table chuẩn
------------------------------------------------------------------------------------------------------
-- create by Quốc Tuấn Date 05/11/2014 
-- Thêm dữ liệu vào bảng Master

DECLARE @ModuleID AS NVARCHAR(50) = 'ASOFTS'


DECLARE
	@ScreenID VARCHAR(50),
	@ScreenName NVARCHAR(MAX),
	@ScreenNameE NVARCHAR(MAX),
	@ScreenType TINYINT

------------------------------------------------ Thiết lập --------------------------------------------------------
SET @ScreenType = 4

SET @ScreenID = N'AS0001'
SET @ScreenName = N'Hệ thống'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF0001'
SET @ScreenName = N'Phân quyền nhóm người dùng'
SET @ScreenNameE = N'Update data permission user other view'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF0050'
SET @ScreenName = N'Thiết lập xét duyệt'
SET @ScreenNameE = N'Approve Setting'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF0002'
SET @ScreenName = N'Cập nhật phân quyền dữ liệu'
SET @ScreenNameE = N'Update data permission user other view'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF0003'
SET @ScreenName = N'Thiết lập phân quyền dữ liệu '
SET @ScreenNameE = N'Data permission Setting'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF0004'
SET @ScreenName = N'Phân quyền dữ liệu '
SET @ScreenNameE = N'Data permission'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF0006'
SET @ScreenName = N'Phân quyền báo cáo'
SET @ScreenNameE = N'Report permission'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF0009'
SET @ScreenName = N'Phân quyền cảnh báo'
SET @ScreenNameE = N'Warning permission'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF1040'
SET @ScreenName = N'Xem thông tin lịch sử'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF1013'
SET @ScreenName = N'Thềm người dùng vào nhóm'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF1014'
SET @ScreenName = N'Thay đổi mật khẩu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF1015'
SET @ScreenName = N'Thêm đơn vị vào nhóm'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF1016'
SET @ScreenName = N'Thay đổi mật khẩu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF1052'
SET @ScreenName = N'Cập nhật vai trò'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF3017'
SET @ScreenName = N'Thiết lập xét duyệt'
SET @ScreenNameE = N'Approve Setting'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF2023'
SET @ScreenName = N'Chọn phiếu nghiệp vụ'
SET @ScreenNameE = N'Chọn phiếu nghiệp vụ'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF0033'
SET @ScreenName = N'Thiết lập lịch trình'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF2110'
SET @ScreenName = N'Thiết lập mail server'
SET @ScreenNameE = N'Thiết lập mail server'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'SF2123'
SET @ScreenName = N'Chọn email template'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

------------------------------------------------ Danh mục --------------------------------------------------------
SET @ScreenType = 2

SET @ScreenID = N'SF1000'
SET @ScreenName = N'Danh mục người dùng'
SET @ScreenNameE = N'Employee List'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF1010'
SET @ScreenName = N'Danh mục nhóm người dùng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF1020'
SET @ScreenName = N'Ngôn ngữ'
SET @ScreenNameE = N'Language'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF1030'
SET @ScreenName = N'Thông báo'
SET @ScreenNameE = N'Message'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF1050'
SET @ScreenName = N'Danh mục vai trò'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF2000'
SET @ScreenName = N'Duyệt'
SET @ScreenNameE = N'Approve'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF0030'
SET @ScreenName = N'Thiết lập thời gian làm việc'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF2010'
SET @ScreenName = N'Quản lý PipeLine'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF2020'
SET @ScreenName = N'Danh mục rules'
SET @ScreenNameE = N'Danh mục rules'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF0100'
SET @ScreenName = N'Danh mục Thiết lập dữ liệu ngầm'
SET @ScreenNameE = N'List of implicit data'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF2030'
SET @ScreenName = N'Xem dung lượng'
SET @ScreenNameE = N'Xem dung lượng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF2120'
SET @ScreenName = N'Danh mục email template'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'SF0012'
SET @ScreenName = N'Lịch sử truy cập'
SET @ScreenNameE = N'Login history'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

--Hoàng Long [28/09/2023] - Màn hình Xét duyệt đơn
SET @ScreenID = N'SF2050'
SET @ScreenName = N'Xét duyệt đơn'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

------------------------------------------------ Cập nhật --------------------------------------------------------
SET @ScreenType = 3

SET @ScreenID = N'SF1001'
SET @ScreenName = N'Cập nhật người dùng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF1011'
SET @ScreenName = N'Cập nhật nhóm người dùng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF1051'
SET @ScreenName = N'Cập nhật vai trò'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF0031'
SET @ScreenName = N'Cập nhật thiết lập thời gian làm việc'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF0010'
SET @ScreenName = N'Thông tin người dùng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF0080'
SET @ScreenName = N'Thiết lập dữ liệu mặc định màn hình'
SET @ScreenName = N'Thiết lập dữ liệu mặc định màn hình'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF0090'
SET @ScreenName = N'Cập nhật dữ liệu bàn giao công việc'
SET @ScreenName = N'Cập nhật dữ liệu bàn giao công việc'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF2011'
SET @ScreenName = N'Cập nhật PipeLine'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF2013'
SET @ScreenName = N'Cập nhật thực thi câu lệnh'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF2014'
SET @ScreenName = N'Cập nhật hành động'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF2015'
SET @ScreenName = N'Cập nhật thực thi API'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF2021'
SET @ScreenName = N'Cập nhật rules'
SET @ScreenNameE = N'Cập nhật rules'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF0110'
SET @ScreenName = N'Thiết lập ẩn-hiện menu'
SET @ScreenName = N'Thiết lập ẩn-hiện menu'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF0101'
SET @ScreenName = N'Cập nhật danh mục dữ liệu ngầm'
SET @ScreenNameE = N'Update implicit data'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF3018'
SET @ScreenName = N'Thiết lập xét duyệt'
SET @ScreenNameE = N'Approve Setting'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--Hoàng Long [28/09/2023] - Màn hình Duyệt đơn hàng loạt
SET @ScreenID = N'SF2051'
SET @ScreenName = N'Duyệt đơn hàng loạt'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--
SET @ScreenID = N'SF2101'
SET @ScreenName = N'Thiết lập biến môi trường'
SET @ScreenNameE = N'Environment Variable Setting'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF2111'
SET @ScreenName = N'Thiết lập phân hệ'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'SF9001'
SET @ScreenName = N'Hỗ trợ nhập liệu'
SET @ScreenNameE = N'Input Support'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF2121'
SET @ScreenName = N'Cập nhật email template'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'OOF0041'
SET @ScreenName = N'Thiết lập nhận thông báo'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

---------------------------------------------- Xem chi tiết --------------------------------------------------------
SET @ScreenType = 5

SET @ScreenID = N'SF1002'
SET @ScreenName = N'Xem chi tiết người dùng'
SET @ScreenNameE = N'Update Employee'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF1012'
SET @ScreenName = N'Cập nhật nhóm người dùng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF2012'
SET @ScreenName = N'Xem chi tiết PipeLine'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'OOF0032'
SET @ScreenName = N'Xem chi tiết thiết lập thời gian làm việc'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF2022'
SET @ScreenName = N'Chi tiết rules'
SET @ScreenNameE = N'Chi tiết rules'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF0102'
SET @ScreenName = N'Xem chi tiết danh mục dữ liệu ngầm'
SET @ScreenNameE = N'View implicit data detail'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SF2122'
SET @ScreenName = N'Xem chi tiết email template'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

------------------------------------------------ Báo cáo --------------------------------------------------------
SET @ScreenType = 1

---------------------------------------------- Phân quyền màn hình Workspace ------------------------------------
SET @ScreenType = 6

-- SET @ScreenID = N'SF0007'
-- SET @ScreenName = N'Màn hình Workspace'
-- SET @ScreenNameE = N'Workspace Screen'
-- EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL