-- CREATE BY Trần Quốc Tuấn ON 27/11/2015
-- Modify BY Trần Quốc Tuấn ON 26/04/2016 bổ sung thêm tiếng nhật
-- Thêm dữ liệu vào bảng Master Module OO
-- Modified on 18/02/2019 by Bảo Anh: Bổ sung duyệt quyết định tuyển dụng
-- Modify BY Như Hàn ON 07/11/2018 Bổ sung thêm [CodeMaster] = Applying :NS, KHTC, YCMH, DHM
-- Modify by Vĩnh Tâm ON 10/07/2019 Bổ sung thêm các CodeMaster dùng cho module OO:
-- 			OOF1060.TaskType, OOF1060.TimeComplete, OOF2090.InformType, OOF2101.ObjectType, OOF2110.TargetType, OOT00000001, OOT0050.AssessUserType
-- Modify by Kiều Nga ON 03/06/2020 Bổ sung duyệt Thông tin sản xuất (Mai Thư)
-- Modify by Lê Hoàng ON 13/10/2020 Bổ sung dữ liệu ngầm Loại thiết bị và Khu vực phục vụ Quản lý/Đăng ký phòng họp
-- Modify by Đình hoà ON 14/10/2020 Bổ sung dữ liệu ngầm Loại quản lý đặt thiết bị
-- Modify by Lê Hoàng ON 16/11/2020 : kiểm tra insert nếu không tồn tại và cập nhật nếu đã tồn tại
-- Modify by Tấn Thành ON 16/03/2021: (Xóa)Chuyển các dữ liệu liên quan OOF2180 sang CRMF2150: Lịch sử cuộc gọi.
-- Modify by Hoài Bảo ON 28/07/2021: Bổ sung dữ liệu cột [CodeMasterName] 
-- Modify by Kiều Nga ON 08/12/2021 Bổ sung dữ liệu ngầm loại cảnh báo, trạng thái (màn hình OOF2200)
--- Modified on 14/05/2022 by Kiều Nga:Bổ sung duyệt Văn bản đi, Văn bản đến (CSG).
---Modified on 24/08/2022 by Đức Tuyên:Bổ sung duyệt Đề nghị thu/chi(EXV).
---Modified on 19/09/2022 by Đức Tuyên:Bổ sung loại Đề nghị thu/chi: tiền mặt/qua ngân hàng(EXV).
---Modified on 27/10/2022 by Thanh Lượng: Dữ liệu in (Màn hình Báo cáo Tình hình công việc theo nhân viên - OOF3034)
---Modified on 27/10/2022 by Tấn Lộc : Bổ sung loại duyệt Yêu cầu nhập/xuất kho
---Modified on 05/04/2023 by Thanh Lượng: Bổ sung duyệt Quản lý chất lượng đầu ca.
---Modified on 13/04/2023 by Hoài Thanh : Bổ sung loại duyệt Đơn hàng bán Sell out
---Modified on 28/06/2023 by Anh Đô: Bổ sung phân loại Chỉ tiêu/Công việc (Màn hình OOF2290)
---Modified on 30/10/2023 by Phương Thảo : Bổ sung loại duyệt Kết quả thử việc (Màn hình HRMF2200)
DECLARE @CodeMaster NVARCHAR(50)
DECLARE @TableID VARCHAR(50) = 'OOT0099'
--DELETE OOT0099

-----------------------------------------EmployeeGroupID (khối nhân viên)-------------------------------------
--[CodeMaster], [ID], [ID1], [OrderNo], [Description], [DescriptionE], [Disabled]
--EXEC AddDataMasterERP9 @TableID,@CodeMaster,@ID,@ID1,@OrderNo,@Description,@DescriptionE,@Disabled,@LanguageID
SET @CodeMaster = 'Applying'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'BPC', 0, 5, N'Bảng phân ca', N'シフトアレンジ表', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'DXBSQT', 0, 4, N'Đơn xin bổ sung quẹt thẻ', N'打刻データー訂正申請届け', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'DXLTG', 0, 2, N'Đơn xin làm thêm giờ', N'残業申請届け', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'DXP', 0, 1, N'Đơn xin nghỉ phép', N'休暇申請届け', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'DXRN', 0, 3, N'Đơn xin ra ngoài', N'外出申請届け', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'DXDC', 0, 6, N'Đơn xin đổi ca', N'シフト変更申請届け', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'QDTD', 0, 7, N'Quyết định tuyển dụng', N'', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'YCMH', 0, 8, N'Yêu cầu mua hàng', N'RequestPurchases', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'DHM', 0, 9, N'Đơn hàng mua', N'Purchases', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'KHTC', 0, 10, N'Kế hoạch thu chi', N'PlanPayment', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'NS', 0, 11, N'Ngân sách', N'Budget', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'DMDA', 0, 12, N'Định mức dự án', N'Định mức dự án', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'PBG', 0, 12, N'Phiếu báo giá', N'Quotation', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'BGNCC', 0, 14, N'Báo giá nhà cung cấp', N'Báo giá nhà cung cấp', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'DHB', 0, 14, N'Đơn hàng bán', N'Đơn hàng bán', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'DNCT', 0, 19, N'Đề nghị công tác', N'Proposal of work', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'PDN', 0, 20, N'Phiếu đề nghị', N'Proposal', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'VBDEN', 0, 21, N'Văn bản đến', N'Text to', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'VBDI', 0, 22, N'Văn bản đi', N'Text go', 0, NULL, N'Loại thiết lập xét duyệt'

