------------------------------------------------------------------------------------------------------
-- Fix Bổ sung phân quyền màn hình -- Module CI
-- ScreenID: 1-Báo cáo; 2-Danh mục; 3-Nhập liệu; 4-Khác
------------------------------------------------------------------------------------------------------
-- Store Insert dữ liệu vào Table chuẩn
------------------------------------------------------------------------------------------------------
-- create by Hoàng Tú  Date 18/11/2014 
-- Thêm dữ liệu vào bảng Master

DECLARE @ModuleID AS NVARCHAR(50) = 'ASOFTLM'


DECLARE
	@ScreenID VARCHAR(50),
	@ScreenName NVARCHAR(MAX),
	@ScreenNameE NVARCHAR(MAX),
	@ScreenType TINYINT

------------------------------------------------------------------------------------------------------
--- Báo cáo
------------------------------------------------------------------------------------------------------
SET @ScreenType = 1

SET @ScreenID = N'LMF3001'
SET @ScreenName = N'Báo cáo tổng hợp hạn mức'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF3002'
SET @ScreenName = N'Báo cáo số dư tín dụng và lãi vay phải trả'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF3003'
SET @ScreenName = N'Báo cáo tình hình vay vốn theo HTTD'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF3004'
SET @ScreenName = N'Báo cáo theo dõi lãi vay'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF3005'
SET @ScreenName = N'Báo cáo tình hình vay vốn'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF3006'
SET @ScreenName = N'Báo cáo vay vốn theo hợp đồng khế ước'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

------------------------------------------------------------------------------------------------------
--- Danh mục
------------------------------------------------------------------------------------------------------
SET @ScreenType =2

SET @ScreenID = N'LMF1000'
SET @ScreenName = N'Danh mục hình thức tin dụng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF1010'
SET @ScreenName = N'Danh sách hợp đồng hạn mức tin dụng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2000'
SET @ScreenName = N'Danh sách hợp đồng tin dụng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2010'
SET @ScreenName = N'Danh sách phong tỏa/ giải tỏa tài khoản ký quỹ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2020'
SET @ScreenName = N'Danh sách chứng từ giải ngân'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2023'
SET @ScreenName = N'Truy vấn lịch trả nợ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2030'
SET @ScreenName = N'Truy vấn thanh toán hợp đồng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2040'
SET @ScreenName = N'Truy vấn phiếu điều chỉnh'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2050'
SET @ScreenName = N'Truy vấn hợp đồng bảo lãnh'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF1020'
SET @ScreenName = N'Truy vấn tài sản thế chấp'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2060'
SET @ScreenName = N'Truy vấn giải chấp tài sản'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2070'
SET @ScreenName = N'Truy vấn gia hạn hợp đồng bảo lãnh'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF1030'
SET @ScreenName = N'Nguồn thanh toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
---------------------------------------------- Cập nhật ------------------------------------------------------------
SET @ScreenType = 3
SET @ScreenID = N'LMF0001'
SET @ScreenName = N'Thiết lập hệ thống'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'LMF1001'
SET @ScreenName = N'Cập nhật hình thức tin dụng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF1011'
SET @ScreenName = N'Cập nhật hợp đồng hạn mức tin dụng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2001'
SET @ScreenName = N'Cập nhật hợp đồng tin dụng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2011'
SET @ScreenName = N'Cập nhật phong tỏa/ giải tỏa tài khoản ký quỹ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2021'
SET @ScreenName = N'Cập nhật giải ngân hợp đồng tín dụng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2024'
SET @ScreenName = N'Cập nhật lịch trả nợ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2031'
SET @ScreenName = N'Cập nhật thanh toán hợp đồng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2041'
SET @ScreenName = N'Cập nhật phiếu điều chỉnh'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2051'
SET @ScreenName = N'Cập nhật hợp đồng bảo lãnh'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF1021'
SET @ScreenName = N'Cập nhật tài sản thế chấp'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2061'
SET @ScreenName = N'Cập nhật giải chấp tài sản'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2071'
SET @ScreenName = N'Cập nhật gia hạn hợp đồng bảo lãnh'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF1031'
SET @ScreenName = N'Cập nhật danh mục thanh toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
------------------------------------------------------------------------------------------------------
--- Khác (Thiết lập)
------------------------------------------------------------------------------------------------------
SET @ScreenType = 4
SET @ScreenID = N'LMF0000'
SET @ScreenName = N'Biểu đồ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF1014'
SET @ScreenName = N'Danh sách hình thức tín dụng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF4444'
SET @ScreenName = N'Chọn thông tin'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 4
SET @ScreenID = N'LMF9000'
SET @ScreenName = N'Kế thừa chứng từ kế toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 4
SET @ScreenID = N'LMF1023'
SET @ScreenName = N'Kế thừa tài sản thế chấp'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF9001'
SET @ScreenName = N'Chọn hợp đồng tín dụng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
------------------------------------------------------------------------------------------------------
--- Chi tiết
------------------------------------------------------------------------------------------------------
SET @ScreenType = 5
SET @ScreenID = N'LMF1002'
SET @ScreenName = N'Xem chi tiết hình thức tin dụng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF1012'
SET @ScreenName = N'Xem chi tiết hợp đồng định mức tin dụng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2002'
SET @ScreenName = N'Xem chi tiết hợp đồng tin dụng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2012'
SET @ScreenName = N'Xem chi tiết phong tỏa/ giải tỏa tài khoản ký quỹ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2022'
SET @ScreenName = N'Xem chi tiết chứng từ giải ngân'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2025'
SET @ScreenName = N'Xem chi tiết lịch trả nợ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2032'
SET @ScreenName = N'Xem chi tiết thanh toán hợp đồng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2042'
SET @ScreenName = N'Xem chi tiết phiếu điều chỉnh'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2052'
SET @ScreenName = N'Xem chi tiết hợp đồng bảo lãnh'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF1022'
SET @ScreenName = N'Xem chi tiết tài sản thế chấp'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'LMF0002'
SET @ScreenName = N'Định nghĩa tham số'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2062'
SET @ScreenName = N'Xem chi tiết giải chấp tài sản'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF2072'
SET @ScreenName = N'Xem chi tiết gia hạn hợp đồng bảo lãnh'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'LMF1032'
SET @ScreenName = N'Xem chi tiết danh mục nguồn thanh toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE