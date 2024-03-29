-- Thêm dữ liệu vào bảng Master

DECLARE
	@ModuleID VARCHAR(50),
	@ScreenID VARCHAR(50),
	@ScreenName NVARCHAR(MAX),
	@ScreenNameE NVARCHAR(MAX),
	@ScreenType TINYINT

SET @ModuleID = N'ASOFTT'
------------------------------------------------ Thiết lập --------------------------------------------------------
SET @ScreenType = 4
SET @ScreenType = 1
SET @ScreenID = N'AF1000'
SET @ScreenName = N'Chọn tiêu thức'
SET @ScreenNameE = N'Chọn tiêu thức'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
---------------------------------------------- Danh mục ------------------------------------------------------------
SET @ScreenType = 2

SET @ScreenID = N'AF9020'
SET @ScreenName = N'Danh mục đối tượng có công nợ quá hạn'
SET @ScreenNameE = N'Danh mục đối tượng có công nợ quá hạn'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'AF9030'
SET @ScreenName = N'Danh mục chi phí vượt chỉ tiêu ngân sách'
SET @ScreenNameE = N'Danh mục chi phí vượt chỉ tiêu ngân sách'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

--- Đề nghị thu/chi
SET @ScreenID = N'AF2010'
SET @ScreenName = N'Đề nghị thu/chi'
SET @ScreenNameE = N'Đề nghị thu/chi'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

--- Cước vận chuyển
-- Minh Dũng Created on 24/10/2023
SET @ScreenID = N'AF9040'
SET @ScreenName = N'Danh mục bảng giá cước vận chuyển'
SET @ScreenNameE = N'Danh mục bảng giá cước vận chuyển'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL
---------------------------------------------- Cập nhật ------------------------------------------------------------
SET @ScreenType = 3

--- Cập nhật đề nghị thu/chi 
SET @ScreenID = N'AF2011'
SET @ScreenName = N'Cập nhật đề nghị thu/chi'
SET @ScreenNameE = N'Cập nhật đề nghị thu/chi'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL


--- Cước vận chuyển
-- Minh Dũng Created on 24/10/2023
SET @ScreenID = N'AF9041'
SET @ScreenName = N'Cập nhật bảng giá cước vận chuyển'
SET @ScreenNameE = N'Cập nhật bảng giá cước vận chuyển'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

---------------------------------------------- Báo cáo ------------------------------------------------------------
SET @ScreenType = 1
SET @ScreenID = N'AF3000'
SET @ScreenName = N'Báo cáo'
SET @ScreenNameE = N'Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'AF0374'
SET @ScreenName = N'Báo cáo theo dõi công trình'
SET @ScreenNameE = N'Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'AF0376'
SET @ScreenName = N'Báo cáo công việc tháng'
SET @ScreenNameE = N'Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'AF0377'
SET @ScreenName = N'Báo cáo chi phí theo khoản mục'
SET @ScreenNameE = N'Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'AF0378'
SET @ScreenName = N'Báo cáo số lượng bán và doanh số bán'
SET @ScreenNameE = N'Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'AF3004'
SET @ScreenName = N'Báo cáo lưu chuyển tiền tệ'
SET @ScreenNameE = N'Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'AF3001'
SET @ScreenName = N'Bảng cân đối kế toán'
SET @ScreenNameE = N'Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'AF3008'
SET @ScreenName = N'Bảng cân đối số phát sinh'
SET @ScreenNameE = N'Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'AF3006'
SET @ScreenName = N'Sổ quỹ tiền mặt'
SET @ScreenNameE = N'Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'AF3005'
SET @ScreenName = N'Sổ tiền gửi ngân hàng'
SET @ScreenNameE = N'Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'AF3002'
SET @ScreenName = N'Báo cáo bán hàng theo mã phân tích'
SET @ScreenNameE = N'Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'AF3007'
SET @ScreenName = N'Báo cáo công nợ theo tuổi nợ'
SET @ScreenNameE = N'Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'AF3003'
SET @ScreenName = N'Báo cáo kết quả sản xuất kinh doanh'
SET @ScreenNameE = N'Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

------------------------------------------------------------------------------------------------------
--- Khác (Thiết lập)
------------------------------------------------------------------------------------------------------
SET @ScreenType = 4
SET @ScreenID = N'AF2013'
SET @ScreenName = N'Kế thừa - AF2013'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

---------------------------------------------- Xem chi tiết --------------------------------------------------------
SET @ScreenType = 5

SET @ScreenID = N'AF9022'
SET @ScreenName = N'Chi tiết công nợ của đối tượng'
SET @ScreenNameE = N'Chi tiết công nợ của đối tượng'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

--- Chi tiết đề nghị thu/chi
SET @ScreenID = N'AF2012'
SET @ScreenName = N'Xem chi tiết đề nghị thu/chi'
SET @ScreenNameE = N'Xem chi tiết đề nghị thu/chi'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL


--- Cước vận chuyển
-- Minh Dũng Created on 24/10/2023
SET @ScreenID = N'AF9042'
SET @ScreenName = N'Xem chi tiết bảng giá cước vận chuyển'
SET @ScreenNameE = N'Xem chi tiết bảng giá cước vận chuyển'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL
