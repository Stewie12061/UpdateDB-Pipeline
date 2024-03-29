-- CREATE BY Phạm Lê Hoàng ON 14/12/2020
-- Modify BY Đình Hòa ON 10/05/2021 : Bổ sung Loại tiêu chuẩn Vật tư(SUPPLIES)
-- MODIFIED BY Lê Hoàng ON 19/05/2021 : Bổ sung dữ liệu lưu tên máy kết nối cân điện tử
-- MODIFIED BY Hoài Bảo ON 29/07/2021 : Bổ sung dữ liệu cột [CodeMasterName]
-- MODIFIED BY Hoàng Long ON 14/03/2023 : Bổ sung Loại tiêu chuẩn 
-- MODIFIED BY Thanh Lượng ON 05/04/2023 : Customize đổi tên lại cho loại phương pháp mẫu thử [MethodTest]
-- MODIFIED BY Hoàng Long ON 20/09/2023 : Bổ sung mẫu in 1,2,3,4,5,6

DECLARE @CodeMaster NVARCHAR(50)
DECLARE @TableID VARCHAR(50) = 'QCT0099'

IF EXISTS(SELECT TOP 1 1 FROM CustomerIndex WITH(NOLOCK) WHERE CustomerName = 117)
BEGIN
EXEC AddDataMasterERP9 N'QCT0099', N'Standard', N'SIZE', NULL, 0, N'Kích thước', N'Size', 0, NULL, N'Loại tiêu chuẩn (Màn hình thống kê - QCF2061'
EXEC AddDataMasterERP9 N'QCT0099', N'Standard', N'PROP', NULL, 0, N'Tính chất', N'Properties', 0, NULL, N'Loại tiêu chuẩn (Màn hình thống kê - QCF2061'
EXEC AddDataMasterERP9 N'QCT0099', N'Standard', N'APPE', NULL, 0, N'Ngoại quan', N'Appearance', 0, NULL, N'Loại tiêu chuẩn (Màn hình thống kê - QCF2061'
EXEC AddDataMasterERP9 N'QCT0099', N'Standard', N'PACK', NULL, 0, N'Đóng gói', N'Packing', 0, NULL, N'Loại tiêu chuẩn (Màn hình thống kê - QCF2061'
EXEC AddDataMasterERP9 N'QCT0099', N'Standard', N'BOM', NULL, 0, N'Tiêu chuẩn nguyên vật liệu (BOM)', N'BOM', 0, NULL, N'Loại tiêu chuẩn (Màn hình thống kê - QCF2061'
EXEC AddDataMasterERP9 N'QCT0099', N'Standard', N'MACH', NULL, 0, N'Thông số vận hành', N'Machine parameter', 0, NULL, N'Loại tiêu chuẩn (Màn hình thống kê - QCF2061'
EXEC AddDataMasterERP9 N'QCT0099', N'Standard', N'TECH', NULL, 0, N'Thông số kỹ thuật', N'Technology parameter', 0, NULL, N'Loại tiêu chuẩn (Màn hình thống kê - QCF2061'
END
ELSE
BEGIN
EXEC AddDataMasterERP9 N'QCT0099', N'Standard', N'PHY', NULL, 0, N'Lý tính', N'Physically', 0, NULL, N'Loại tiêu chuẩn (Màn hình thống kê - QCF2061'
EXEC AddDataMasterERP9 N'QCT0099', N'Standard', N'CHE', NULL, 0, N'Hóa tính', N'Chemistry', 0, NULL, N'Loại tiêu chuẩn (Màn hình thống kê - QCF2061'
EXEC AddDataMasterERP9 N'QCT0099', N'Standard', N'APPE', NULL, 0, N'Ngoại quan', N'Appearance', 0, NULL, N'Loại tiêu chuẩn (Màn hình thống kê - QCF2061'
EXEC AddDataMasterERP9 N'QCT0099', N'Standard', N'OTH', NULL, 0, N'Khác', N'Other', 0, NULL, N'Loại tiêu chuẩn (Màn hình thống kê - QCF2061'
END
-- Thêm cho MECI
IF EXISTS(SELECT TOP 1 1 FROM CustomerIndex WITH(NOLOCK) WHERE CustomerName = 137)
BEGIN
EXEC AddDataMasterERP9 N'QCT0099', N'STANDARDMECI', N'SPECIFICATIONS', NULL, 0, N'Thông số', N'Specifications', 0, NULL, N'Loại tiêu chuẩn cho MECI'
EXEC AddDataMasterERP9 N'QCT0099', N'STANDARDMECI', N'SUPPLIES', NULL, 1, N'Vật tư', N'Supplies', 0, NULL, N'Loại tiêu chuẩn cho MECI'
END

