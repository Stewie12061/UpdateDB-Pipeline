--History:

--# Update: Phương Thảo [30/03/2023] update  chỉnh vị trí phân quyền, 
--                                   bổ sung bảng tạm để đánh vị trí của màn hình theo file quản lí sản phẩm

-- Thêm dữ liệu vào bảng Master

DECLARE
	@ModuleID VARCHAR(50),
	@ScreenID VARCHAR(50),
	@ScreenName NVARCHAR(MAX),
	@ScreenNameE NVARCHAR(MAX),
	@ScreenType TINYINT,
	@OrderNo INT

--- Tạo bảng thứ tự
CREATE TABLE #OO_ERP9_PERMISSIONS
--DROP TABLE #OO_ERP9_PERMISSIONS
(
	ScreenID VARCHAR(50),
	OrderNo INT DEFAULT(0)
)

--- Đổ dữ liệu
BEGIN

INSERT INTO #OO_ERP9_PERMISSIONS
(ScreenID, OrderNo)
VALUES
(N'OOF30001', 1),
(N'OOF30002', 2),
(N'OOF3028', 3),
(N'OOF3029', 4),
(N'OOF3034', 5),
(N'OOF3032', 6),
(N'OOF3033', 7),
(N'OOF30003', 8),
(N'OOF3030', 9),
(N'OOF3031', 10),
(N'OOF2090', 1),
(N'OOF2240', 2),
(N'OOF2250', 3),
(N'OOF2270', 4),
(N'OOF2280', 5),
(N'OOF2220', 6),
(N'OOF2230', 7),
(N'OOF2340', 8),
(N'OOF2290', 9),
(N'OOF2110', 10),
(N'OOF2100', 11),
(N'OOF2190', 12),
(N'OOF2210', 13),
(N'OOF2160', 14),
(N'OOF2130', 15),
(N'OOF2140', 16),
(N'OOF2150', 17),
(N'OOF1040', 18),
(N'OOF1060', 19),
(N'OOF1030', 20),
(N'OOF1020', 21),
(N'OOF1050', 22),
(N'OOF1080', 23),
(N'OOF1070', 24),
(N'OOF1090', 25),
(N'OOF1100', 26),
(N'OOF2260', 27),
(N'OOF2200', 28),
(N'OOF2091', 1),
(N'OOF2241', 2),
(N'OOF2251', 3),
(N'OOF2271', 4),
(N'OOF2221', 5),
(N'OOF2231', 6),
(N'OOF2341', 7),
(N'OOF2291', 8),
(N'OOF2111', 9),
(N'OOF2101', 10),
(N'OOF2191', 11),
(N'OOF2211', 12),
(N'OOF2161', 13),
(N'OOF2133', 14),
(N'OOF2141', 15),
(N'OOF1041', 16),
(N'OOF1061', 17),
(N'OOF1031', 18),
(N'OOF1021', 19),
(N'OOF1051', 20),
(N'OOF1081', 21),
(N'OOF1071', 22),
(N'OOF1091', 23),
(N'OOF1101', 24),
(N'OOF2261', 25),
(N'OOF2114', 26),
(N'OOF2301', 27),
(N'OOF3040', 28),
(N'OOF2092', 1),
(N'OOF2242', 2),
(N'OOF2252', 3),
(N'OOF2272', 4),
(N'OOF2222', 5),
(N'OOF2232', 6),
(N'OOF2342', 7),
(N'OOF2292', 8),
(N'OOF2112', 9),
(N'OOF2102', 10),
(N'OOF2192', 11),
(N'OOF2212', 12),
(N'OOF2162', 13),
(N'OOF2142', 14),
(N'OOF1042', 15),
(N'OOF1062', 16),
(N'OOF1032', 17),
(N'OOF1022', 18),
(N'OOF1052', 19),
(N'OOF1082', 20),
(N'OOF1072', 21),
(N'OOF1092', 22),
(N'OOF1102', 23),
(N'OOF2262', 24),
(N'OOF2093', 25),
(N'OOF0003', 1),
(N'OOD0022', 2),
(N'OOD0032', 3),
(N'OOD0023', 4),
(N'OOD0024', 5),
(N'OOD0025', 6),
(N'OOD0026', 7),
(N'OOD0027', 8),
(N'OOD0028', 9),
(N'OOD0031', 10),
(N'OOD0029', 11),
(N'OOD0030', 12),
(N'OOF0002', 13),
(N'OOD0014', 14),
(N'OOD0015', 15),
(N'OOD0016', 16),
(N'OOD0004', 17),
(N'OOD0017', 18),
(N'OOD0018', 19),
(N'OOD0019', 20),
(N'OOD0009', 21),
(N'OOD0003', 22),
(N'OOD0008', 23),
(N'OOD0001', 24),
(N'OOD0005', 25),
(N'OOD0002', 26),
(N'OOD0010', 27),
(N'OOF0050', 1),
(N'OOF0060', 2),
(N'CMNF9003',3),
(N'OOF2293', 4),
(N'OOF2115', 5),
(N'OOF2105', 6),
(N'OOF2193', 7),
(N'OOF2163', 8),
(N'OOF1063', 9),
(N'OOF2103', 10),
(N'OOF9003', 11)