--24/08/2022 Đức Tuyên
EXEC AddDataMasterERP9 @TableID, N'Applying', N'DNC', 0, 23, N'Đề nghị chi', N'Suggestions Spending', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'DNT', 0, 24, N'Đề nghị thu', N'Suggestions Income', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'YCNK', 0, 25, N'Yêu cầu nhập kho', N'ImWarehouse Request', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'YCXK', 0, 26, N'Yêu cầu xuất kho', N'ExWarehouse Request', 0, NULL, N'Loại thiết lập xét duyệt'
--25/08/2022 Phương Thảo
EXEC AddDataMasterERP9 @TableID, N'Applying', N'KHTD', 0, 26, N'Kế hoạch tuyển dụng', N'ExWarehouse Request', 0, NULL, N'Loại thiết lập xét duyệt'
EXEC AddDataMasterERP9 @TableID, N'Applying', N'KQTV', 0, 26, N'Kết quả thử việc', N'Probation Results', 0, NULL, N'Loại thiết lập xét duyệt'
--05/04/2023 Thanh Lượng
EXEC AddDataMasterERP9 @TableID, N'Applying', N'QLCLC', 0, 27, N'Quản lý chất lượng đầu ca', N'Quality control', 0, NULL, N'Loại thiết lập xét duyệt'
IF (EXISTS(SELECT TOP 1 1 FROM CustomerIndex WHERE CustomerName = 117)) -- CustomerIndex với MTH
BEGIN
	EXEC AddDataMasterERP9 @TableID, N'Applying', N'DHDC', 0, 16, N'Đơn hàng điều chỉnh', N'Đơn hàng điều chỉnh', 0, NULL, N'Loại thiết lập xét duyệt'
	EXEC AddDataMasterERP9 @TableID, N'Applying', N'DT', 0, 17, N'Dự toán', N'Đơn hàng bán', 0, NULL, N'Loại thiết lập xét duyệt'
	EXEC AddDataMasterERP9 @TableID, N'Applying', N'TTSX', 0, 19, N'Thông tin sản xuất', N'Thông tin sản xuất', 0, NULL, N'Loại thiết lập xét duyệt'
	EXEC AddDataMasterERP9 @TableID, N'Applying', N'DTCP', 0, 19, N'Dự trù chi phí', N'Dự trù chi phí', 0, NULL, N'Loại thiết lập xét duyệt'
END

IF (EXISTS(SELECT TOP 1 1 FROM CustomerIndex WHERE CustomerName = 114)) -- CustomerIndex với DTI
BEGIN
	EXEC AddDataMasterERP9 @TableID, N'Applying', N'PBGNC', 0, 15, N'Phiếu báo giá (NC)', N'Phiếu báo giá (NC)', 0, NULL, N'Loại thiết lập xét duyệt'
	EXEC AddDataMasterERP9 @TableID, N'Applying', N'PBGKHCU', 0, 15, N'Phiếu báo giá (KHCU)', N'Phiếu báo giá (KHCU)', 0, NULL, N'Loại thiết lập xét duyệt'
	EXEC AddDataMasterERP9 @TableID, N'Applying', N'PBGSALE', 0, 15, N'Phiếu báo giá (Sale)', N'Phiếu báo giá (Sale)', 0, NULL, N'Loại thiết lập xét duyệt'
	EXEC AddDataMasterERP9 @TableID, N'Applying', N'CH', 0, 18, N'Cơ hội', N'Cơ hội', 0, NULL, N'Loại thiết lập xét duyệt'
END

IF (EXISTS(SELECT TOP 1 1 FROM CustomerIndex WHERE CustomerName = 137)) -- CustomerIndex với MECI
BEGIN
	EXEC AddDataMasterERP9 @TableID, N'Applying', N'BTG', 0, 15, N'Bảng tính giá', N'Bảng tính giá', 0, NULL, N'Loại thiết lập xét duyệt'
END

IF (EXISTS(SELECT TOP 1 1 FROM CustomerIndex WHERE CustomerName = 141)) -- CustomerIndex với SGNP
BEGIN
	EXEC AddDataMasterERP9 @TableID, N'Applying', N'PAKD', 0, 19, N'Phương án kinh doanh', N'Phương án kinh doanh', 0, NULL, N'Loại thiết lập xét duyệt'
END

--13/04/2023 Hoài Thanh: Bổ sung loại duyệt Đơn hàng bán Sell out
EXEC AddDataMasterERP9 @TableID, N'Applying', N'DHB-SELLOUT', 0, 14, N'Đơn hàng bán SELL OUT', N'Sales order SELL OUT', 0, NULL, N'Loại thiết lập xét duyệt'