EXEC AddDataMasterERP9 N'QCT0099', N'AutoScale', N'VNP_ComputerConnectToScale', NULL, 0, N'VNPTISSUE01', N'VNPTISSUE01', 0, NULL, N'Dữ liệu lưu tên máy kết nối cân điện tử'
EXEC AddDataMasterERP9 N'QCT0099', N'AutoScale', N'VNP_DifferenceValue', NULL, 0, N'1.3', N'1.3', 0, NULL, N'Dữ liệu lưu tên máy kết nối cân điện tử'

EXEC AddDataMasterERP9 N'QCT0099', N'QCFVoucherType', N'0', NULL, 0, N'Phiếu nhập thông số kỹ thuật', N'Phiếu nhập thông số kỹ thuật', 0, NULL, N'Loại phiếu nhập'
EXEC AddDataMasterERP9 N'QCT0099', N'QCFVoucherType', N'1', NULL, 1, N'Phiếu nhập thông số vận hành máy', N'Phiếu nhập thông số vận hành máy', 0, NULL, N'Loại phiếu nhập'
EXEC AddDataMasterERP9 N'QCT0099', N'QCFVoucherType', N'2', NULL, 2, N'Phiếu nhập nguyên vật liệu', N'Phiếu nhập nguyên vật liệu', 0, NULL, N'Loại phiếu nhập'
EXEC AddDataMasterERP9 N'QCT0099', N'QCFVoucherType', N'3', NULL, 3, N'Phiếu ghi nhận số lượng thành phẩm', N'Phiếu ghi nhận số lượng thành phẩm', 0, NULL, N'Loại phiếu nhập'

EXEC AddDataMasterERP9 N'QCT0099', N'QCF2001Type', N'1', NULL, 0, N'Loại 1', N'Type 1', 0, NULL, N'Loại - QCF2001'
EXEC AddDataMasterERP9 N'QCT0099', N'QCF2001Type', N'2', NULL, 1, N'Loại 2', N'Type 2', 0, NULL, N'Loại - QCF2001'
EXEC AddDataMasterERP9 N'QCT0099', N'QCF2001Type', N'3', NULL, 2, N'Loại 3', N'Type 3', 0, NULL, N'Loại - QCF2001'
EXEC AddDataMasterERP9 N'QCT0099', N'QCF2001Type', N'X', NULL, 3, N'Loại X', N'Type X', 0, NULL, N'Loại - QCF2001'

EXEC AddDataMasterERP9 N'QCT0099', N'Status', N'0', NULL, 0, N'Chờ xử lý', N'Waiting', 0, NULL, N'Trạng thái Phiếu quản lý chất lượng đầu ca - QCF2000'
EXEC AddDataMasterERP9 N'QCT0099', N'Status', N'1', NULL, 1, N'Đạt', N'Pass', 0, NULL, N'Trạng thái Phiếu quản lý chất lượng đầu ca - QCF2000'
EXEC AddDataMasterERP9 N'QCT0099', N'Status', N'2', NULL, 2, N'Không đạt', N'Faild', 0, NULL, N'Trạng thái Phiếu quản lý chất lượng đầu ca - QCF2000'

EXEC AddDataMasterERP9 N'QCT0099', N'DataType', N'0', NULL, 0, N'Chuỗi', N'String', 0, NULL, N'Loại dữ liệu Danh mục tiêu chuẩn - QCF1000'
EXEC AddDataMasterERP9 N'QCT0099', N'DataType', N'1', NULL, 0, N'Số', N'Number', 0, NULL, N'Loại dữ liệu Danh mục tiêu chuẩn - QCF1000'