END

SET @ModuleID = N'ASOFTOO'
------------------------------------------------ Thiết lập --------------------------------------------------------
SET @ScreenType = 4

SET @ScreenID = N'OOF0050'
SET @ScreenName = N'Thiết lập đánh giá công việc'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'OOF0060'
SET @ScreenName = N'Thiết lập hệ thống'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'OOF2103'
SET @ScreenName = N'Chọn phòng ban'
SET @ScreenNameE = N'Chọn phòng ban'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'OOF2105'
SET @ScreenName = N'Chọn dự án'
SET @ScreenNameE = N'Chọn dự án'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'OOF2115'
SET @ScreenName = N'Chọn công việc'
SET @ScreenNameE = N'Chọn công việc'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'OOF1063'
SET @ScreenName = N'Chọn mẫu công việc'
SET @ScreenNameE = N'Chọn mẫu công việc'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'OOF2163'
SET @ScreenName = N'Chọn vấn đề'
SET @ScreenNameE = N'Chọn vấn đề'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'OOF2193'
SET @ScreenName = N'Chọn Milestone'
SET @ScreenNameE = N'Chọn Milestone'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'OOF9003'
SET @ScreenName = N'Chọn Nhân Viên'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenType = 4
SET @ScreenID = N'CMNF9003'
SET @ScreenName = N'Chọn Nhân Viên'
SET @ScreenNameE = N'Chọn Nhân Viên'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- 27/10/2023 - [Thu Hà] - Bổ sung phân quyền màn hình Chọn chỉ tiêu/target
SET @ScreenType = 4
SET @ScreenID = N'OOF2293'
SET @ScreenName = N'Chọn chỉ tiêu/target'
SET @ScreenNameE = N'Chọn chỉ tiêu/target'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

---------------------------------------------- Danh mục ------------------------------------------------------------
SET @ScreenType = 2

----Workspace: OOF0000 về Dashboard 00, OOF0001 về Workspace SF0007
--SET @ScreenID = N'OOF0001'
--SET @ScreenName = N'Workspace'
--SET @ScreenNameE = N''
--SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
--EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

----Danh mục quy trình
SET @ScreenID = N'OOF1020'
SET @ScreenName = N'Danh mục quy trình'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

---- Danh mục bước
SET @ScreenID = N'OOF1030'
SET @ScreenName = N'Danh mục bước'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

---- Danh mục trạng thái
SET @ScreenID = N'OOF1040'
SET @ScreenName = N'Danh mục trạng thái theo nhiệm vụ'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

---- Danh mục mẫu dự án/nhóm công việc
SET @ScreenID = N'OOF1050'
SET @ScreenName = N'Danh mục mẫu dự án/nhóm công việc'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Danh mục mẫu công việc
SET @ScreenID = N'OOF1060'
SET @ScreenName = N'Danh mục mẫu công việc'
SET @ScreenNameE = N'Danh mục mẫu công việc'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Danh mục dùng chung
SET @ScreenID = N'OOF1070'
SET @ScreenName = N'Danh mục dùng chung'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Danh mục giờ công vi phạm
SET @ScreenID = N'OOF1080'
SET @ScreenName = N'Danh mục giờ công vi phạm'
SET @ScreenNameE = N'Danh mục giờ công vi phạm'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Danh mục Thiết bị/Phòng họp
SET @ScreenID = N'OOF1090'
SET @ScreenName = N'Danh mục Thiết bị/Phòng họp'
SET @ScreenNameE = N'Danh mục Thiết bị/Phòng họp'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

---- Workspace
--SET @ScreenID = N'SF0007'
--SET @ScreenName = N'Workspace'
--SET @ScreenNameE = N'Workspace'
--SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
--EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

