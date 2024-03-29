--# Update: Phương Thảo [30/03/2023] update  chỉnh vị trí phân quyền, 
--                                   bổ sung bảng tạm để đánh vị trí của màn hình theo file quản lí sản phẩm


-- Thêm dữ liệu vào bảng Master

DECLARE
	@ModuleID VARCHAR(50),
	@ScreenID VARCHAR(50),
	@ScreenName NVARCHAR(MAX),
	@ScreenNameE NVARCHAR(MAX),
	@ScreenType TINYINT

DECLARE	@OrderNo INT;

--- Tạo bảng thứ tự
CREATE TABLE #WM_ERP9_PERMISSIONS
--DROP TABLE #WM_ERP9_PERMISSIONS
(
	ScreenID VARCHAR(50),
	OrderNo INT DEFAULT(0)
)
INSERT INTO #WM_ERP9_PERMISSIONS
(ScreenID, OrderNo)
VALUES 
(N'WMF3000', 1),
(N'WMF3001', 2),
(N'WMF3002', 3),
(N'WMF3003', 4),
(N'WMF3005', 5),
(N'WMF3007', 6),
(N'WMF3006', 7),
(N'WMF3004', 8),
(N'WMF2260', 1),
(N'WMF2010', 2),
(N'WMF2270', 3),
(N'WMF2000', 4),
(N'WMF2005', 5),
(N'WMF2040', 6),
(N'WMF2020', 7),
(N'WMF2030', 8),
(N'WMF2230', 9),
(N'WMF2240', 10),
(N'WMF2250', 11),
(N'WMF1010', 12),
(N'WMF2280', 13),
(N'WMF2290', 14),
(N'WMF2300', 15),
(N'WMF2310', 16),
(N'WMF2320', 17),
(N'WMF2261', 1),
(N'WMF2011', 2),
(N'WMF2271', 3),
(N'WMF2003', 4),
(N'WMF2007', 5),
(N'WMF2041', 6),
(N'WMF2021', 7),
(N'WMF2031', 8),
(N'WMF2231', 9),
(N'WMF2243', 10),
(N'WMF2251', 11),
(N'WMF1011', 12),
(N'WMF2222', 13),
(N'WMF2241', 14),
(N'WMF0003', 15),
(N'WMF2281', 16),
(N'WMF2291', 17),
(N'WMF2301', 18),
(N'WMF2311', 19),
(N'WMF2321', 20),
(N'WMF2262', 1),
(N'WMF2012', 2),
(N'WMF2272', 3),
(N'WMF2001', 4),
(N'WMF2006', 5),
(N'WMF2042', 6),
(N'WMF2022', 7),
(N'WMF2032', 8),
(N'WMF2232', 9),
(N'WMF2242', 10),
(N'WMF2252', 11),
(N'WMF1012', 12),
(N'WMF2292', 13),
(N'WMF2302', 14),
(N'WMF2282', 15),
(N'WMF2322', 16),
(N'WMF2312', 17),
(N'WMF0000', 1),
(N'WMD0000', 2),
(N'WMD0001', 3),
(N'WMD0003', 4),
(N'WMD0002', 5)