SET @CodeMaster = 'Day'
EXEC AddDataMasterERP9 @TableID, N'Day', N'0', 0, 1, N'Ngày Thường', N'平日', 0, NULL, N'Cách nhập Ngày/Tuần/Tháng/Quý/Năm'
EXEC AddDataMasterERP9 @TableID, N'Day', N'1', 1, 2, N'Ngày nghỉ', N'休日', 0, NULL, N'Cách nhập Ngày/Tuần/Tháng/Quý/Năm'
EXEC AddDataMasterERP9 @TableID, N'Day', N'2', 2, 3, N'Ngày lễ', N'祝日', 0, NULL, N'Cách nhập Ngày/Tuần/Tháng/Quý/Năm'
SET @CodeMaster = 'Disabled'
EXEC AddDataMasterERP9 @TableID, N'Disabled', N'0', 0, 1, N'Có', N'有り', 0, NULL, N'Không hiển thị'
EXEC AddDataMasterERP9 @TableID, N'Disabled', N'1', 1, 2, N'Không', N'無し', 0, NULL, N'Không hiển thị'
SET @CodeMaster = 'HandleMethod'
EXEC AddDataMasterERP9 @TableID, N'HandleMethod', N'0', 0, 1, N'Chưa xử lý', N'未処理', 0, NULL, N'Phương pháp xử lý'
EXEC AddDataMasterERP9 @TableID, N'HandleMethod', N'1', 1, 2, N'Đã xử lý', N'処理済', 0, NULL, N'Phương pháp xử lý'
EXEC AddDataMasterERP9 @TableID, N'HandleMethod', N'2', 2, 3, N'Tất cả', N'全部', 0, NULL, N'Phương pháp xử lý'
SET @CodeMaster = 'JugdeUnusualType'
EXEC AddDataMasterERP9 @TableID, N'JugdeUnusualType', N'0', 0, 1, N'Đơn xin nghỉ phép', N'休暇申請届け', 0, NULL, N'Loại bất thường'
EXEC AddDataMasterERP9 @TableID, N'JugdeUnusualType', N'1', 1, 2, N'Đơn xin phép ra ngoài', N'外出申請届け', 0, NULL, N'Loại bất thường'
EXEC AddDataMasterERP9 @TableID, N'JugdeUnusualType', N'2', 2, 3, N'Đơn xin làm thêm giờ', N'残業申請届け', 0, NULL, N'Loại bất thường'
EXEC AddDataMasterERP9 @TableID, N'JugdeUnusualType', N'3', 3, 4, N'Đơn xin bổ sung/hủy quẹt thẻ', N'打刻データー訂正申請届け', 0, NULL, N'Loại bất thường'
EXEC AddDataMasterERP9 @TableID, N'JugdeUnusualType', N'4', 4, 5, N'Khác', N'他の', 0, NULL, N'Loại bất thường'
SET @CodeMaster = 'Meal'
EXEC AddDataMasterERP9 @TableID, N'Meal', N'0', 0, 1, N'Tất cả', N'全部', 0, NULL, N'Bữa ăn'
EXEC AddDataMasterERP9 @TableID, N'Meal', N'1', 1, 2, N'Cơm sáng', N'朝食', 0, NULL, N'Bữa ăn'
EXEC AddDataMasterERP9 @TableID, N'Meal', N'2', 2, 3, N'Cơm trưa', N'昼食', 0, NULL, N'Bữa ăn'
EXEC AddDataMasterERP9 @TableID, N'Meal', N'3', 3, 4, N'Cơm chiều', N'夕食', 0, NULL, N'Bữa ăn'
SET @CodeMaster = 'Status'
EXEC AddDataMasterERP9 @TableID, N'Status', N'0', 0, 1, N'Chờ duyệt', N'承認待ち', 0, NULL, N'Trạng thái'
EXEC AddDataMasterERP9 @TableID, N'Status', N'1', 1, 2, N'Duyệt', N'承認', 0, NULL, N'Trạng thái'
EXEC AddDataMasterERP9 @TableID, N'Status', N'2', 2, 3, N'Từ chối', N'否認', 0, NULL, N'Trạng thái'
SET @CodeMaster = 'Type'
EXEC AddDataMasterERP9 @TableID, N'Type', N'0', 0, 1, N'Bổ sung', N'追加', 0, NULL, N'Loại'
EXEC AddDataMasterERP9 @TableID, N'Type', N'1', 1, 2, N'Hủy', N'キャンセル', 0, NULL, N'Loại'
SET @CodeMaster = 'UseVehicle'
EXEC AddDataMasterERP9 @TableID, N'UseVehicle', N'0', 0, 1, N'1 chiều', N'1 午後', 0, NULL, N'Chiều dùng xe'
EXEC AddDataMasterERP9 @TableID, N'UseVehicle', N'1', 1, 2, N'2 chiều', N'2 午後', 0, NULL, N'Chiều dùng xe'
SET @CodeMaster = 'EditType'
EXEC AddDataMasterERP9 @TableID, N'EditType', N'0', 0, 1, N'Bổ sung', N'追加', 0, NULL, N'Loại Bổ sung/Hủy'
EXEC AddDataMasterERP9 @TableID, N'EditType', N'1', 1, 2, N'Hủy', N'キャンセル', 0, NULL, N'Loại Bổ sung/Hủy'
SET @CodeMaster = 'InOut'
EXEC AddDataMasterERP9 @TableID, N'InOut', N'0', 0, 1, N'Vào', N'N入力', 0, NULL, N'Loại quẹt thẻ Vào/Ra'
EXEC AddDataMasterERP9 @TableID, N'InOut', N'1', 1, 2, N'Ra',N' N出力' , 0, NULL, N'Loại quẹt thẻ Vào/Ra'
SET @CodeMaster = 'EmployeeStatus'
EXEC AddDataMasterERP9 @TableID, N'EmployeeStatus', N'0', 0, 1, N'Tuyển dụng', N'募集', 0, NULL, N'Trạng thái nhân viên'
EXEC AddDataMasterERP9 @TableID, N'EmployeeStatus', N'1', 1, 2, N'NV đang làm việc', N'作業従業員', 0, NULL, N'Trạng thái nhân viên'
EXEC AddDataMasterERP9 @TableID, N'EmployeeStatus', N'2', 2, 3, N'NV thử việc', N'見習い', 0, NULL, N'Trạng thái nhân viên'
EXEC AddDataMasterERP9 @TableID, N'EmployeeStatus', N'3', 3, 4, N'Tạm nghỉ', N'一時解雇する', 0, NULL, N'Trạng thái nhân viên'
EXEC AddDataMasterERP9 @TableID, N'EmployeeStatus', N'4', 4, 5, N'CN thời vụ', N'臨時職員', 0, NULL, N'Trạng thái nhân viên'
EXEC AddDataMasterERP9 @TableID, N'EmployeeStatus', N'9', 9, 6, N'Nghỉ làm', N'仕事を辞めます', 0, NULL, N'Trạng thái nhân viên'
SET @CodeMaster = 'StatusNoOT'
EXEC AddDataMasterERP9 @TableID, N'StatusNoOT', N'0', 0, 1, N'Chưa duyệt đơn', N'Chưa duyệt đơn', 0, NULL, N'Trạng thái duyệt đơn không OT'
EXEC AddDataMasterERP9 @TableID, N'StatusNoOT', N'1', 1, 2, N'Đã duyệt đơn', N'Đã duyệt đơn', 0, NULL, N'Trạng thái duyệt đơn không OT'
SET @CodeMaster = 'OOF1060.TaskType'
EXEC AddDataMasterERP9 @TableID, N'OOF1060.TaskType', N'1', 0,1, N'Công việc dự án', N'NULL', 0, NULL, N'Loại công việc'
EXEC AddDataMasterERP9 @TableID, N'OOF1060.TaskType', N'2', 0,2, N'Công việc định kỳ', N'NULL', 0, NULL, N'Loại công việc'
EXEC AddDataMasterERP9 @TableID, N'OOF1060.TaskType', N'3', 0,3, N'Công việc phát sinh', N'NULL', 0, NULL, N'Loại công việc'
SET @CodeMaster = 'OOF1060.TimeComplete'
EXEC AddDataMasterERP9 @TableID, N'OOF1060.TimeComplete', N'1', 0,1, N'1 ngày', N'1 day', 0, NULL, N'Thời gian hoàn thành'
EXEC AddDataMasterERP9 @TableID, N'OOF1060.TimeComplete', N'2', 0,2, N'2 ngày', N'2 days', 0, NULL, N'Thời gian hoàn thành'
EXEC AddDataMasterERP9 @TableID, N'OOF1060.TimeComplete', N'3', 0,3, N'3 ngày', N'3 days', 0, NULL, N'Thời gian hoàn thành'
EXEC AddDataMasterERP9 @TableID, N'OOF1060.TimeComplete', N'4', 0,4, N'4 ngày', N'4 days', 0, NULL, N'Thời gian hoàn thành'
EXEC AddDataMasterERP9 @TableID, N'OOF1060.TimeComplete', N'5', 0,5, N'5 ngày', N'5 days', 0, NULL, N'Thời gian hoàn thành'
EXEC AddDataMasterERP9 @TableID, N'OOF1060.TimeComplete', N'6', 0,6, N'6 ngày', N'6 days', 0, NULL, N'Thời gian hoàn thành'
SET @CodeMaster = 'OOF2090.InformType'
EXEC AddDataMasterERP9 @TableID, N'OOF2090.InformType', N'0', 0,1, N'Thông báo chung', N'NULL', 0, NULL, N'Loại thông báo'
EXEC AddDataMasterERP9 @TableID, N'OOF2090.InformType', N'1', 1,2, N'Thông báo nội bộ', N'NULL', 0, NULL, N'Loại thông báo'
EXEC AddDataMasterERP9 @TableID, N'OOF2090.InformType', N'2', 2,3, N'Thông báo nhân viên', N'NULL', 0, NULL, N'Loại thông báo'
SET @CodeMaster = 'OOF2101.ObjectType'
EXEC AddDataMasterERP9 @TableID, N'OOF2101.ObjectType', N'0', 0,1, N'Công việc', N'Task', 0, NULL, N'Loại quy trình'
EXEC AddDataMasterERP9 @TableID, N'OOF2101.ObjectType', N'1', 1,2, N'Bước quy trình', N'Step of Process', 0, NULL, N'Loại quy trình'
EXEC AddDataMasterERP9 @TableID, N'OOF2101.ObjectType', N'2', 2,3, N'Quy trình làm việc', N'Working Process', 0, NULL, N'Loại quy trình'
SET @CodeMaster = 'OOF2110.TargetType'
EXEC AddDataMasterERP9 @TableID, N'OOF2110.TargetType', N'1', 0,1, N'Tài chính', N'Financial', 0, NULL, N'Loại chỉ tiêu'
EXEC AddDataMasterERP9 @TableID, N'OOF2110.TargetType', N'2', 1,2, N'Phát triển', N'Development', 0, NULL, N'Loại chỉ tiêu'