---- Danh sách thông báo
SET @ScreenID = N'OOF2090'
SET @ScreenName = N'Danh sách thông báo'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

---- Danh mục dự án/nhóm công việc
SET @ScreenID = N'OOF2100'
SET @ScreenName = N'Danh mục dự án/nhóm công việc'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

---- Danh mục công việc
SET @ScreenID = N'OOF2110'
SET @ScreenName = N'Danh mục công việc'
SET @ScreenNameE = N'List task'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Danh mục đánh giá công việc
SET @ScreenID = N'OOF2130'
SET @ScreenName = N'Đánh giá công việc'
SET @ScreenNameE = N'Đánh giá công việc'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Danh Mục Định Mức Chi Phí Dự Án
SET @ScreenID = N'OOF2140'
SET @ScreenName = N'Danh Mục Định Mức Chi Phí Dự Án'
SET @ScreenNameE = N'Danh Mục Định Mức Chi Phí Dự Án'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Danh mục quản lý vấn đề
SET @ScreenID = N'OOF2160'
SET @ScreenName = N'Danh mục quản lý vấn đề'
SET @ScreenNameE = N'Danh mục quản lí vấn đề'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Đánh giá dự án
SET @ScreenID = N'OOF2150'
SET @ScreenName = N'Đánh giá dự án'
SET @ScreenNameE = N'Đánh giá dự án'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Danh mục quản lý Milestone
SET @ScreenID = N'OOF2190'
SET @ScreenName = N'Danh mục quản lý Milestone'
SET @ScreenNameE = N'Danh mục quản lý Milestone'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Danh mục quản lý Release
SET @ScreenID = N'OOF2210'
SET @ScreenName = N'Danh mục quản lý release'
SET @ScreenNameE = N'Danh mục quản lý release'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Danh mục mail đến
SET @ScreenID = N'OOF2220'
SET @ScreenName = N'Danh mục mail đến'
SET @ScreenNameE = N'Danh mục mail đến'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Danh mục mail đi
SET @ScreenID = N'OOF2230'
SET @ScreenName = N'Danh mục mail đi'
SET @ScreenNameE = N'Danh mục mail đi'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Danh mục quản lí thiết bị
SET @ScreenID = N'OOF2240'
SET @ScreenName = N'Danh mục đặt thiết bị'
SET @ScreenNameE = N'Danh mục đặt thiết bị'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Danh mục quản lí thư mục (Public)
SET @ScreenID = N'OOF2250'
SET @ScreenName = N'Danh mục thư mục (Public)'
SET @ScreenNameE = N'Danh mục thư mục (Public)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Danh mục quản lý file theo thư mục
SET @ScreenID = N'OOF2260'
SET @ScreenName = N'Danh mục file theo thư mục (Public)'
SET @ScreenNameE = N'Danh mục file theo thư mục (Public)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Danh mục quản lý file theo user
SET @ScreenID = N'OOF2270'
SET @ScreenName = N'Danh mục file cá nhân'
SET @ScreenNameE = N'Danh mục file cá nhân'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Thùng rác
SET @ScreenID = N'OOF2280'
SET @ScreenName = N'Thùng rác'
SET @ScreenNameE = N'Thùng rác'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Màn hình danh sách thông báo cảnh báo
SET @ScreenID = N'OOF2200'
SET @ScreenName = N'Danh sách thông báo/cảnh báo tổng hợp'
SET @ScreenNameE = N'Danh sách thông báo/cảnh báo tổng hợp'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Quản lý văn bản / Văn bản đến
SET @ScreenID = N'OOF2340'
SET @ScreenName = N'Quản lý văn bản'
SET @ScreenNameE = N'Quản lý văn bản'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

---- Danh mục tổ hợp
SET @ScreenID = N'OOF1100'
SET @ScreenName = N'Danh mục tổ hợp nhân viên'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

---- Danh mục chỉ tiêu/target
SET @ScreenID = N'OOF2290'
SET @ScreenName = N'Danh mục chỉ tiêu/target'
SET @ScreenNameE = N'Danh mục chỉ tiêu/target'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

---------------------------------------------- Cập nhật ------------------------------------------------------------
SET @ScreenType = 3

