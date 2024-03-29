-- CREATE BY Phan thanh hoàng vũ ON 16/04/2014
-- Modify Thị Phượng Bổ sung POS000010 --Tình trạng phiếu
-- Modify Thị Phượng Bổ sung POS000011 --Bổ sung tình trạng duyệt hàng khuyến mãi Customize MInh Sang
-- Modify by Lê Hoàng ON 16/11/2020 : kiểm tra insert nếu không tồn tại và cập nhật nếu đã tồn tại
-- Modify by Hoài Bảo ON 28/07/2021 : Bổ sung dữ liệu cột [CodeMasterName]
-- Thêm dữ liệu vào bảng Master 

DECLARE @TableID VARCHAR(50) = 'POST0099'
--DELETE FROM POST0099 

-------------------------------------------------Dữ liệu Phân combo phân trang --------------------------------------------------------
--CodeMaster, ID, Description, DescriptionE, Disabled
--EXEC AddDataMasterERP9 @TableID, @CodeMaster, @ID, @ID1, @OrderNo, @Description, @DescriptionE, @Disabled, @LanguageID

EXEC AddDataMasterERP9 @TableID, 'POS000001',1, NULL, NULL, N'10', N'10', 0, NULL, N'Dữ liệu Phân combo phân trang'
EXEC AddDataMasterERP9 @TableID, 'POS000001',2, NULL, NULL, N'25', N'25', 0, NULL, N'Dữ liệu Phân combo phân trang'
EXEC AddDataMasterERP9 @TableID, 'POS000001',3, NULL, NULL, N'50', N'50', 0, NULL, N'Dữ liệu Phân combo phân trang'
EXEC AddDataMasterERP9 @TableID, 'POS000001',4, NULL, NULL, N'100', N'100', 0, NULL, N'Dữ liệu Phân combo phân trang'

-------------------------------------------------Dữ liệu combo load thiết lập mã hội viên tăng tự động --------------------------------

EXEC AddDataMasterERP9 @TableID, 'POS000002',0, NULL, NULL, N'NSSS', N'NSSS', 0, NULL, N'Dữ liệu combo load thiết lập mã hội viên tăng tự động'
EXEC AddDataMasterERP9 @TableID, 'POS000002',1, NULL, NULL, N'SNSS', N'SNSS', 0, NULL, N'Dữ liệu combo load thiết lập mã hội viên tăng tự động'
EXEC AddDataMasterERP9 @TableID, 'POS000002',2, NULL, NULL, N'SSNS', N'SSNS', 0, NULL, N'Dữ liệu combo load thiết lập mã hội viên tăng tự động'
EXEC AddDataMasterERP9 @TableID, 'POS000002',3, NULL, NULL, N'SSSN', N'SSSN', 0, NULL, N'Dữ liệu combo load thiết lập mã hội viên tăng tự động'

------------------------------------------------Dữ liệu combo load thiết lập phân loại giá bán------------------------------------------

EXEC AddDataMasterERP9 @TableID, 'POS000003',1, NULL, NULL, N'Giá bán 01', N'SalePrice01', 0, NULL, N'Bán hàng theo cột giá (Màn hình Cập nhật Event - POSF1001)'
EXEC AddDataMasterERP9 @TableID, 'POS000003',2, NULL, NULL, N'Giá bán 02', N'SalePrice02', 0, NULL, N'Bán hàng theo cột giá (Màn hình Cập nhật Event - POSF1001)'
EXEC AddDataMasterERP9 @TableID, 'POS000003',3, NULL, NULL, N'Giá bán 03', N'SalePrice03', 0, NULL, N'Bán hàng theo cột giá (Màn hình Cập nhật Event - POSF1001)'
EXEC AddDataMasterERP9 @TableID, 'POS000003',4, NULL, NULL, N'Giá bán 04', N'SalePrice04', 0, NULL, N'Bán hàng theo cột giá (Màn hình Cập nhật Event - POSF1001)'
EXEC AddDataMasterERP9 @TableID, 'POS000003',5, NULL, NULL, N'Giá bán 05', N'SalePrice05', 0, NULL, N'Bán hàng theo cột giá (Màn hình Cập nhật Event - POSF1001)'

------------------------------------------------Phân loại trạng thái hoạt động của thẻ hội viên------------------------------------------