SET @CodeMaster = 'OOT00000001'
EXEC AddDataMasterERP9 @TableID, N'OOT00000001', N'0', 0,1, N'Dự án', N'Project', 0, NULL, N'Phân loại (Màn hình Danh mục trạng thái - OOF1040)'
EXEC AddDataMasterERP9 @TableID, N'OOT00000001', N'1', 0,2, N'Công việc', N'Task', 0, NULL, N'Phân loại (Màn hình Danh mục trạng thái - OOF1040)'
EXEC AddDataMasterERP9 @TableID, N'OOT00000001', N'2', 0,3, N'Vấn đề', N'Issues', 0, NULL, N'Phân loại (Màn hình Danh mục trạng thái - OOF1040)'
EXEC AddDataMasterERP9 @TableID, N'OOT00000001', N'3', 0,4, N'Yêu cầu hỗ trợ', N'RequestSupport', 0, NULL, N'Phân loại (Màn hình Danh mục trạng thái - OOF1040)'
EXEC AddDataMasterERP9 @TableID, N'OOT00000001', N'4', 0,5, N'Quản lý Milestone ', N'Milestone Management', 0, NULL, N'Phân loại (Màn hình Danh mục trạng thái - OOF1040)'
EXEC AddDataMasterERP9 @TableID, N'OOT00000001', N'5', 0,6, N'Email', N'Email', 0, NULL, N'Phân loại (Màn hình Danh mục trạng thái - OOF1040)'
EXEC AddDataMasterERP9 @TableID, N'OOT00000001', N'6', 0,7, N'Quản lý thiết bị', N'Device Management', 0, NULL, N'Phân loại (Màn hình Danh mục trạng thái - OOF1040)'
EXEC AddDataMasterERP9 @TableID, N'OOT00000001', N'7', 0,7, N'Quản lý văn bản', N'Document Management', 0, NULL, N'Phân loại (Màn hình Danh mục trạng thái - OOF1040)'
EXEC AddDataMasterERP9 @TableID, N'OOT00000001', N'8', 0,8, N'Giao chỉ tiêu/Giao việc', N'Giao chỉ tiêu/Giao việc', 0, NULL, N'Phân loại (Màn hình Danh mục trạng thái - OOF1040)'