SET @ScreenID = N'OOF1021'
SET @ScreenName = N'Cập nhật quy trình'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật bước
SET @ScreenID = N'OOF1031'
SET @ScreenName = N'Cập nhật bước'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật trạng thái
SET @ScreenID = N'OOF1041'
SET @ScreenName = N'Cập nhật trạng thái theo nghiệp vụ'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật mẫu dự án/nhóm công việc
SET @ScreenID = N'OOF1051'
SET @ScreenName = N'Cập nhật mẫu dự án/nhóm công việc'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật mẫu công việc
SET @ScreenID = N'OOF1061'
SET @ScreenName = N'Cập nhật mẫu công việc'
SET @ScreenNameE = N'Cập nhật mẫu công việc'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật danh mục dùng chung
SET @ScreenID = N'OOF1071'
SET @ScreenName = N'Cập nhật danh mục dùng chung'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật giờ công vi phạm
SET @ScreenID = N'OOF1081'
SET @ScreenName = N'Cập nhật giờ công vi phạm'
SET @ScreenNameE = N'Cập nhật giờ công vi phạm'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật thông tin Thiết bị/Phòng họp
SET @ScreenID = N'OOF1091'
SET @ScreenName = N'Cập nhật thông tin Thiết bị/Phòng họp'
SET @ScreenNameE = N'Cập nhật thông tin Thiết bị/Phòng họp'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

---- Danh sách thông báo
SET @ScreenID = N'OOF2091'
SET @ScreenName = N'Cập nhật nội dung thông báo'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật công việc
SET @ScreenID = N'OOF2101'
SET @ScreenName = N'Cập nhật dự án/nhóm công việc'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật công việc
SET @ScreenID = N'OOF2111'
SET @ScreenName = N'Cập nhật công việc'
SET @ScreenNameE = N'Update task'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật checklist
SET @ScreenID = N'OOF2114'
SET @ScreenName = N'Cập nhật checklist công việc'
SET @ScreenNameE = N'Update checklist'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Đánh giá công việc
SET @ScreenID = N'OOF2133'
SET @ScreenName = N'Đánh giá công việc'
SET @ScreenNameE = N'Đánh giá công việc'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Khai báo định mức chi phí dự án
SET @ScreenID = N'OOF2141'
SET @ScreenName = N'Cập nhật định mức chi phí dự án'
SET @ScreenNameE = N'Cập nhật định mức chi phí dự án'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật quản lý vấn đề
SET @ScreenID = N'OOF2161'
SET @ScreenName = N'Cập nhật quản lý vấn đề'
SET @ScreenNameE = N'Cập nhật quản lý vấn đề'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật MilestoneID
SET @ScreenID = N'OOF2191'
SET @ScreenName = N'Cập nhật quản lý Milestone'
SET @ScreenNameE = N'Cập nhật quản lý Milestone'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật Release
SET @ScreenID = N'OOF2211'
SET @ScreenName = N'Cập nhật quản lý release'
SET @ScreenNameE = N'Cập nhật quản lý release'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật mail đến
SET @ScreenID = N'OOF2221'
SET @ScreenName = N'Cập nhật mail đến'
SET @ScreenNameE = N'Cập nhật mail đến'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật thư đến
SET @ScreenID = N'OOF2231'
SET @ScreenName = N'Cập nhật mail đi'
SET @ScreenNameE = N'Cập nhật mail đi'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật đặt thiết bị
SET @ScreenID = N'OOF2241'
SET @ScreenName = N'Cập nhật đặt thiết bị'
SET @ScreenNameE = N'Cập nhật đặt thiết bị'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật thư mục
SET @ScreenID = N'OOF2251'
SET @ScreenName = N'Cập nhật thư mục (Public)'
SET @ScreenNameE = N'Cập nhật thư mục (Public)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật file theo thư mục Public
SET @ScreenID = N'OOF2261'
SET @ScreenName = N'Cập nhật file theo thư mục public'
SET @ScreenNameE = N'Cập nhật file theo thư mục public'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật file theo user
SET @ScreenID = N'OOF2271'
SET @ScreenName = N'Cập nhật file cá nhân'
SET @ScreenNameE = N'Cập nhật file cá nhân'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật văn bản 
SET @ScreenID = N'OOF2341'
SET @ScreenName = N'Cập nhật Văn bản'
SET @ScreenNameE = N'Cập nhật Văn bản'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--
SET @ScreenID = N'OOF3040'
SET @ScreenName = N'Chọn Nhân Viên'
SET @ScreenNameE = N'Chọn Nhân Viên'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật tổ hợp
SET @ScreenID = N'OOF1101'
SET @ScreenName = N'Cập nhật tổ hợp'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Cập nhật chỉ tiêu/target
SET @ScreenID = N'OOF2291'
SET @ScreenName = N'Cập nhật chỉ tiêu/target'
SET @ScreenNameE = N'Cập nhật chỉ tiêu/target'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Khai báo đăng ký thông tin dự án
SET @ScreenID = N'OOF2301'
SET @ScreenName = N'Khai báo đăng ký thông tin dự án'
SET @ScreenNameE = N'Khai báo đăng ký thông tin dự án'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
---------------------------------------------- Báo cáo ------------------------------------------------------------
SET @ScreenType = 1