EXEC AddDataMasterERP9 @TableID, 'POS000004',1, NULL, NULL, N'Không sử dụng', N'', 0, NULL, N'Phân loại trạng thái hoạt động của thẻ hội viên'
EXEC AddDataMasterERP9 @TableID, 'POS000004',2, NULL, NULL, N'Sử dụng', N'', 0, NULL, N'Phân loại trạng thái hoạt động của thẻ hội viên'

------------------------------------------------Phân loại trạng thái hoạt động của phiếu xuất hàng------------------------------------------

EXEC AddDataMasterERP9 @TableID, 'POS000005',0, NULL, NULL, N'Chờ duyệt', N'', 0, NULL, N'Phân loại trạng thái hoạt động của phiếu xuất hàng'
EXEC AddDataMasterERP9 @TableID, 'POS000005',1, NULL, NULL, N'Đã duyệt', N'', 0, NULL, N'Phân loại trạng thái hoạt động của phiếu xuất hàng'
EXEC AddDataMasterERP9 @TableID, 'POS000005',2, NULL, NULL, N'Đang duyệt', N'', 0, NULL, N'Phân loại trạng thái hoạt động của phiếu xuất hàng'
------------------------------------------------Phân loại trạng thái hoạt động của phiếu nhập hàng------------------------------------------

EXEC AddDataMasterERP9 @TableID, 'POS000006',0, NULL, NULL, N'Chưa hoàn tất', N'', 0, NULL, N'Phân loại trạng thái hoạt động của phiếu nhập hàng'
EXEC AddDataMasterERP9 @TableID, 'POS000006',1, NULL, NULL, N'Hoàn tất', N'', 0, NULL, N'Phân loại trạng thái hoạt động của phiếu nhập hàng'

------------------------------------------------Phân loại kiểu xuất cho phiếu xuất------------------------------------------

EXEC AddDataMasterERP9 @TableID, 'POS000007',0, NULL, NULL, N'Điều chuyển hàng qua shop', N'', 0, NULL, N'Phân loại kiểu xuất cho phiếu xuất'
EXEC AddDataMasterERP9 @TableID, 'POS000007',1, NULL, NULL, N'Xuất trả hàng cho công ty', N'', 0, NULL, N'Phân loại kiểu xuất cho phiếu xuất'

------------------------------------------------Giới tính------------------------------------------

EXEC AddDataMasterERP9 @TableID, 'POS000009',0, NULL, NULL, N'Nam', N'Male', 0, NULL, N'Giới tính'
EXEC AddDataMasterERP9 @TableID, 'POS000009',1, NULL, NULL, N'Nữ', N'Female', 0, NULL, N'Giới tính'
EXEC AddDataMasterERP9 @TableID, 'POS000009',9, NULL, NULL, N'Khác', N'Other', 0, NULL, N'Giới tính'

------------------------------------------------Phân loại phiếu xuất-----------------------------------------
EXEC AddDataMasterERP9 @TableID, 'POS000010',0, NULL, NULL, N'Xuất đề nghị/ trả hàng', N'', 0, NULL, N'Phân loại phiếu xuất'
EXEC AddDataMasterERP9 @TableID, 'POS000010',1, NULL, NULL, N'Xuất bán/ đổi hàng', N'', 0, NULL, N'Phân loại phiếu xuất'
EXEC AddDataMasterERP9 @TableID, 'POS000010',2, NULL, NULL, N'Xuất hủy', N'', 0, NULL, N'Phân loại phiếu xuất'
------------------------------------------------Tình trang duyệt-----------------------------------------
EXEC AddDataMasterERP9 @TableID, 'POS000011',0, NULL, NULL, N'Chưa duyệt', N'', 0, NULL, N'Tình trạng duyệt hàng khuyến mãi Customize Minh Sang'
EXEC AddDataMasterERP9 @TableID, 'POS000011',1, NULL, NULL, N'Đã duyệt', N'', 0, NULL, N'Tình trạng duyệt hàng khuyến mãi Customize Minh Sang'
EXEC AddDataMasterERP9 @TableID, 'POS000011',2, NULL, NULL, N'Đơn hàng chưa lưu', N'', 0, NULL, N'Tình trạng duyệt hàng khuyến mãi Customize Minh Sang'
EXEC AddDataMasterERP9 @TableID, 'POS000011',3, NULL, NULL, N'Không duyệt', N'', 0, NULL, N'Tình trạng duyệt hàng khuyến mãi Customize Minh Sang'
IF EXISTS (SELECT TOP 1 1 FROM POST0099 WHERE CodeMaster = 'POS000011' and ID = 2 and Description = N'Đơn hàng chưa lưu') 
	Update POST0099 set Description = N'Đang duyệt'
	where CodeMaster = 'POS000011' and ID = 2 and Disabled = 0 and Description = N'Đơn hàng chưa lưu'
