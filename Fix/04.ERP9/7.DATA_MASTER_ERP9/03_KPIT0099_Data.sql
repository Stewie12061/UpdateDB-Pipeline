--- Created on 22/02/2019 by Bảo Anh
--- Thêm dữ liệu vào bảng Master data KPIT0099
--- Modified by Lê Hoàng ON 16/11/2020 : kiểm tra insert nếu không tồn tại và cập nhật nếu đã tồn tại
--- Modified by Hoài Bảo ON 28/07/2021 : Bổ sung dữ liệu cột [CodeMasterName]

DECLARE @CodeMaster NVARCHAR(50)
DECLARE @TableID VARCHAR(50) = 'KPIT0099'

--DELETE KPIT0099

SET @CodeMaster = 'Day'
EXEC AddDataMasterERP9 @TableID, N'Day', N'0', NULL, 1, N'Ngày', N'Day', 0, NULL, N'Cách nhập (Màn hình Cập nhật thiết lập bảng đánh giá KPI - KPIF1071)'
EXEC AddDataMasterERP9 @TableID, N'Day', N'1', NULL, 2, N'Tuần', N'Week', 0, NULL, N'Cách nhập (Màn hình Cập nhật thiết lập bảng đánh giá KPI - KPIF1071)'
EXEC AddDataMasterERP9 @TableID, N'Day', N'2', NULL, 3, N'Tháng', N'Month', 0, NULL, N'Cách nhập (Màn hình Cập nhật thiết lập bảng đánh giá KPI - KPIF1071)'
EXEC AddDataMasterERP9 @TableID, N'Day', N'3', NULL, 4, N'Quý', N'Quarter', 0, NULL, N'Cách nhập (Màn hình Cập nhật thiết lập bảng đánh giá KPI - KPIF1071)'
EXEC AddDataMasterERP9 @TableID, N'Day', N'4', NULL, 5, N'Năm', N'Year', 0, NULL, N'Cách nhập (Màn hình Cập nhật thiết lập bảng đánh giá KPI - KPIF1071)'