EXEC AddDataMasterERP9 N'QCT0099', N'CALCULATETYPE', N'KHO', NULL, 0, N'Khổ', NULL, 0, NULL, N'Loại công thức (Màn hình Cập nhật tiêu chuẩn - QCF1001)'
EXEC AddDataMasterERP9 N'QCT0099', N'CALCULATETYPE', N'CUON', NULL, 1, N'Cuộn', NULL, 0, NULL, N'Loại công thức (Màn hình Cập nhật tiêu chuẩn - QCF1001)'
EXEC AddDataMasterERP9 N'QCT0099', N'CALCULATETYPE', N'BeginQuantity', NULL, 1, N'Ghi nhận khối lượng tồn', NULL, 0, NULL, N'Loại công thức (Màn hình Cập nhật tiêu chuẩn - QCF1001)'
EXEC AddDataMasterERP9 N'QCT0099', N'CALCULATETYPE', N'DebitQuantity', NULL, 1, N'Ghi nhận khối lượng nhập', NULL, 0, NULL, N'Loại công thức (Màn hình Cập nhật tiêu chuẩn - QCF1001)'
EXEC AddDataMasterERP9 N'QCT0099', N'CALCULATETYPE', N'CreditQuantity', NULL, 1, N'Ghi nhận khối lượng tiêu hao', NULL, 0, NULL, N'Loại công thức (Màn hình Cập nhật tiêu chuẩn - QCF1001)'
EXEC AddDataMasterERP9 N'QCT0099', N'CALCULATETYPE', N'RevokeQuantity', NULL, 1, N'Ghi nhận khối lượng xé bỏ', NULL, 0, NULL, N'Loại công thức (Màn hình Cập nhật tiêu chuẩn - QCF1001)'
EXEC AddDataMasterERP9 N'QCT0099', N'CALCULATETYPE', N'ReturnQuantity', NULL, 1, N'Ghi nhận khối lượng trả', NULL, 0, NULL, N'Loại công thức (Màn hình Cập nhật tiêu chuẩn - QCF1001)'
EXEC AddDataMasterERP9 N'QCT0099', N'CALCULATETYPE', N'EndQuantity', NULL, 1, N'Ghi nhận khối lượng tồn cuối', NULL, 0, NULL, N'Loại công thức (Màn hình Cập nhật tiêu chuẩn - QCF1001)'

EXEC AddDataMasterERP9 N'MT0099', N'StuctureType', N'0', NULL, 0, N'Thành phẩm', N'Product', 0, NULL, N'Loại cấu trúc (Danh mục cấu trúc sản phẩm - MF2110)'
EXEC AddDataMasterERP9 N'MT0099', N'StuctureType', N'1', NULL, 1, N'Bán thành phẩm', N'Semi-product', 0, NULL, N'Loại cấu trúc (Danh mục cấu trúc sản phẩm - MF2110)'
EXEC AddDataMasterERP9 N'MT0099', N'StuctureType', N'2', NULL, 2, N'Nguyên vật liệu', N'Material', 0, NULL, N'Loại cấu trúc (Danh mục cấu trúc sản phẩm - MF2110)'

