-- CREATE BY Hồ Hoàng Tú ON 30/10/2014
-- Modify by Lê Hoàng ON 16/11/2020 : kiểm tra insert nếu không tồn tại và cập nhật nếu đã tồn tại
-- Thêm dữ liệu vào bảng Master
-- Modify by: Hoài Bảo, Date: 28/07/2021: Bổ sung dữ liệu cột [CodeMasterName]

--DELETE FROM CIT0099
DECLARE @TableID VARCHAR(50) = 'CIT0099'

------------------------------------------------------------------------------------------
EXEC AddDataMasterERP9 @TableID, 'CI000001', 1, NULL, NULL, N'Không', N'', 0, NULL, N'Dùng chung (Xuất Excel danh mục định mức chi phí - FNF1000)'
EXEC AddDataMasterERP9 @TableID, 'CI000001', 2, NULL, NULL, N'Có', N'', 0, NULL, N'Dùng chung (Xuất Excel danh mục định mức chi phí - FNF1000)'
EXEC AddDataMasterERP9 @TableID, 'CI000002', 1, NULL, NULL, N'Không', N'', 0, NULL, N'Không hiển thị (Xuất Excel danh mục định mức chi phí - FNF1000)'
EXEC AddDataMasterERP9 @TableID, 'CI000002', 2, NULL, NULL, N'Có', N'', 0, NULL, N'Không hiển thị (Xuất Excel danh mục định mức chi phí - FNF1000)'


----Modified on 16/08/2018 by Hồng Thảo: Bổ sung Trạng thái Disabled' ,Khu vưc  (customize AIC) danh mục định mức chi phí, mặt hàng 
---------------Add dữ liệu để load combo không hiển thị, combo dùng chung -------------------------------------
EXEC AddDataMasterERP9 @TableID, 'Disabled', 0, NULL, NULL, N'Không', N'No', 0, NULL, N'Không hiển thị'
EXEC AddDataMasterERP9 @TableID, 'Disabled', 1, NULL, NULL, N'Có', N'Yes', 0, NULL, N'Không hiển thị'

--Trạng thái Mapping---------------------------------------------------------------------------------------------
EXEC AddDataMasterERP9 @TableID, 'CI000003', 0, NULL, NULL, N'Chưa Mapping', N'No Mapping', 0, NULL, N'Trạng thái (Màn hình Tham chiếu mã hàng từ quản lý dự án và ERP - CIF1176)'
EXEC AddDataMasterERP9 @TableID, 'CI000003', 1, NULL, NULL, N'Đã Mapping', N'Mapping', 0, NULL, N'Trạng thái (Màn hình Tham chiếu mã hàng từ quản lý dự án và ERP - CIF1176)'

--Phân loại cho quản lí mã series
EXEC AddDataMasterERP9 @TableID, 'CI000004_SERI', 0, NULL, 0, N'Theo hằng số', N'Theo hằng số', 0, NULL, N'Phân loại cho quản lí mã series'
EXEC AddDataMasterERP9 @TableID, 'CI000004_SERI', 1, NULL, 1, N'Theo ngày tháng năm (dd-mm-yyyy)', N'Theo ngày tháng năm (dd-mm-yyyy)', 0, NULL, N'Phân loại cho quản lí mã series'
EXEC AddDataMasterERP9 @TableID, 'CI000004_SERI', 2, NULL, 2, N'Theo ngày tháng năm (ddmmyyyy)', N'Theo ngày tháng năm (ddmmyyyy)', 0, NULL, N'Phân loại cho quản lí mã series'
EXEC AddDataMasterERP9 @TableID, 'CI000004_SERI', 3, NULL, 3, N'Phân loại 1', N'Phân loại 1', 0, NULL, N'Phân loại cho quản lí mã series'
EXEC AddDataMasterERP9 @TableID, 'CI000004_SERI', 4, NULL, 4, N'Phân loại 2', N'Phân loại 2', 0, NULL, N'Phân loại cho quản lí mã series'
EXEC AddDataMasterERP9 @TableID, 'CI000004_SERI', 5, NULL, 5, N'Phân loại 3', N'Phân loại 3', 0, NULL, N'Phân loại cho quản lí mã series'
EXEC AddDataMasterERP9 @TableID, 'CI000004_SERI', 6, NULL, 6, N'Mã hàng', N'Mã hàng', 0, NULL, N'Phân loại cho quản lí mã series'
EXEC AddDataMasterERP9 @TableID, 'CI000004_SERI', 7, NULL, 7, N'Theo ngày tháng năm (ddmmyy)', N'Theo ngày tháng năm (ddmmyy)', 0, NULL, N'Phân loại cho quản lí mã series'