SET @CodeMaster = 'OOT0050.AssessUserType'
EXEC AddDataMasterERP9 @TableID, N'OOT0050.AssessUserType', N'0', 1,1, N'Trưởng phòng của Người phụ trách', N'Manager of Assign user', 0, NULL, N'Người đánh giá'
EXEC AddDataMasterERP9 @TableID, N'OOT0050.AssessUserType', N'1', 1,2, N'Người hỗ trợ', N'Support user', 0, NULL, N'Người đánh giá'
EXEC AddDataMasterERP9 @TableID, N'OOT0050.AssessUserType', N'2', 1,3, N'Người giám sát', N'Reviewer user', 0, NULL, N'Người đánh giá'
EXEC AddDataMasterERP9 @TableID, N'OOT0050.AssessUserType', N'3', 1,4, N'Người giao việc', N'Taskmaster', 0, NULL, N'Người đánh giá'
EXEC AddDataMasterERP9 @TableID, N'OOT0050.AssessUserType', N'4', 2,1, N'Trưởng dự án', N'Manager Project', 0, NULL, N'Người đánh giá'
EXEC AddDataMasterERP9 @TableID, N'OOT0050.AssessUserType', N'5', 2,2, N'Người tạo dự án', N'Creator Project', 0, NULL, N'Người đánh giá'
SET @CodeMaster = 'A00.ProjectType'
EXEC AddDataMasterERP9 @TableID, N'A00.ProjectType', N'1', 0,1, N'Dự án', N'Project', 0, NULL, N'Loại dự án/nhóm công việc'
EXEC AddDataMasterERP9 @TableID, N'A00.ProjectType', N'2', 0,2, N'Nhóm công việc', N'Group task', 0, NULL, N'Loại dự án/nhóm công việc'
SET @CodeMaster = 'OOF2130.StatusID'
EXEC AddDataMasterERP9 @TableID, N'OOF2130.StatusID', N'0', 0, 1, N'Chờ đánh giá', N'Chờ đánh giá', 0, NULL, N'Trạng thái đánh giá công việc'
EXEC AddDataMasterERP9 @TableID, N'OOF2130.StatusID', N'1', 1, 2, N'Đã đánh giá', N'Đã đánh giá', 0, NULL, N'Trạng thái đánh giá công việc'
EXEC AddDataMasterERP9 @TableID, N'OOF2130.StatusID', N'2', 2, 3, N'Từ chối hoàn thành', N'Từ chối hoàn thành', 0, NULL, N'Trạng thái đánh giá công việc'
SET @CodeMaster = 'OOF0050.ObjectID'
EXEC AddDataMasterERP9 @TableID, N'OOF0050.ObjectID', N'CV', 1, 1, N'Công việc', N'Task', 0, NULL, N'Loại đối tượng'
EXEC AddDataMasterERP9 @TableID, N'OOF0050.ObjectID', N'DA', 2, 2, N'Dự án', N'Project', 0, NULL, N'Loại đối tượng'
SET @CodeMaster = 'SOT2001.Type'
EXEC AddDataMasterERP9 @TableID, N'SOT2001.Type', N'0', 0,1, N'Quota bán hàng', N'Sales Quota', 0, NULL, N'Loại (Màn hình Cập nhật hạn mức Quota theo nhân viên - SOF2051)'
EXEC AddDataMasterERP9 @TableID, N'SOT2001.Type', N'1', 0,2, N'Quota hỗ trợ', N'Quota support', 0, NULL, N'Loại (Màn hình Cập nhật hạn mức Quota theo nhân viên - SOF2051)'
SET @CodeMaster = 'OOF2160.TypeOfIssues'
EXEC AddDataMasterERP9 @TableID, N'OOF2160.TypeOfIssues', N'1', 1,1, N'Lỗi', N'Bugs', 0, NULL, N'Loại vấn đề'
EXEC AddDataMasterERP9 @TableID, N'OOF2160.TypeOfIssues', N'2', 2,2, N'Hỏi-Đáp', N'Question-Answer', 0, NULL, N'Loại vấn đề'
EXEC AddDataMasterERP9 @TableID, N'OOF2160.TypeOfIssues', N'3', 3,3, N'Thay đổi', N'Change', 0, NULL, N'Loại vấn đề'
EXEC AddDataMasterERP9 @TableID, N'OOF2160.TypeOfIssues', N'4', 4,4, N'Cải tiến', N'Suggest', 0, NULL, N'Loại vấn đề'