EXEC AddDataMasterERP9 N'QCT0099', N'Handling', N'0', NULL, 0, N'Nhập kho', N'Import warehouse', 0, NULL, N'Xử lý - Phiếu Quản lý chất lượng đầu Ca - QCF2001'
EXEC AddDataMasterERP9 N'QCT0099', N'Handling', N'1', NULL, 1, N'Xuất kho', N'Export warehouse', 0, NULL, N'Xử lý - Phiếu Quản lý chất lượng đầu Ca - QCF2001'
EXEC AddDataMasterERP9 N'QCT0099', N'Handling', N'2', NULL, 2, N'Hủy', N'Cancel', 0, NULL, N'Xử lý - Phiếu Quản lý chất lượng đầu Ca - QCF2001'
EXEC AddDataMasterERP9 N'QCT0099', N'Handling', N'3', NULL, 2, N'Khác', N'Others', 0, NULL, N'Xử lý - Phiếu Quản lý chất lượng đầu Ca - QCF2001'
-- Thêm cho EXEDY
IF EXISTS(SELECT TOP 1 1 FROM CustomerIndex WITH(NOLOCK) WHERE CustomerName = 151)
BEGIN
EXEC AddDataMasterERP9 N'QCT0099', N'MethodTest', N'0', NULL, 0, N'Sản xuất hàng loạt', N'Sản xuất hàng loạt', 0, NULL, N'Phương pháp kiểm thử - Phiếu Quản lý chất lượng đầu Ca - QCF2001'
EXEC AddDataMasterERP9 N'QCT0099', N'MethodTest', N'1', NULL, 1, N'Lần đầu', N'Lần đầu', 0, NULL, N'Phương pháp kiểm thử - Phiếu Quản lý chất lượng đầu Ca - QCF2001'
EXEC AddDataMasterERP9 N'QCT0099', N'MethodTest', N'2', NULL, 2, N'Làm mẫu', N'Làm mẫu', 0, NULL, N'Phương pháp kiểm thử - Phiếu Quản lý chất lượng đầu Ca - QCF2001'
END
ELSE
BEGIN
EXEC AddDataMasterERP9 N'QCT0099', N'MethodTest', N'0', NULL, 0, N'Mẫu thử', N'Mẫu thử', 0, NULL, N'Phương pháp kiểm thử - Phiếu Quản lý chất lượng đầu Ca - QCF2001'
EXEC AddDataMasterERP9 N'QCT0099', N'MethodTest', N'1', NULL, 1, N'Tất cả', N'Tất cả', 0, NULL, N'Phương pháp kiểm thử - Phiếu Quản lý chất lượng đầu Ca - QCF2001'
END
EXEC AddDataMasterERP9 N'QCT0099', N'Delivered', N'0', NULL, 0, N'Đã giao khách hàng', N'Đã giao khách hàng', 0, NULL, N'Trạng thái giao hàng'
EXEC AddDataMasterERP9 N'QCT0099', N'Delivered', N'1', NULL, 1, N'Chưa giao khách hàng', N'Chưa giao khách hàng', 0, NULL, N'Trạng thái giao hàng'
IF EXISTS(SELECT TOP 1 1 FROM CustomerIndex WITH(NOLOCK) WHERE CustomerName = 164)
BEGIN
EXEC AddDataMasterERP9 N'QCT0099', N'TemplatePrint.QCF2003', N'QCF2000Report1', NULL, 1, N'Mẫu in 1:Hàng Silicon', N'Hàng Silicon', 0, NULL, N'Mẫu in 1(Màn hình QCF2003)'
EXEC AddDataMasterERP9 N'QCT0099', N'TemplatePrint.QCF2003', N'QCF2000Report2', NULL, 2, N'Mẫu in 2:Hàng mạ sắt', N'Hàng mạ sắt', 0, NULL, N'Mẫu in 2(Màn hình QCF2003)'
EXEC AddDataMasterERP9 N'QCT0099', N'TemplatePrint.QCF2003', N'QCF2000Report3', NULL, 3, N'Mẫu in 3:Hàng nhựa', N'Hàng nhựa', 0, NULL, N'Mẫu in 3(Màn hình QCF2003)'
EXEC AddDataMasterERP9 N'QCT0099', N'TemplatePrint.QCF2003', N'QCF2000Report4', NULL, 4, N'Mẫu in 4:Xen bao', N'Xen bao', 0, NULL, N'Mẫu in 4(Màn hình QCF2003)'
EXEC AddDataMasterERP9 N'QCT0099', N'TemplatePrint.QCF2003', N'QCF2000Report5', NULL, 5, N'Mẫu in 5:Thỉa xin', N'Thỉa xin', 0, NULL, N'Mẫu in 5(Màn hình QCF2003)'
EXEC AddDataMasterERP9 N'QCT0099', N'TemplatePrint.QCF2003', N'QCF2000Report6', NULL, 6, N'Mẫu in 6:Thành phẩm', N'Thành phẩm', 0, NULL, N'Mẫu in 6(Màn hình QCF2003)'
EXEC AddDataMasterERP9 N'QCT0099', N'TemplatePrint.QCF2003', N'QCF2000Report7', NULL, 7, N'Biểu mẫu QC-KTraVL đến', N'Biểu mẫu QC-KTraVL đến', 0, NULL, N'Mẫu in 7(Màn hình QCF2003)'
END
