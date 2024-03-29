------------------------------------------------------------------------------------------------------
-- Fix Bổ sung phân quyền màn hình -- Module M (Quản lý sản xuất)
-- ScreenID: 1-Báo cáo; 2-Danh mục; 3-Nhập liệu; 5-Xem chi tiết; 4-Khác
------------------------------------------------------------------------------------------------------
-- Store Insert dữ liệu vào Table chuẩn
------------------------------------------------------------------------------------------------------
-- Create by Đình Ly Date 20/11/2020
-- Update by Đức Tuyên Date 01/10/2022 thêm Báo cáo sản xuất hàng ngày
-- Thêm dữ liệu vào bảng Master

DECLARE
	@ModuleID VARCHAR(50),
	@ScreenID VARCHAR(50),
	@ScreenName NVARCHAR(MAX),
	@ScreenNameE NVARCHAR(MAX),
	@ScreenType TINYINT

SET @ModuleID = N'ASOFTM'

------------------------------------------------ Thiết lập --------------------------------------------------------
SET @ScreenType = 1

SET @ScreenID = N'MF0000'
SET @ScreenName = N'Thiết lập hệ thống'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'AF1000'
SET @ScreenName = N'Chọn tiêu thức'
SET @ScreenNameE = N'Chọn tiêu thức'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

---------------------------------------------- Danh mục ------------------------------------------------------------
SET @ScreenType = 2

SET @ScreenID = N'MF1810'
SET @ScreenName = N'Danh mục công đoạn sản xuất'
SET @ScreenNameE = N'Danh mục công đoạn sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF1820'
SET @ScreenName = N'Danh mục nguồn lực sản xuất'
SET @ScreenNameE = N'Danh mục nguồn lực sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF1830'
SET @ScreenName = N'Danh mục nguyên liệu thay thế'
SET @ScreenNameE = N'Danh mục nguyên liệu thay thế'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2110'
SET @ScreenName = N'Danh mục cấu trúc sản phẩm'
SET @ScreenNameE = N'Danh mục cấu trúc sản phẩm'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2120'
SET @ScreenName = N'Danh mục định mức NVL'
SET @ScreenNameE = N'Danh mục định mức NVL'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2130'
SET @ScreenName = N'Danh mục quy trình sản xuất'
SET @ScreenNameE = N'Danh mục quy trình sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2140'
SET @ScreenName = N'Danh mục kế hoạch sản xuất'
SET @ScreenNameE = N'Danh mục kế hoạch sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2150'
SET @ScreenName = N'Danh mục dự trù chi phí sản xuất'
SET @ScreenNameE = N'Danh mục dự trù chi phí sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2180'
SET @ScreenName = N'Danh mục yêu cầu đóng gói'
SET @ScreenNameE = N'Danh mục yêu cầu đóng gói'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2190'
SET @ScreenName = N'Danh mục đóng gói thành phẩm'
SET @ScreenNameE = N'Danh mục đóng gói thành phẩm'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2200'
SET @ScreenName = N'Danh mục sắp xếp cont'
SET @ScreenNameE = N'Danh mục sắp xếp cont'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2210'
SET @ScreenName = N'Danh mục thống kê kết quả sản xuất'
SET @ScreenNameE = N'Danh mục thống kê kết quả sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2160'
SET @ScreenName = N'Danh mục lệnh sản xuất'
SET @ScreenNameE = N'Danh mục lệnh sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2220'
SET @ScreenName = N'Danh mục đơn hàng sản xuất'
SET @ScreenNameE = N'Danh mục đơn hàng sản xuất'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

---------------------------------------------- Cập nhật ------------------------------------------------------------
SET @ScreenType = 3

SET @ScreenID = N'MF1811'
SET @ScreenName = N'Cập nhật công đoạn sản xuất'
SET @ScreenNameE = N'Cập nhật công đoạn sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF1821'
SET @ScreenName = N'Cập nhật nguồn lực sản xuất'
SET @ScreenNameE = N'Cập nhật nguồn lực sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF1831'
SET @ScreenName = N'Cập nhật nguyên liệu thay thế'
SET @ScreenNameE = N'Cập nhật nguyên liệu thay thế'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2111'
SET @ScreenName = N'Cập nhật cấu trúc sản phẩm'
SET @ScreenNameE = N'Cập nhật cấu trúc sản phẩm'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2121'
SET @ScreenName = N'Cập nhật định mức NVL'
SET @ScreenNameE = N'Cập nhật định mức NVL'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2131'
SET @ScreenName = N'Cập nhật quy trình sản xuất'
SET @ScreenNameE = N'Cập nhật quy trình sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2141'
SET @ScreenName = N'Cập nhật kế hoạch sản xuất'
SET @ScreenNameE = N'Cập nhật kế hoạch sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2151'
SET @ScreenName = N'Cập nhật dự trù chi phí sản xuất'
SET @ScreenNameE = N'Cập nhật dự trù chi phí sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2181'
SET @ScreenName = N'Cập nhật yêu cầu đóng gói'
SET @ScreenNameE = N'Cập nhật yêu cầu đóng gói'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2191'
SET @ScreenName = N'Cập nhật đóng gói sản phẩm'
SET @ScreenNameE = N'Cập nhật đóng gói sản phẩm'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2201'
SET @ScreenName = N'Cập nhật sắp xếp cont'
SET @ScreenNameE = N'Cập nhật sắp xếp cont'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2211'
SET @ScreenName = N'Cập nhật thống kê kết quả sản xuất'
SET @ScreenNameE = N'Cập nhật thống kê kết quả sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2161'
SET @ScreenName = N'Cập nhật lệnh sản xuất'
SET @ScreenNameE = N'Cập nhật lệnh sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2221'
SET @ScreenName = N'Cập nhật đơn hàng sản xuất'
SET @ScreenNameE = N'Cập nhật đơn hàng sản xuất'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