------Các Loại phiếu đề nghị ------------------------
EXEC AddDataMasterERP9 @TableID, 'POS000012',0, NULL, NULL, N'Chi tiền trả cọc', N'', 0, NULL, N'Loại đề nghị (Màn hình Danh mục phiếu đề nghị chi - POSF2020)'
EXEC AddDataMasterERP9 @TableID, 'POS000012',1, NULL, NULL, N'Chi tiền trả hàng', N'', 0, NULL, N'Loại đề nghị (Màn hình Danh mục phiếu đề nghị chi - POSF2020)'
EXEC AddDataMasterERP9 @TableID, 'POS000012',2, NULL, NULL, N'Chi tiền đổi hàng', N'', 0, NULL, N'Loại đề nghị (Màn hình Danh mục phiếu đề nghị chi - POSF2020)'
------Các Loại duyệt phiếu chuẩn ------------------------
EXEC AddDataMasterERP9 @TableID, 'POS000013',0, NULL, NULL, N'Chờ duyệt', N'', 0, NULL, N'Trạng thái duyệt (Màn hình Danh mục phiếu đề nghị chi - POSF2020)'
EXEC AddDataMasterERP9 @TableID, 'POS000013',1, NULL, NULL, N'Duyệt', N'', 0, NULL, N'Trạng thái duyệt (Màn hình Danh mục phiếu đề nghị chi - POSF2020)'
EXEC AddDataMasterERP9 @TableID, 'POS000013',2, NULL, NULL, N'Từ chối', N'', 0, NULL, N'Trạng thái duyệt (Màn hình Danh mục phiếu đề nghị chi - POSF2020)'
-----Trạng thái xuất hóa đơn ------------------------
EXEC AddDataMasterERP9 @TableID, 'POS000014',0, NULL, NULL, N'Chưa xuất', N'', 0, NULL, N'Xuất hóa đơn (Màn hình Danh mục phiếu đề nghị xuất hóa đơn - POSF2030)'
EXEC AddDataMasterERP9 @TableID, 'POS000014',1, NULL, NULL, N'Đã xuất', N'', 0, NULL, N'Xuất hóa đơn (Màn hình Danh mục phiếu đề nghị xuất hóa đơn - POSF2030)'
------Các trạng thái hàng hóa ------------------------
EXEC AddDataMasterERP9 @TableID, 'POS000015',0, NULL, NULL, N'Hàng mới', N'New', 0, NULL, N'Các trạng thái hàng hóa'
EXEC AddDataMasterERP9 @TableID, 'POS000015',1, NULL, NULL, N'Hàng trưng bày', N'Display', 0, NULL, N'Các trạng thái hàng hóa'
EXEC AddDataMasterERP9 @TableID, 'POS000015',2, NULL, NULL, N'Hàng hỏng', N'Broken', 0, NULL, N'Các trạng thái hàng hóa'
------Loại phiếu của POS (IN báo cáo OKIA) ------------------------
EXEC AddDataMasterERP9 @TableID, 'POS000016',1, NULL, NULL, N'Phiếu cọc', N'Deposit', 0, NULL, N'Loại phiếu (Màn hình Báo cáo tồn theo dõi nộp tiền TTTM - AEON - POSF3022)'
EXEC AddDataMasterERP9 @TableID, 'POS000016',2, NULL, NULL, N'Phiếu bán hàng', N'Invoice', 0, NULL, N'Loại phiếu (Màn hình Báo cáo tồn theo dõi nộp tiền TTTM - AEON - POSF3022)'
EXEC AddDataMasterERP9 @TableID, 'POS000016',3, NULL, NULL, N'Phiếu thu', N'Reciept', 0, NULL, N'Loại phiếu (Màn hình Báo cáo tồn theo dõi nộp tiền TTTM - AEON - POSF3022)'
------Loại phiếu của POS (Danh sach phieu ban hang) ------------------------
EXEC AddDataMasterERP9 @TableID, 'POS000017',1, NULL, NULL, N'Phiếu bán hàng', N'Invoice', 0, NULL, N'Loại phiếu của POS (Danh sách phiếu bán hàng)'
EXEC AddDataMasterERP9 @TableID, 'POS000017',2, NULL, NULL, N'Phiếu trả hàng', N'Return', 0, NULL, N'Loại phiếu của POS (Danh sách phiếu bán hàng)'
EXEC AddDataMasterERP9 @TableID, 'POS000017',3, NULL, NULL, N'Phiếu đổi hàng', N'Change', 0, NULL, N'Loại phiếu của POS (Danh sách phiếu bán hàng)'


