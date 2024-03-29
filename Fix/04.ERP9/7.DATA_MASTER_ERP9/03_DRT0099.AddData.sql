-- CREATE BY Nguyễn Thanh Sơn ON 03/09/2014
-- Thêm dữ liệu vào bảng Master Module DRM
DECLARE @CodeMaster NVARCHAR(50)
DELETE DRT0099
-----------------------------------------EmployeeGroupID (khối nhân viên)-------------------------------------
SET @CodeMaster = 'EmployeeGroupID'
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'NTD', 1, N'Nợ tiêu dùng', N'Nợ tiêu dùng',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'NTM', 2, N'Nợ thương mại', N'Nợ thương mại',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'KVP', 3, N'Khối văn phòng', N'Khối văn phòng',0)

-----------------------------------------CommonInformation (thông tin chung)-------------------------------------
SET @CodeMaster = 'CommonInformation'
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'Action', 3, N'Hành động', N'Action',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'ActionObject', 4, N'Đối tượng tác động', N'ActionObject',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'ActionPlace', 5, N'Nơi tiếp xúc', N'ActionPlace',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'Result', 6, N'Kết quả', N'Result',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'AssetStatus', 6, N'Tình trạng sản phẩm', N'AssetStatus',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'Reason', 7, N'Phân loại hồ sơ', N'Contract type',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'ManagePlace', 8, N'Khu vực quản lý', N'ManagePlace',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'Indicator', 7, N'Chi phí gián tiếp', N'Indicator',0)
--INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'Indicator', 7, N'Quận/huyện', N'Indicator',0)
--INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'Indicator', 7, N'Tỉnh/thành', N'Indicator',0)

-----------------------------------------EmployeeStatus (Tình trạng làm việc)-------------------------------------
SET @CodeMaster = 'EmployeeStatus'
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'ES1', 1, N'Chính thức', N'Working',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'ES2', 2, N'Thử việc', N'Trainning',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'ES9', 3, N'Nghỉ việc', N'Quit',0)

-----------------------------------------ContractGroup (Phân nhóm hồ sơ)-------------------------------------
SET @CodeMaster = 'ContractGroup'
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'HSA', 1, N'Hồ sơ nhóm A', N'Contract Group A',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'HSB', 2, N'Hồ sơ nhóm B', N'Contract Group B',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'HSC', 3, N'Hồ sơ nhóm C', N'Contract Group C',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'HSD', 4, N'Hồ sơ nhóm D', N'Contract Group D',0)

-----------------------------------------NTDDebtRecoMethod (Phương pháp tính phí thu hồi nợ tiêu dùng)-------------------------------------
SET @CodeMaster = 'NTDDebtRecoMethod'
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'A', 1, N'Phí thu hồi khách hàng nhóm A', N'Debt Recovery Method Group A',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'B', 2, N'Phí thu hồi khách hàng nhóm B', N'Debt Recovery Method Group B',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'C', 3, N'Phí thu hồi khách hàng nhóm C', N'Debt Recovery Method Group C',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'D', 4, N'Phí thu hồi khách hàng nhóm D', N'Debt Recovery Method Group D',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'E', 5, N'Phí thu hồi khách hàng nhóm E', N'Debt Recovery Method Group E',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'F', 6, N'Phí thu hồi khách hàng nhóm F', N'Debt Recovery Method Group F',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'G', 7, N'Phí thu hồi khách hàng nhóm G', N'Debt Recovery Method Group G',0)

-----------------------------------------NTMDebtRecoMethod (Phương pháp tính phí thu hồi nợ thương mại)-------------------------------------
SET @CodeMaster = 'NTMDebtRecoMethod'
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'E', 1, N'Phí thu hồi khách hàng nhóm E', N'Debt Recovery Method Group E',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'F', 2, N'Phí thu hồi khách hàng nhóm F', N'Debt Recovery Method Group F',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'G', 3, N'Phí thu hồi khách hàng nhóm G', N'Debt Recovery Method Group G',0)