SET @ScreenID = N'OOF30001'
SET @ScreenName = N'Báo cáo'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Ẩn theo vì ASOFT chỉ có báo cáo tổng OOF3001 chứ không sử dụng tách báo cáo: OOF30002, OOF30003.
SET @ScreenID = N'OOF30002'
SET @ScreenName = N'Báo cáo công việc'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -3, NULL, @OrderNo

SET @ScreenID = N'OOF30003'
SET @ScreenName = N'Báo cáo dự án'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -3, NULL, @OrderNo

SET @ScreenID = N'OOF3028'
SET @ScreenName = N'Báo cáo công việc theo dự án'
SET @ScreenNameE = N'Báo cáo công việc theo dự án'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'OOF3029'
SET @ScreenName = N'Báo cáo công việc theo nhân viên'
SET @ScreenNameE = N'Báo cáo công việc theo nhân viên'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'OOF3030'
SET @ScreenName = N'Báo cáo định mức dự án'
SET @ScreenNameE = N'Báo cáo định mức dự án'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'OOF3031'
SET @ScreenName = N'Báo cáo lãi lỗ dự án'
SET @ScreenNameE = N'Báo cáo lãi lỗ dự án'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'OOF3032'
SET @ScreenName = N'Báo cáo chi tiết công việc theo nhân viên'
SET @ScreenNameE = N'Báo cáo chi tiết công việc theo nhân viên'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'OOF3033'
SET @ScreenName = N'Báo cáo quản lý văn bản'
SET @ScreenNameE = N'Báo cáo quản lý văn bản'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'OOF3034'
SET @ScreenName = N'Báo cáo tình hình vấn đề/yêu cầu hỗ trợ/công việc'
SET @ScreenNameE = N'Báo cáo tình hình vấn đề/yêu cầu hỗ trợ/công việc'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

---------------------------------------------- Xem chi tiết --------------------------------------------------------
SET @ScreenType = 5

--- Xem chi tiết quy trình
SET @ScreenID = N'OOF1022'
SET @ScreenName = N'Xem chi tiết quy trình'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Xem chi tiết bước
SET @ScreenID = N'OOF1032'
SET @ScreenName = N'Xem chi tiết bước'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Xem chi tiết trạng thái
SET @ScreenID = N'OOF1042'
SET @ScreenName = N'Xem chi tiết trạng thái theo nghiệp vụ'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Xem chi tiết mẫu dự án/nhóm công việc
SET @ScreenID = N'OOF1052'
SET @ScreenName = N'Xem chi tiết mẫu dự án/nhóm công việc'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Xem chi tiết mẫu công việc
SET @ScreenID = N'OOF1062'
SET @ScreenName = N'Xem chi tiết mẫu công việc'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Xem chi tiết danh mục dùng chung
SET @ScreenID = N'OOF1072'
SET @ScreenName = N'Xem chi tiết danh mục dùng chung'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Xem chi tiết giờ công vi phạm
SET @ScreenID = N'OOF1082'
SET @ScreenName = N'Xem chi tiết giờ công vi phạm'
SET @ScreenNameE = N'Xem chi tiết giờ công vi phạm'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Xem chi tiết Thông tin Thiết bị/Phòng họp
SET @ScreenID = N'OOF1092'
SET @ScreenName = N'Xem chi tiết Thông tin Thiết bị/Phòng họp'
SET @ScreenNameE = N'Xem chi tiết Thông tin Thiết bị/Phòng họp'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'OOF2092'
SET @ScreenName = N'Xem chi tiết nội dung thông báo'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