SET @ModuleID = N'ASOFTWM'
------------------------------------------------ Thiết lập --------------------------------------------------------
SET @ScreenType = 4
SET @ScreenID = N'WMF2002'
SET @ScreenName = N'Chọn hợp đồng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 4
SET @ScreenID = N'WMF2008'
SET @ScreenName = N'Chọn mặt hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 4
SET @ScreenID = N'WMF0001'
SET @ScreenName = N'Thiết lập cấp quản lý theo vị trí'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 4
SET @ScreenID = N'CMNF9004'
SET @ScreenName = N'Chọn đối tượng'
SET @ScreenNameE = N'Chọn đối tượng'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenType = 4
SET @ScreenID = N'CMNF9003'
SET @ScreenName = N'Chọn Nhân Viên'
SET @ScreenNameE = N'Chọn Nhân Viên'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenType = 4
SET @ScreenID = N'WMF2024'
SET @ScreenName = N'Kế thừa đơn hàng mua'
SET @ScreenNameE = N'Kế thừa đơn hàng mua'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenType = 4
SET @ScreenID = N'WMF2025'
SET @ScreenName = N'Kế thừa phiếu VCNB'
SET @ScreenNameE = N'Kế thừa phiếu VCNB'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenType = 4
SET @ScreenID = N'WMF2029'
SET @ScreenName = N'Kế thừa phiếu yêu cầu xuất kho'
SET @ScreenNameE = N'Kế thừa phiếu yêu cầu xuất kho'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenType = 4
SET @ScreenID = N'WMF2221'
SET @ScreenName = N'Chọm mặt hàng'
SET @ScreenNameE = N'Chọm mặt hàng'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenType = 4
SET @ScreenID = N'WMF2253'
SET @ScreenName = N'Chọn phiếu kiểm kê'
SET @ScreenNameE = N'Chọn phiếu kiểm kê'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenType = 4
SET @ScreenID = N'WMF2043'
SET @ScreenName = N'Kế thừa phiếu yêu cầu chuyển kho'
SET @ScreenNameE = N'Kế thừa phiếu yêu cầu chuyển kho'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenType = 4
SET @ScreenID = N'WMF2009'
SET @ScreenName = N'Kế thừa phiếu bảo hành/sửa chữa'
SET @ScreenNameE = N'Kế thừa phiếu bảo hành/sửa chữa'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenType = 4
SET @ScreenID = N'WMF2294'
SET @ScreenName = N'Kế thừa đơn hàng mua'
SET @ScreenNameE = N'Kế thừa đơn hàng mua'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL
---------------------------------------------- Danh mục ------------------------------------------------------------
SET @ScreenType = 2

SET @ScreenID = N'WMF2000'
SET @ScreenName = N'Danh mục yêu cầu nhập kho'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2005'
SET @ScreenName = N'Danh mục yêu cầu xuất kho'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF1010'
SET @ScreenName = N'Danh mục vị trí kho'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2010'
SET @ScreenName = N'Danh mục số dư tồn kho'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2020'
SET @ScreenName = N'Danh mục nhập kho'
SET @ScreenNameE = N'Danh mục nhập kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2030'
SET @ScreenName = N'Danh mục xuất kho'
SET @ScreenNameE = N'Danh mục xuất kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2040'
SET @ScreenName = N'Danh mục yêu cầu chuyển kho'
SET @ScreenNameE = N'Danh mục yêu cầu chuyển kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2230'
SET @ScreenName = N'Danh mục chuyển kho'
SET @ScreenNameE = N'Danh mục chuyển kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2240'
SET @ScreenName = N'Danh mục kiểm kê kho'
SET @ScreenNameE = N'Danh mục kiểm kê kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2250'
SET @ScreenName = N'Danh mục điều chỉnh kho'
SET @ScreenNameE = N'Danh mục điều chỉnh kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2260'
SET @ScreenName = N'Số dư đầu hàng tồn kho'
SET @ScreenNameE = N'Số dư đầu hàng tồn kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2270'
SET @ScreenName = N'Kết chuyển số dư cuối kỳ'
SET @ScreenNameE = N'Kết chuyển số dư cuối kỳ'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2290'
SET @ScreenName = N'Xuất kho mã vạch'
SET @ScreenNameE = N'Xuất kho mã vạch'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2300'
SET @ScreenName = N'Chuyển kho mã vạch'
SET @ScreenNameE = N'Chuyển kho mã vạch'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2320'
SET @ScreenName = N'Phiếu lắp ráp'
SET @ScreenNameE = N'Phiếu lắp ráp'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2310'
SET @ScreenName = N'Phiếu tháo dỡ'
SET @ScreenNameE = N'Phiếu tháo dỡ'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2330'
SET @ScreenName = N'Định nghĩa tham số'
SET @ScreenNameE = N'Định nghĩa tham số'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

---------------------------------------------- Cập nhật ------------------------------------------------------------
SET @ScreenType = 3