--SET @CodeMaster = 'OOF2170.TypeOfRequest'
--EXEC AddDataMasterERP9 @TableID, N'OOF2170.TypeOfRequest', N'1', 1,1, N'Lỗi', N'Bugs', 0, NULL
--EXEC AddDataMasterERP9 @TableID, N'OOF2170.TypeOfRequest', N'2', 2,2, N'Hỏi-Đáp', N'Question-Answer', 0, NULL
--EXEC AddDataMasterERP9 @TableID, N'OOF2170.TypeOfRequest', N'3', 3,3, N'Thay đổi', N'Change', 0, NULL
--EXEC AddDataMasterERP9 @TableID, N'OOF2170.TypeOfRequest', N'4', 4,4, N'Cải tiến', N'Suggest', 0, NULL
--EXEC AddDataMasterERP9 @TableID, N'OOF2170.TypeOfRequest', N'5', 5,5, N'Hướng dẫn', N'Manual', 0, NULL
--EXEC AddDataMasterERP9 @TableID, N'OOF2170.TypeOfRequest', N'6', 6,6, N'Cấp license', N'Provide license', 0, NULL
--EXEC AddDataMasterERP9 @TableID, N'OOF2170.TypeOfRequest', N'7', 7,7, N'Chỉnh sửa báo cáo', N'Update report', 0, NULL
--EXEC AddDataMasterERP9 @TableID, N'OOF2170.TypeOfRequest', N'8', 8,8, N'Kiểm tra dữ liệu', N'Check the data', 0, NULL
--SET @CodeMaster = 'OOF2180.StatusCall'
--EXEC AddDataMasterERP9 @TableID, N'OOF2180.StatusCall', N'ANSWERED', 1,1, N'Trả lời', N'ANSWERED', 0, NULL
--EXEC AddDataMasterERP9 @TableID, N'OOF2180.StatusCall', N'NO ANSWER', 2,2, N'Không trả lời', N'NO ANSWER', 0, NULL
--EXEC AddDataMasterERP9 @TableID, N'OOF2180.StatusCall', N'MISSED', 3,3, N'Bỏ lỡ', N'MISSED', 0, NULL
--EXEC AddDataMasterERP9 @TableID, N'OOF2180.StatusCall', N'BUSY', 4,4, N'Máy bận', N'BUSY', 0, NULL
--SET @CodeMaster = 'OOF2180.TypeOfCall'
--EXEC AddDataMasterERP9 @TableID, N'OOF2180.TypeOfCall', N'Inbound', 1,1, N'Cuộc gọi vào', N'Inbound', 0, NULL
--EXEC AddDataMasterERP9 @TableID, N'OOF2180.TypeOfCall', N'Outbound', 2,2, N'Cuộc gọi ra', N'Outbound', 0, NULL
--EXEC AddDataMasterERP9 @TableID, N'OOF2180.TypeOfCall', N'Local', 3,3, N'Cuộc gọi nội bộ', N'Local', 0, NULL
SET @CodeMaster = 'OOF2190.TypeOfMilestone'
EXEC AddDataMasterERP9 @TableID, N'OOF2190.TypeOfMilestone', N'1', 1,1, N'BA', N'BA', 0, NULL, N'Loại Milestone'
EXEC AddDataMasterERP9 @TableID, N'OOF2190.TypeOfMilestone', N'2', 2,2, N'Build', N'Build', 0, NULL, N'Loại Milestone'
EXEC AddDataMasterERP9 @TableID, N'OOF2190.TypeOfMilestone', N'3', 3,3, N'QC', N'QC', 0, NULL, N'Loại Milestone'
EXEC AddDataMasterERP9 @TableID, N'OOF2190.TypeOfMilestone', N'4', 4,4, N'Release', N'Release', 0, NULL, N'Loại Milestone'
EXEC AddDataMasterERP9 @TableID, N'OOF2190.TypeOfMilestone', N'5', 5,5, N'Done Jobs', N'Done Jobs', 0, NULL, N'Loại Milestone'
SET @CodeMaster = 'OOF2210.TypeOfRelease'
EXEC AddDataMasterERP9 @TableID, N'OOF2210.TypeOfRelease', N'1', 1,1, N'New Functions', N'New Functions', 0, NULL, N'Loại release'
EXEC AddDataMasterERP9 @TableID, N'OOF2210.TypeOfRelease', N'2', 2,2, N'Fix Bugs', N'Fix Bugs', 0, NULL, N'Loại release'
EXEC AddDataMasterERP9 @TableID, N'OOF2210.TypeOfRelease', N'3', 3,3, N'Customized', N'Customized', 0, NULL, N'Loại release'
EXEC AddDataMasterERP9 @TableID, N'OOF2210.TypeOfRelease', N'4', 4,4, N'Fixbugs & Customized', N'Fixbugs & Customized', 0, NULL, N'Loại release'
EXEC AddDataMasterERP9 @TableID, N'OOF2210.TypeOfRelease', N'5', 5,5, N'All', N'All', 0, NULL, N'Loại release'
SET @CodeMaster = 'OOF3028.ReportFilter'
EXEC AddDataMasterERP9 @TableID, N'OOF3028.ReportFilter', N'StatusID', 1,1, N'Công việc', N'Công việc', 0, NULL, N'Dữ liệu in (Màn hình Báo cáo công việc theo dự án - OOF3028)'
EXEC AddDataMasterERP9 @TableID, N'OOF3028.ReportFilter', N'StatusIS', 2,2, N'Vấn đề', N'Vấn đề', 0, NULL, N'Dữ liệu in (Màn hình Báo cáo công việc theo dự án - OOF3028)'
EXEC AddDataMasterERP9 @TableID, N'OOF3028.ReportFilter', N'StatusMT', 3,3, N'Milestone', N'Milestone', 0, NULL, N'Dữ liệu in (Màn hình Báo cáo công việc theo dự án - OOF3028)'
SET @CodeMaster = 'OOF3029.ReportFilter'
EXEC AddDataMasterERP9 @TableID, N'OOF3029.ReportFilter', N'StatusID', 1,1, N'Công việc', N'Công việc', 0, NULL, N'Dữ liệu in (Màn hình Báo cáo chi tiết công việc theo nhân viên - OOF3032)'
EXEC AddDataMasterERP9 @TableID, N'OOF3029.ReportFilter', N'StatusIS', 2,2, N'Vấn đề', N'Vấn đề', 0, NULL, N'Dữ liệu in (Màn hình Báo cáo chi tiết công việc theo nhân viên - OOF3032)'
EXEC AddDataMasterERP9 @TableID, N'OOF3029.ReportFilter', N'StatusHD', 3,3, N'Yêu cầu hỗ trợ', N'Yêu cầu hỗ trợ', 0, NULL, N'Dữ liệu in (Màn hình Báo cáo chi tiết công việc theo nhân viên - OOF3032)'
EXEC AddDataMasterERP9 @TableID, N'OOF3029.ReportFilter', N'StatusMT', 4,4, N'Milestone', N'Milestone', 0, NULL, N'Dữ liệu in (Màn hình Báo cáo chi tiết công việc theo nhân viên - OOF3032)'