-----------------------------------------Dispath (Tình trạng gửi công văn - đóng hồ sơ)-------------------------------------
SET @CodeMaster = 'Dispath'
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '0', 1, N'Chưa thực hiện', N'Non Send',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '1', 2, N'Đã thực hiện', N'Sent',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '2', 3, N'Đang đề nghị', N'Sending',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '3', 4, N'Trưởng nhóm từ chối', N'Sending',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '4', 5, N'Trưởng nhóm xác nhận', N'Sending',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '5', 6, N'Quản lý từ chối', N'Sending',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '6', 7, N'Quản lý xác nhận', N'Sending',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '7', 8, N'Phòng t.tin từ chối', N'Sending',0)

-----------------------------------------EmailGroup (Nhóm email gửi từ hệ thống)-------------------------------------
SET @CodeMaster = 'EmailGroup'
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'Contract', 1, N'Hồ sơ', N'Contract',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'Report', 2, N'Báo cáo', N'Report',0)
-----------------------------------------FeePlace (Khu vực tính phí)-------------------------------------
SET @CodeMaster = 'B'
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '1', 1, N'Khu vực 1', N'Khu vực 1',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '2', 2, N'Khu vực 2', N'Khu vực 2',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '3', 3, N'Khu vực 3', N'Khu vực 3',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '4', 4, N'Khu vực 4', N'Khu vực 4',0)

SET @CodeMaster = 'C'
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '1', 1, N'Khu vực 1', N'Khu vực 1',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '2', 2, N'Khu vực 2', N'Khu vực 2',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '3', 3, N'Khu vực 3', N'Khu vực 3',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '4', 4, N'Khu vực 4', N'Khu vực 4',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '5', 5, N'Khu vực 5', N'Khu vực 5',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '6', 6, N'Khu vực 6', N'Khu vực 6',0)

SET @CodeMaster = 'D'
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '1', 1, N'Khu vực 1', N'Khu vực 1',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '2', 2, N'Khu vực 2', N'Khu vực 2',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '3', 3, N'Khu vực 3', N'Khu vực 3',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '4', 4, N'Khu vực 4', N'Khu vực 4',0)

SET @CodeMaster = 'E'
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '1', 1, N'Khu vực 1', N'Khu vực 1',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '2', 2, N'Khu vực 2', N'Khu vực 2',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '3', 3, N'Khu vực 3', N'Khu vực 3',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '4', 4, N'Khu vực 4', N'Khu vực 4',0)

SET @CodeMaster = 'F'
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '1', 1, N'Khu vực 1', N'Khu vực 1',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '2', 2, N'Khu vực 2', N'Khu vực 2',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '3', 3, N'Khu vực 3', N'Khu vực 3',0)

SET @CodeMaster = 'G'
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '1', 1, N'Khu vực 1', N'Khu vực 1',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '2', 2, N'Khu vực 2', N'Khu vực 2',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, '3', 3, N'Khu vực 3', N'Khu vực 3',0)

SET @CodeMaster = 'AD'
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'AD01', 1, N'Địa chỉ 1', N'Address 1',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'AD02', 2, N'Địa chỉ 2', N'Address 2',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'AD03', 3, N'Địa chỉ 3', N'Address 3',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'AD04', 4, N'Địa chỉ 4', N'Address 4',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'AD05', 5, N'Địa chỉ 5', N'Address 5',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'AD06', 6, N'Địa chỉ 6', N'Address 6',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'AD07', 7, N'Địa chỉ 7', N'Address 7',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'AD08', 8, N'Địa chỉ 8', N'Address 8',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'AD09', 9, N'Địa chỉ 9', N'Address 9',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'AD10', 10, N'Địa chỉ 10', N'Address 10',0)
SET @CodeMaster = 'GCV'
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'XR1', 1, N'Công văn ban đầu XR 1', N'Công văn ban đầu XR 1',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'BC-CA', 2, N'Công văn công an', N'Công văn công an',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'XR2', 2, N'Công văn xương rồng 2', N'Công văn xương rồng 2',0)
INSERT INTO DRT0099 (CodeMaster, ID, OrderNo, [Description], DescriptionE, [Disabled]) VALUES (@CodeMaster, 'VPL', 3, N'Công văn văn phòng luật', N'Công văn văn phòng luật',0)