SET @ScreenID = N'OOF2093'
SET @ScreenName = N'Xem chi tiết thông báo'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Xem chi tiết dự án/nhóm công việc
SET @ScreenID = N'OOF2102'
SET @ScreenName = N'Xem chi tiết dự án/nhóm công việc'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Xem chi tiết công việc
SET @ScreenID = N'OOF2112'
SET @ScreenName = N'Xem chi tiết công việc'
SET @ScreenNameE = N'Detail of task'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Chi tiết định mức chi phí dự án
SET @ScreenID = N'OOF2142'
SET @ScreenName = N'Chi Tiết Định Mức Chi Phí Dự Án'
SET @ScreenNameE = N'Chi Tiết Định Mức Chi Phí Dự Án'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Chi tiết quản lý vấn đề
SET @ScreenID = N'OOF2162'
SET @ScreenName = N'Xem chi tiết quản lý vấn đề'
SET @ScreenNameE = N'Xem chi tiết quản lý vấn đề'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Chi tiết quản lý Milestone
SET @ScreenID = N'OOF2192'
SET @ScreenName = N'Xem chi tiết quản lý Milestone'
SET @ScreenNameE = N'Xem chi tiết quản lý Milestone'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Chi tiết quản lý Release
SET @ScreenID = N'OOF2212'
SET @ScreenName = N'Xem chi tiết quản lý release'
SET @ScreenNameE = N'Xem chi tiết quản lý release'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Chi tiết thông tin mail nhận
SET @ScreenID = N'OOF2222'
SET @ScreenName = N'Xem chi tiết thông tin mail nhận'
SET @ScreenNameE = N'Xem chi tiết thông tin mail nhận'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Chi tiết thông tin mail đi
SET @ScreenID = N'OOF2232'
SET @ScreenName = N'Xem chi tiết thông tin mail đi'
SET @ScreenNameE = N'Xem chi tiết thông tin mail đi'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Chi tiết thông tin đặt thiết bị
SET @ScreenID = N'OOF2242'
SET @ScreenName = N'Xem chi tiết thông tin đặt thiết bị'
SET @ScreenNameE = N'Xem chi tiết thông tin đặt thiết bị'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Chi tiết thư mục
SET @ScreenID = N'OOF2252'
SET @ScreenName = N'Xem chi tiết thư mục (Public)'
SET @ScreenNameE = N'Xem chi tiết thư mục (Public)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Chi tiết file theo thư mục public
SET @ScreenID = N'OOF2262'
SET @ScreenName = N'Xem chi tiết file theo thư mục public'
SET @ScreenNameE = N'Xem chi tiết file theo thư mục public'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Chi tiết file theo user
SET @ScreenID = N'OOF2272'
SET @ScreenName = N'Xem chi tiết folder cá nhân'
SET @ScreenNameE = N'Xem chi tiết folder cá nhân'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Chi tiết văn bản
SET @ScreenID = N'OOF2342'
SET @ScreenName = N'Xem chi tiết Văn bản'
SET @ScreenNameE = N'Xem chi tiết Văn bản'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Xem chi tiết tổ hợp
SET @ScreenID = N'OOF1102'
SET @ScreenName = N'Xem chi tiết tổ hợp'
SET @ScreenNameE = N''
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--- Xem chi tiết chỉ tiêu/target
SET @ScreenID = N'OOF2292'
SET @ScreenName = N'Xem chi tiết chỉ tiêu/target'
SET @ScreenNameE = N'Xem chi tiết chỉ tiêu/target'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

---------------------------------------------- Nội dung hiển thị trên DashBoard ------------------------------------
SET @ScreenType = 6

-- Công việc hôm nay
SET @ScreenID = N'OOD0001'
SET @ScreenName = N'Công việc hôm nay'
SET @ScreenNameE = N'Công việc hôm nay'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -2, NULL, @OrderNo

-- Công việc chưa xử lý
SET @ScreenID = N'OOD0002'
SET @ScreenName = N'Công việc chưa xử lý'
SET @ScreenNameE = N'Công việc chưa xử lý'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -2, NULL, @OrderNo

-- Thành quả KPI của bạn
SET @ScreenID = N'OOD0003'
SET @ScreenName = N'Thành quả KPI của bạn'
SET @ScreenNameE = N'Thành quả KPI của bạn'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -2, NULL, @OrderNo

-- Thông báo
SET @ScreenID = N'OOD0004'
SET @ScreenName = N'Tình hình dự án (PR)'
SET @ScreenNameE = N'Tình hình dự án (PR)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--Biểu đồ điểm nóng
 SET @ScreenID = N'OOD0005'
 SET @ScreenName = N'Biểu đồ điểm nóng'
 SET @ScreenNameE = N'Biểu đồ điểm nóng'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -2, NULL, @OrderNo