SET @CodeMaster = 'OOF3034.ReportFilter'
EXEC AddDataMasterERP9 @TableID, N'OOF3034.ReportFilter', N'StatusID/StatusIS', 1,1, N'Vấn đề/Công việc', N'Vấn đề/Công việc', 0, NULL, N'Dữ liệu in (Màn hình Báo cáo Tình hình công việc theo nhân viên - OOF3034)'
EXEC AddDataMasterERP9 @TableID, N'OOF3034.ReportFilter', N'StatusID/StatusHD', 2,2, N'Yêu cầu hỗ trợ/Công việc', N'Yêu cầu hỗ trợ/Công việc', 0, NULL, N'Dữ liệu in (Màn hình Báo cáo Tình hình công việc theo nhân viên - OOF3034)'

SET @CodeMaster = 'OOF1091.Type'
EXEC AddDataMasterERP9 @TableID, N'OOF1091.Type', N'TypeDevice', 1,1, N'Thiết bị', N'Thiết bị', 0, NULL, N'Loại thiết bị'
EXEC AddDataMasterERP9 @TableID, N'OOF1091.Type', N'TypeRoom', 2,2, N'Phòng họp', N'Phòng họp', 0, NULL, N'Loại thiết bị'
EXEC AddDataMasterERP9 @TableID, N'OOF1091.Type', N'TypeCar', 3,3, N'Xe ô tô', N'Xe ô tô', 0, NULL, N'Loại thiết bị'

SET @CodeMaster = 'OOF1091.Area'
EXEC AddDataMasterERP9 @TableID, N'OOF1091.Area', N'AreaNorth', 1,1, N'Khu vực phía Bắc', N'North', 0, NULL, N'Khu vực'
EXEC AddDataMasterERP9 @TableID, N'OOF1091.Area', N'AreaSouth', 2,2, N'Khu vực phía Nam', N'South', 0, NULL, N'Khu vực'
EXEC AddDataMasterERP9 @TableID, N'OOF1091.Area', N'AreaWest', 3,3, N'Khu vực phía Tây', N'West', 0, NULL, N'Khu vực'

SET @CodeMaster = 'OOF2241.Type'
EXEC AddDataMasterERP9 @TableID, N'OOF2241.Type', N'Internal', 0,1, N'Nội bộ', N'Internal', 0, NULL, N'Loại đặt thiết bị'
EXEC AddDataMasterERP9 @TableID, N'OOF2241.Type', N'External', 1,2, N'Bên ngoài', N'External', 0, NULL, N'Loại đặt thiết bị'

SET @CodeMaster = 'OOF2200.MessageType'
EXEC AddDataMasterERP9 @TableID, N'OOF2200.MessageType', N'Information', 0,1, N'Thông báo', N'Information', 0, NULL, N'Loại cảnh báo'
EXEC AddDataMasterERP9 @TableID, N'OOF2200.MessageType', N'Warning', 1,2, N'Cảnh báo', N'Warning', 0, NULL, N'Loại cảnh báo'
EXEC AddDataMasterERP9 @TableID, N'OOF2200.MessageType ', N'Error', 2,3, N'Lỗi', N'Error', 0, NULL, N'Loại cảnh báo'

SET @CodeMaster = 'OOF2200.IsRead'
EXEC AddDataMasterERP9 @TableID, N'OOF2200.IsRead', N'NotSeen', 0,1, N'Chưa xem', N'NotSeen', 0, NULL, N'Trạng thái'
EXEC AddDataMasterERP9 @TableID, N'OOF2200.IsRead', N'IsRead', 1,2, N'Đã xem', N'IsRead', 0, NULL, N'Trạng thái'