SET @ScreenID = N'WMF2003'
SET @ScreenName = N'Cập nhật Yêu cầu nhập kho'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2007'
SET @ScreenName = N'Cập nhật Yêu cầu xuất kho'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF1011'
SET @ScreenName = N'Cập nhật vị trí kho'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2222'
SET @ScreenName = N'Chọn vị trí kho'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2011'
SET @ScreenName = N'Cập nhật số dư tồn kho'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2021'
SET @ScreenName = N'Cập nhật phiếu nhập kho'
SET @ScreenNameE = N'Cập nhật phiếu nhập kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2031'
SET @ScreenName = N'Cập nhật phiếu xuất kho'
SET @ScreenNameE = N'Cập nhật phiếu xuất kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2041'
SET @ScreenName = N'Cập nhật yêu cầu chuyển kho'
SET @ScreenNameE = N'Cập nhật phiếu vận chuyển nội bộ'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2231'
SET @ScreenName = N'Cập nhật chuyển kho'
SET @ScreenNameE = N'Cập nhật chuyển kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2241'
SET @ScreenName = N'Cập nhật kiểm kê hàng hóa'
SET @ScreenNameE = N'Cập nhật kiểm kê hàng hóa'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2243'
SET @ScreenName = N'Kiểm kê hàng hóa'
SET @ScreenNameE = N'Kiểm kê hàng hóa'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2251'
SET @ScreenName = N'Cập nhật điều chỉnh kho'
SET @ScreenNameE = N'Cập nhật điều chỉnh kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2261'
SET @ScreenName = N'Cập nhật số dư hàng tồn kho'
SET @ScreenNameE = N'Cập nhật số dư hàng tồn kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2271'
SET @ScreenName = N'Cập nhật kết chuyển số dư cuối kỳ'
SET @ScreenNameE = N'Cập nhật kết chuyển số dư cuối kỳ'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2291'
SET @ScreenName = N'Cập nhật xuất kho mã vạch'
SET @ScreenNameE = N'Cập nhật xuất kho mã vạch'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2301'
SET @ScreenName = N'Cập nhật chuyển kho mã vạch'
SET @ScreenNameE = N'Cập nhật chuyển kho mã vạch'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF0003'
SET @ScreenName = N'Tính giá xuất kho'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2321'
SET @ScreenName = N'Cập nhật phiếu lắp ráp'
SET @ScreenNameE = N'Cập nhật phiếu lắp ráp'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2311'
SET @ScreenName = N'Cập nhật phiếu tháo dỡ'
SET @ScreenNameE = N'Cập nhật phiếu tháo dỡ'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2331'
SET @ScreenName = N'Cập nhật định nghĩa tham số'
SET @ScreenNameE = N'Cập nhật định nghĩa tham số'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo


---------------------------------------------- Báo cáo ------------------------------------------------------------
SET @ScreenType = 1
SET @ScreenID = N'WMF3000'
SET @ScreenName = N'Báo cáo'
SET @ScreenNameE = N'Report'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF3001'
SET @ScreenName = N'Báo cáo quyết toán'
SET @ScreenNameE = N'Report'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF3002'
SET @ScreenName = N'Báo cáo tổng hợp nhập xuất tồn theo đối tượng'
SET @ScreenNameE = N'Report'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF3003'
SET @ScreenName = N'Báo cáo chi tiết nhập xuất tồn theo đối tượng'
SET @ScreenNameE = N'Report'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF3004'
SET @ScreenName = N'Báo cáo thống kê lỗi sản phẩm giao'
SET @ScreenNameE = N'Report'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -3, NULL, @OrderNo

SET @ScreenID = N'WMF3005'
SET @ScreenName = N'Báo cáo thông tin mặt hàng trong kho'
SET @ScreenNameE = N'Report'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF3006'
SET @ScreenName = N'Báo cáo nhập kho'
SET @ScreenNameE = N'Report'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -3, NULL, @OrderNo

SET @ScreenID = N'WMF3007'
SET @ScreenName = N'Báo cáo tồn kho theo nhà phân phối'
SET @ScreenNameE = N'Report'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF3008'
SET @ScreenName = N'Báo cáo nhật ký kiểm kê hàng hóa'
SET @ScreenNameE = N'Report'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'WMF3009'
SET @ScreenName = N'Báo cáo thẻ kho'
SET @ScreenNameE = N'Report'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'WMF3010'
SET @ScreenName = N'Báo cáo nhập xuất theo kho'
SET @ScreenNameE = N'Report'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL
---------------------------------------------- Xem chi tiết --------------------------------------------------------
SET @ScreenType = 5