------Các Loại trạng thái giao hàng OKIA (Báo cáo lịch trình giao hàng và thu tiền) ------------------------
EXEC AddDataMasterERP9 @TableID, 'POS000018',0, NULL, NULL, N'Chưa giao hàng', N'', 0, NULL, N'Tình trạng (Màn hình Báo cáo lịch trình giao hàng và thu tiền - POSF3027)'
EXEC AddDataMasterERP9 @TableID, 'POS000018',1, NULL, NULL, N'Đang giao hàng', N'', 0, NULL, N'Tình trạng (Màn hình Báo cáo lịch trình giao hàng và thu tiền - POSF3027)'
EXEC AddDataMasterERP9 @TableID, 'POS000018',2, NULL, NULL, N'Đã giao hàng', N'', 0, NULL, N'Tình trạng (Màn hình Báo cáo lịch trình giao hàng và thu tiền - POSF3027)'
EXEC AddDataMasterERP9 @TableID, 'POS000018',3, NULL, NULL, N'Đã nhận tiền', N'', 0, NULL, N'Tình trạng (Màn hình Báo cáo lịch trình giao hàng và thu tiền - POSF3027)'
EXEC AddDataMasterERP9 @TableID, 'POS000018',4, NULL, NULL, N'Hoàn tất', N'', 0, NULL, N'Tình trạng (Màn hình Báo cáo lịch trình giao hàng và thu tiền - POSF3027)'


------Các Loại trạng thái OKIA (Nhập kho) ------------------------
EXEC AddDataMasterERP9 @TableID, 'POS000019',0, NULL, NULL, N'Nhập hàng bán bị trả lại', N'', 0, NULL, N'Tình trạng (Màn hình Bảng kê phiếu nhập - POSF3028)'
EXEC AddDataMasterERP9 @TableID, 'POS000019',1, NULL, NULL, N'Nhập đổi', N'', 0, NULL, N'Tình trạng (Màn hình Bảng kê phiếu nhập - POSF3028)'
EXEC AddDataMasterERP9 @TableID, 'POS000019',2, NULL, NULL, N'Nhập điều chuyển', N'', 0, NULL, N'Tình trạng (Màn hình Bảng kê phiếu nhập - POSF3028)'
EXEC AddDataMasterERP9 @TableID, 'POS000019',3, NULL, NULL, N'Nhập khác', N'', 0, NULL, N'Tình trạng (Màn hình Bảng kê phiếu nhập - POSF3028)'

------Các Loại trạng thái OKIA (Xuất kho) ------------------------
EXEC AddDataMasterERP9 @TableID, 'POS000020',0, NULL, NULL, N'Xuất bán', N'', 0, NULL, N'Tình trạng (Màn hình Bảng kê phiếu xuất - POSF3029)'
EXEC AddDataMasterERP9 @TableID, 'POS000020',1, NULL, NULL, N'Xuất đổi', N'', 0, NULL, N'Tình trạng (Màn hình Bảng kê phiếu xuất - POSF3029)'
EXEC AddDataMasterERP9 @TableID, 'POS000020',2, NULL, NULL, N'Xuất điều chuyển', N'', 0, NULL, N'Tình trạng (Màn hình Bảng kê phiếu xuất - POSF3029)'
EXEC AddDataMasterERP9 @TableID, 'POS000020',3, NULL, NULL, N'Xuất khác', N'', 0, NULL, N'Tình trạng (Màn hình Bảng kê phiếu xuất - POSF3029)'