SET @CodeMaster = 'OOF2340.DocumentType'
IF (EXISTS(SELECT TOP 1 1 FROM CustomerIndex WHERE CustomerName = 152)) -- CustomerIndex với Cảng Sài Gòn
BEGIN
	EXEC AddDataMasterERP9 @TableID, N'OOF2340.DocumentType', N'OOF23411', 1, 1, N'Văn bản Cảng Sài Gòn', N'CSG Document', 0, NULL, N'Loại văn bản'
END

EXEC AddDataMasterERP9 @TableID, N'OOF2340.DocumentType', N'OOF23412', 2, 2, N'Quyết định', N'Decision', 0, NULL, N'Loại văn bản'
EXEC AddDataMasterERP9 @TableID, N'OOF2340.DocumentType ', N'OOF23413', 3, 3, N'Hợp đồng', N'Contract', 0, NULL, N'Loại văn bản'

SET @CodeMaster = 'OOF2340.SignedStatus'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 1, 1, 1, N'Đang xử lý/Bản nháp', N'Processing', 0, NULL, N'Trạng thái ký'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 2, 2, 2, N'Đã ký', N'Signed', 0, NULL, N'Trạng thái ký'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 3, 3, 3, N'Trong luồng ký', N'In the processing flow', 0, NULL, N'Trạng thái ký'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 4, 4, 4, N'Từ chối', N'Denied', 0, NULL, N'Trạng thái ký'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 5, 5, 5, N'Quá hạn ký', N'Orverdue For Signing', 0, NULL, N'Trạng thái ký'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 6, 6, 6, N'Hủy bỏ', N'Void', 0, NULL, N'Trạng thái ký'

SET @CodeMaster = 'OOF2340.DocumentMode'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'VBDEN', 0, 0, N'Văn bản đến', N'Received Document', 0, NULL, N'Loại công văn'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'VBDI', 1, 1, N'Văn bản đi', N'Sent Document', 0, NULL, N'Loại công văn'

SET @CodeMaster = 'OOF2340.IsInternal'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 0, 0, 0, N'Không', N'No', 0, NULL, N'Văn bản nội bộ'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 1, 1, 1, N'Có', N'Yes', 0, NULL, N'Văn bản nội bộ'

--19/09/2022 Đức Tuyên
--DELETE OOT0099 where CodeMaster = N'AF2010.TransactionMode'
EXEC AddDataMasterERP9 @TableID, N'AF2010.TransactionMode', N'AF20111', 1, 1, N'Thu tiền mặt', N'Decision', 0, NULL, N'Loại đề nghị'
EXEC AddDataMasterERP9 @TableID, N'AF2010.TransactionMode', N'AF20112', 2, 2, N'Thu qua ngân hàng', N'Decision', 0, NULL, N'Loại đề nghị'
EXEC AddDataMasterERP9 @TableID, N'AF2010.TransactionMode', N'AF20113', 3, 3, N'Chi tiền mặt', N'Decision', 0, NULL, N'Loại đề nghị'
EXEC AddDataMasterERP9 @TableID, N'AF2010.TransactionMode', N'AF20114', 4, 4, N'Chi qua ngân hàng', N'Decision', 0, NULL, N'Loại đề nghị'

--19/09/2022 Đức Tuyên
--DELETE OOT0099 where CodeMaster = N'AF2013.InheritType'
EXEC AddDataMasterERP9 @TableID, N'AF2013.InheritType', N'HDMH', 1, 1, N'Hóa đơn mua hàng', N'Decision', 0, NULL, N'Nguồn kế thừa'
EXEC AddDataMasterERP9 @TableID, N'AF2013.InheritType', N'NK', 2, 2, N'Nhập kho', N'Decision', 0, NULL, N'Nguồn kế thừa'
EXEC AddDataMasterERP9 @TableID, N'AF2013.InheritType', N'DHM', 3, 3, N'Đơn hàng mua', N'Decision', 0, NULL, N'Nguồn kế thừa'
IF (EXISTS(SELECT TOP 1 1 FROM CustomerIndex WHERE CustomerName = -11)) -- CustomerIndex với CUSTOMER_CBD
BEGIN
	EXEC AddDataMasterERP9 @TableID, N'AF2013.InheritType', N'BTTH', 4, 4, N'BTTH', N'Decision', 0, NULL, N'Nguồn kế thừa'
	EXEC AddDataMasterERP9 @TableID, N'AF2013.InheritType', N'SDDK', 4, 4, N'SDDK', N'Decision', 0, NULL, N'Nguồn kế thừa'
END

SET @CodeMaster = 'OOF2290.Type'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 'TARGET', 1, 1, N'Chỉ tiêu', N'Chỉ tiêu', 0, NULL, N'Loại chỉ tiêu/công việc'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 'TASK', 2, 2, N'Công việc', N'Công việc', 0, NULL, N'Loại chỉ tiêu/công việc'

--17/11/2023 Đức Tuyên Phân loại công việc cho khách hàng INNOTEK
IF ((SELECT CustomerName FROM CustomerIndex) = 161)
BEGIN
	--DELETE OOT0099 where CodeMaster = N'MF2210.TaskTypeName'
	EXEC AddDataMasterERP9 @TableID, N'MF2210.TaskTypeName', N'TGTSP', 1, 1, N'Tạo giá trị sản phẩm', N'Create product value', 0, NULL, N'Phân loại công việc'
	EXEC AddDataMasterERP9 @TableID, N'MF2210.TaskTypeName', N'KTGTSP', 2, 2, N'Không tạo giá trị sản phẩm', N'Does not create product value', 0, NULL, N'Phân loại công việc'
END