---------------------------------------------- Xem chi tiết ------------------------------------------------------------
SET @ScreenType = 5

SET @ScreenID = N'MF1812'
SET @ScreenName = N'Xem chi tiết công đoạn sản xuất'
SET @ScreenNameE = N'Xem chi tiết công đoạn sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF1822'
SET @ScreenName = N'Xem chi tiết nguồn lực sản xuất'
SET @ScreenNameE = N'Xem chi tiết nguồn lực sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF1832'
SET @ScreenName = N'Xem chi tiết nguyên liệu thay thế'
SET @ScreenNameE = N'Xem chi tiết nguyên liệu thay thế'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ModuleID = 'AsoftM'
SET @ScreenID = N'MF2112'
SET @ScreenName = N'Xem chi tiết cấu trúc sản phẩm'
SET @ScreenNameE = N'Xem chi tiết cấu trúc sản phẩm'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ModuleID = 'AsoftM'
SET @ScreenID = N'MF2122'
SET @ScreenName = N'Xem chi tiết định mức NVL'
SET @ScreenNameE = N'Xem chi tiết định mức NVL'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ModuleID = 'AsoftM'
SET @ScreenID = N'MF2132'
SET @ScreenName = N'Xem chi tiết quy trình sản xuất'
SET @ScreenNameE = N'Xem chi tiết quy trình sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2142'
SET @ScreenName = N'Xem chi tiết kế hoạch sản xuất'
SET @ScreenNameE = N'Xem chi tiết kế hoạch sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2152'
SET @ScreenName = N'Xem chi tiết dự trù chi phí sản xuất'
SET @ScreenNameE = N'Xem chi tiết dự trù chi phí sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2182'
SET @ScreenName = N'Xem chi tiết yêu cầu đóng gói'
SET @ScreenNameE = N'Xem chi tiết yêu cầu đóng gói'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2192'
SET @ScreenName = N'Xem chi tiết đóng gói sản phẩm'
SET @ScreenNameE = N'Xem chi tiết đóng gói sản phẩm'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2202'
SET @ScreenName = N'Xem chi tiết sắp xếp cont'
SET @ScreenNameE = N'Xem chi tiết sắp xếp cont'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2212'
SET @ScreenName = N'Xem chi tiết thống kê kết quả sản xuất'
SET @ScreenNameE = N'Xem chi tiết thống kê kết quả sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2162'
SET @ScreenName = N'Xem chi tiết lệnh sản xuất'
SET @ScreenNameE = N'Xem chi tiết lệnh sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2222'
SET @ScreenName = N'Xem chi tiết đơn hàng sản xuất'
SET @ScreenNameE = N'Xem chi tiết đơn hàng sản xuất'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

---------------------------------------------- Báo cáo ------------------------------------------------------------
SET @ScreenType = 1
SET @ScreenID = N'MF3000'
SET @ScreenName = N'Báo cáo'
SET @ScreenNameE = N'Report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF0203'
SET @ScreenName = N'Báo cáo thống kê thành phẩm sản xuất'
SET @ScreenNameE = N'Báo cáo thống kê thành phẩm sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF3001'
SET @ScreenName = N'Báo cáo theo dõi tiến độ mặt hàng theo công đoạn'
SET @ScreenNameE = N'Báo cáo theo dõi tiến độ mặt hàng theo công đoạn'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MR21401'
SET @ScreenName = N'Báo cáo tổng hợp kế hoạch sản xuất'
SET @ScreenNameE = N'Báo cáo tổng hợp kế hoạch sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MR21402'
SET @ScreenName = N'Báo cáo chi tiết kế hoạch sản xuất'
SET @ScreenNameE = N'Báo cáo chi tiết kế hoạch sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-- ĐÌnh Hòa - [27/05/2021] - Báo cáo tổng hợp tình hình thực hiện kế hoạch sản xuất
SET @ScreenID = N'MF3002'
SET @ScreenName = N'Báo cáo tổng hợp tình hình thực hiện kế hoạch sản xuất'
SET @ScreenNameE = N'Báo cáo tổng hợp tình hình thực hiện kế hoạch sản xuất'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