SET @ScreenID = N'WMF2001'
SET @ScreenName = N'Xem thông tin Yêu cầu nhập kho'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2006'
SET @ScreenName = N'Xem thông tin Yêu cầu xuất kho'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF1012'
SET @ScreenName = N'Xem thông tin vị trí kho'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2012'
SET @ScreenName = N'Xem thông tin số dư hàng tồn kho'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2022'
SET @ScreenName = N'Xem thông tin chi tiết nhập kho'
SET @ScreenNameE = N'Xem thông tin chi tiết nhập kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2032'
SET @ScreenName = N'Xem thông tin chi tiết xuất kho'
SET @ScreenNameE = N'Xem thông tin chi tiết xuất kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2042'
SET @ScreenName = N'Xem thông tin yêu cầu chuyển kho'
SET @ScreenNameE = N'Xem thông tin yêu cầu chuyển kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2232'
SET @ScreenName = N'Xem chi tiết chuyển kho'
SET @ScreenNameE = N'Xem chi tiết chuyển kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2242'
SET @ScreenName = N'Xem chi tiết kiểm kê hàng hóa'
SET @ScreenNameE = N'Xem chi tiết kiểm kê hàng hóa'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2252'
SET @ScreenName = N'Xem chi tiết điều chỉnh kho'
SET @ScreenNameE = N'Xem chi tiết điều chỉnh kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2262'
SET @ScreenName = N'Xem chi tiết số dư hàng tồn kho'
SET @ScreenNameE = N'Xem chi tiết số dư hàng tồn kho'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2272'
SET @ScreenName = N'Xem chi tiết kết chuyển số dư cuối kỳ'
SET @ScreenNameE = N'Xem chi tiết kết chuyển số dư cuối kỳ'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2282'
SET @ScreenName = N'Xem chi tiết nhập kho mã vạch'
SET @ScreenNameE = N'Xem chi tiết nhập kho mã vạch'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1,  NULL, @OrderNo

SET @ScreenID = N'WMF2292'
SET @ScreenName = N'Xem chi tiết xuất kho mã vạch'
SET @ScreenNameE = N'Xem chi tiết xuất kho mã vạch'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2302'
SET @ScreenName = N'Xem chi tiết chuyển kho mã vạch'
SET @ScreenNameE = N'Xem chi tiết chuyển kho mã vạch'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMF2322'
SET @ScreenName = N'Xem chi tiết phiếu lắp ráp'
SET @ScreenNameE = N'Xem chi tiết phiếu lắp ráp'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo


SET @ScreenID = N'WMF2312'
SET @ScreenName = N'Xem chi tiết phiếu tháo dỡ'
SET @ScreenNameE = N'Xem chi tiết phiếu tháo dỡ'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

---------------------------------------------- Phân quyền màn hình DashBoard ------------------------------------
SET @ScreenType = 6

SET @ScreenID = N'WMF0000'
SET @ScreenName = N'Dashboard Kho hàng'
SET @ScreenNameE = N'Dashboard Kho hàng'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMD0000'
SET @ScreenName = N'Số liệu thống kê'
SET @ScreenNameE = N'Statics'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMD0001'
SET @ScreenName = N'Biểu đồ top tồn kho nhiều / lớn / lâu nhất'
SET @ScreenNameE = N'Top chart of most / large / longest inventory'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMD0002'
SET @ScreenName = N'Biểu đồ giá trị nhập/xuất/tồn kho theo nhóm hàng'
SET @ScreenNameE = N'Chart of import/export/inventory value by commodity group'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'WMD0003'
SET @ScreenName = N'Biểu đồ giá trị tồn kho theo kỳ'
SET @ScreenNameE = N'Chart of inventory value'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #WM_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

UPDATE AT1409 SET ModuleID = UPPER(ModuleID)
UPDATE AT1403 SET ModuleID = UPPER(ModuleID)
UPDATE AT1404 SET ModuleID = UPPER(ModuleID)