-- Thông Báo
SET @ScreenID = N'OOD0008'
SET @ScreenName = N'Thông báo'
SET @ScreenNameE = N'Thông báo'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -2, NULL, @OrderNo

-- Công việc đã giao
SET @ScreenID = N'OOD0009'
SET @ScreenName = N'Công việc đã giao'
SET @ScreenNameE = N'Công việc đã giao'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -2, NULL, @OrderNo

-- Công việc đang theo dõi
SET @ScreenID = N'OOD0010'
SET @ScreenName = N'Công việc đang theo dõi'
SET @ScreenNameE = N'Công việc đang theo dõi'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -2, NULL, @OrderNo

-- Danh sách văn bản đến, văn bản đi
SET @ScreenID = N'OOD0011'
SET @ScreenName = N'Danh sách văn bản đến, văn bản đi'
SET @ScreenNameE = N'Danh sách văn bản đến, văn bản đi'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -2, NULL, @OrderNo

-- 07/11/2022 - [Hoài Bảo] - Bổ sung phân quyền màn hình Dashboard Dự án và hiển thị biểu đồ trong Dashboard dự án
-- Dashboard Dự án
SET @ScreenID = N'OOF0002'
SET @ScreenName = N'Dashboard Dự án'
SET @ScreenNameE = N'Dashboard Dự án'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Thống kê tổng quan Dự án
SET @ScreenID = N'OOD0012'
SET @ScreenName = N'Tổng quan Dự án'
SET @ScreenNameE = N'Tổng quan dự án'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -2, NULL, @OrderNo

-- Chi tiết dự án
SET @ScreenID = N'OOD0013'
SET @ScreenName = N'Chi tiết Dự án'
SET @ScreenNameE = N'Chi tiết dự án'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -2, 'ERP9', NULL

-- Số liệu thống kê tổng hợp (PR)
SET @ScreenID = N'OOD0014'
SET @ScreenName = N'Số liệu thống kê tổng hợp (PR)'
SET @ScreenNameE = N'Số liệu thống kê tổng hợp (PR)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Biểu đồ trạng thái dự án (PR)
SET @ScreenID = N'OOD0015'
SET @ScreenName = N'Biểu đồ trạng thái dự án (PR)'
SET @ScreenNameE = N'Biểu đồ trạng thái dự án (PR)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Tình hình thực hiện dự án (PR)
SET @ScreenID = N'OOD0016'
SET @ScreenName = N'Tình hình thực hiện dự án (PR)'
SET @ScreenNameE = N'Tình hình thực hiện dự án (PR)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Số liệu thống kê chi tiết (PR)
SET @ScreenID = N'OOD0017'
SET @ScreenName = N'Số liệu thống kê chi tiết (PR)'
SET @ScreenNameE = N'Số liệu thống kê chi tiết (PR)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Biểu đồ thống kê số lượng Công việc/Yêu cầu/Vấn đề/Milestone theo trạng thái (PR)
SET @ScreenID = N'OOD0018'
SET @ScreenName = N'Biểu đồ thống kê số lượng Công việc/Yêu cầu/Vấn đề/Milestone theo trạng thái (PR)'
SET @ScreenNameE = N'Biểu đồ thống kê số lượng Công việc/Yêu cầu/Vấn đề/Milestone theo trạng thái (PR)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Tình hình công việc, độ trễ theo thành viên dự án (PR)
SET @ScreenID = N'OOD0019'
SET @ScreenName = N'Tình hình công việc, độ trễ theo thành viên dự án (PR)'
SET @ScreenNameE = N'Tình hình công việc, độ trễ theo thành viên dự án (PR)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- 07/11/2022 - [Hoài Bảo] - Bổ sung phân quyền màn hình Dashboard Công việc và hiển thị biểu đồ trong Dashboard công việc
-- Dashboard Công việc
SET @ScreenID = N'OOF0003'
SET @ScreenName = N'Dashboard Công việc'
SET @ScreenNameE = N'Dashboard Công việc'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Tổng quan công việc
SET @ScreenID = N'OOD0020'
SET @ScreenName = N'Tổng quan công việc'
SET @ScreenNameE = N'Tổng quan công việc'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -2, NULL, @OrderNo

-- Chi tiết công việc
 SET @ScreenID = N'OOD0021'
 SET @ScreenName = N'Chi tiết công việc'
 SET @ScreenNameE = N'Chi tiết công việc'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -2, NULL, @OrderNo

-- Số liệu thống kê tổng hợp (WO)
SET @ScreenID = N'OOD0022'
SET @ScreenName = N'Số liệu thống kê tổng hợp (WO)'
SET @ScreenNameE = N'Số liệu thống kê tổng hợp (WO)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--  Biểu đồ thể hiện số lượng văn bản theo trạng thái (WO)
SET @ScreenID = N'OOD0023'
SET @ScreenName = N'Biểu đồ thể hiện số lượng văn bản theo trạng thái (WO)'
SET @ScreenNameE = N'Biểu đồ thể hiện số lượng văn bản theo trạng thái (WO)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Biểu đồ thống kê tỷ lệ trạng thái Công việc/Vấn đề/Yêu cầu theo đơn vị (WO)
SET @ScreenID = N'OOD0024'
SET @ScreenName = N'Biểu đồ thống kê tỷ lệ trạng thái Công việc/Vấn đề/Yêu cầu theo đơn vị (WO)'
SET @ScreenNameE = N'Biểu đồ thống kê tỷ lệ trạng thái Công việc/Vấn đề/Yêu cầu theo đơn vị (WO)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Biểu đồ trạng thái và tiến độ Yêu cầu/Công việc/Vấn đề (WO)
SET @ScreenID = N'OOD0025'
SET @ScreenName = N'Biểu đồ trạng thái và tiến độ Yêu cầu/Công việc/Vấn đề (WO)'
SET @ScreenNameE = N'Biểu đồ trạng thái và tiến độ Yêu cầu/Công việc/Vấn đề (WO)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Biểu đồ thống kê số lượng Công việc/vấn đề/Yêu cầu theo phòng ban (WO)
SET @ScreenID = N'OOD0026'
SET @ScreenName = N'Biểu đồ thống kê số lượng Công việc/vấn đề/Yêu cầu theo phòng ban (WO)'
SET @ScreenNameE = N'Biểu đồ thống kê số lượng Công việc/vấn đề/Yêu cầu theo phòng ban (WO)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

--  Biểu đồ điểm Nóng/Lạnh (WO)
SET @ScreenID = N'OOD0027'
SET @ScreenName = N' Biểu đồ điểm Nóng/Lạnh (WO)'
SET @ScreenNameE = N' Biểu đồ điểm Nóng/Lạnh (WO)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Số liệu thống kê chi tiết (WO)
SET @ScreenID = N'OOD0028'
SET @ScreenName = N'Số liệu thống kê chi tiết (WO)'
SET @ScreenNameE = N'Số liệu thống kê chi tiết (WO)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Biểu đồ thống kê tình trạng phê duyệt văn bản (WO)
SET @ScreenID = N'OOD0029'
SET @ScreenName = N'Biểu đồ thống kê tình trạng phê duyệt văn bản (WO)'
SET @ScreenNameE = N'Biểu đồ thống kê tình trạng phê duyệt văn bản (WO)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Biểu đồ thống kê tỷ lệ trạng thái Công việc/Vấn đề/Yêu cầu theo nhân viên (WO)
SET @ScreenID = N'OOD0030'
SET @ScreenName = N'Biểu đồ thống kê tỷ lệ trạng thái Công việc/Vấn đề/Yêu cầu theo nhân viên (WO)'
SET @ScreenNameE = N'Biểu đồ thống kê tỷ lệ trạng thái Công việc/Vấn đề/Yêu cầu theo nhân viên (WO)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- Danh sách công việc theo trạng thái (WO)
SET @ScreenID = N'OOD0031'
SET @ScreenName = N'Danh sách công việc theo trạng thái (WO)'
SET @ScreenNameE = N'Danh sách công việc theo trạng thái (WO)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo

-- 08/12/2022 - [Hoài Bảo] - Bổ sung phân quyền màn hình Dashboard Công việc phần Newsfeed
-- Newsfeed
SET @ScreenID = N'OOD0032'
SET @ScreenName = N'Danh sách thông báo (WO)'
SET @ScreenNameE = N'Danh sách thông báo (WO)'
SET @OrderNo = ISNULL((SELECT TOP 1 ISNULL(OrderNo, 0) FROM #OO_ERP9_PERMISSIONS WHERE ScreenID = @ScreenID), 0)
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL, @OrderNo