-- ĐÌnh Hòa - [03/06/2021] - Báo cáo chi tiết tình hình sản xuất Thành phẩm
SET @ScreenID = N'MF3003'
SET @ScreenName = N'Báo cáo chi tiết tình hình sản xuất thành phẩm'
SET @ScreenNameE = N'Báo cáo Chi tiết tình hình sản xuất thành phẩm'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

-- ĐÌnh Hòa - [10/06/2021] - Báo cáo chi tiết tình hình kế hoạch sản xuất
SET @ScreenID = N'MF3004'
SET @ScreenName = N'Báo cáo chi tiết tình hình thực hiện kế hoạch sản xuất'
SET @ScreenNameE = N'Báo cáo chi tiết tình hình thực hiện kế hoạch sản xuất'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

-- Đức Tuyên - [01/10/2022] - Báo cáo sản xuất hàng ngày
SET @ScreenID = N'MF3005'
SET @ScreenName = N'Báo cáo sản xuất hàng ngày'
SET @ScreenNameE = N'Báo cáo sản xuất hàng ngày'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

---------------------------------------------- Khác (Thiết lập) --------------------------------------------------------
SET @ScreenType = 4
SET @ScreenID = N'MF2123'
SET @ScreenName = N'Chọn cấu trúc sản phẩm'
SET @ScreenNameE = N'Chọn cấu trúc sản phẩm'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2124'
SET @ScreenName = N'Chọn BOM Version'
SET @ScreenNameE = N'Chọn BOM Version'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2133'
SET @ScreenName = N'Chọn danh mục công đoạn'
SET @ScreenNameE = N'Chọn danh mục công đoạn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2134'
SET @ScreenName = N'Chọn danh mục nguồn lực'
SET @ScreenNameE = N'Chọn danh mục nguồn lực'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SOF2085'
SET @ScreenName = N'Chọn phiếu thông tin sản xuất'
SET @ScreenNameE = N'Chọn phiếu thông tin sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SOF2086'
SET @ScreenName = N'Chọn màu in'
SET @ScreenNameE = N'Chọn màu in'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, 117, 'ERP9', NULL

SET @ScreenID = N'SOF2087'
SET @ScreenName = N'Chọn phiếu thông tin sản xuất'
SET @ScreenNameE = N'Chọn phiếu thông tin sản xuất'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, 117, 'ERP9', NULL

SET @ScreenID = N'MF2214'
SET @ScreenName = N'Kế thừa lệnh sản xuất'
SET @ScreenNameE = N'Kế thừa lệnh sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'AF1303'
SET @ScreenName = N'Chọn kho hàng'
SET @ScreenNameE = N'Chọn kho hàng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2143'
SET @ScreenName = N'Chọn phiếu kế hoạch sản xuất'
SET @ScreenNameE = N'Chọn phiếu kế hoạch sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2213'
SET @ScreenName = N'Chọn phiếu thống kê sản xuất'
SET @ScreenNameE = N'Chọn phiếu thống kê sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF2125'
SET @ScreenName = N'Chọn mặt hàng'
SET @ScreenNameE = N'Chọn mặt hàng'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

-- ĐÌnh Hòa - [19/05/2021] : Thêm màn hình chọn khách hàng
SET @ScreenID = N'MF2223'
SET @ScreenName = N'Chọn khác hàng'
SET @ScreenNameE = N'Chọn khác hàng'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'MF2224'
SET @ScreenName = N'Chọn nhân viên'
SET @ScreenNameE = N'Chọn nhân viên'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'MF2225'
SET @ScreenName = N'Chọn mặt hàng'
SET @ScreenNameE = N'Chọn mặt hàng'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

-- ĐÌnh Hòa - [01/06/2021] - Báo cáo tổng hợp tình hình thực hiện kế hoạch sản xuất
SET @ScreenID = N'MF2144'
SET @ScreenName = N'Chọn đơn hàng sản xuất'
SET @ScreenNameE = N'Chọn đơn hàng sản xuất'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

-- Đức Tuyên - [27/02/2023] - Chọn Bom Version tại nghiệp vụ Dự trù
SET @ScreenID = N'MF2153'
SET @ScreenName = N'Chọn BOM version'
SET @ScreenNameE = N'Chọn BOM version'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-- Nhật Quang - [16/03/2023] - Chọn in QR code
SET @ScreenID = N'MF2163'
SET @ScreenName = N'Chọn mẫu in'
SET @ScreenNameE = N'Chọn mẫu in'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL