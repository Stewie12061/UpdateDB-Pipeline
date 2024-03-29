-- Create by Khâu Vĩnh Tâm ON 29/05/2020
-- Modify by Trọng Kiên ON 29/06/2020
-- Modify by Lê Hoàng ON 16/11/2020: Kiểm tra insert nếu không tồn tại và cập nhật nếu đã tồn tại.
-- Modify by Đình Ly ON 29/03/2021: Bổ sung thêm dữ liệu phân loại Nguồn hình thành của đề nghị thanh toán.
-- Modify by Tấn Lộc Ly ON 29/07/2021: Bổ sung dữ liệu cho cột CodeMasterName

DECLARE @CodeMaster NVARCHAR(50)
DECLARE @TableID VARCHAR(50) = 'BEMT0099'

----------------------------------------- Loại đề nghị -------------------------------------
SET @CodeMaster = 'ProposalTypeID'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'DNTT', 0, 1, N'Đề nghị thanh toán', N'', 0, NULL, N'Mã loại đề nghị (Màn hình Danh sách phiếu DNTT/DNTTTU/DNTU - BEMF2000)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'DNTU', 0, 2, N'Đề nghị tạm ứng', N'', 0, NULL, N'Mã loại đề nghị (Màn hình Danh sách phiếu DNTT/DNTTTU/DNTU - BEMF2000)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'DNTTTU', 0, 3, N'Đề nghị thanh toán tạm ứng', N'', 0, NULL, N'Mã loại đề nghị (Màn hình Danh sách phiếu DNTT/DNTTTU/DNTU - BEMF2000)'

----------------------------------------- Loại công tác -------------------------------------
SET @CodeMaster = 'TypeBSTrip'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'1', 0, 1, N'Công tác trong nước', N'Domestic Business', 0, NULL, N'Loại công tác (Màn hình Danh mục Đơn xin duyệt công tác - nghỉ phép về nước - BEMF2010)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'2', 0, 2, N'Công tác nước ngoài', N'Foreign Business', 0, NULL, N'Loại công tác (Màn hình Danh mục Đơn xin duyệt công tác - nghỉ phép về nước - BEMF2010)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'3', 0, 3, N'Về nước', N'Go home', 0, NULL, N'Loại công tác (Màn hình Danh mục Đơn xin duyệt công tác - nghỉ phép về nước - BEMF2010)'

----------------------------------------- Loại hình -------------------------------------
SET @CodeMaster = 'TypePriority'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'1', 0, 1, N'Gấp', N'High Priority', 0, NULL, N'Loại hình (Màn hình Danh mục Đơn xin duyệt công tác - nghỉ phép về nước - BEMF2010)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'2', 0, 2, N'Thường', N'Normal Priority', 0, NULL, N'Loại hình (Màn hình Danh mục Đơn xin duyệt công tác - nghỉ phép về nước - BEMF2010)'

----------------------------------------- Loại chứng từ kế thừa -------------------------------------
SET @CodeMaster = 'VoucherTypeInherit'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'1', 0, 1, N'Phiếu mua hàng', N'', 0, NULL, N'Loại chứng từ (Màn hình Kế thừa phiếu mua hàng / bút toán tổng hợp - BEMF2003)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'2', 0, 2, N'Bút toán tổng hợp', N'', 0, NULL, N'Loại chứng từ (Màn hình Kế thừa phiếu mua hàng / bút toán tổng hợp - BEMF2003)'

----------------------------------------- Nội dung chi phí khác -------------------------------------
SET @CodeMaster = 'ContentCosts'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'KS', 1, 1, N'Khách sạn', N'', 0, NULL, N'Nội dung chi phí (Màn hình Danh mục dịch nội dung chứng từ - BEMF2050)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'DL', 2, 2, N'Đi lại', N'', 0, NULL, N'Nội dung chi phí (Màn hình Danh mục dịch nội dung chứng từ - BEMF2050)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'KC', 3, 3, N'Khác', N'', 0, NULL, N'Nội dung chi phí (Màn hình Danh mục dịch nội dung chứng từ - BEMF2050)'

----------------------------------------- Chế độ xem -------------------------------------
SET @CodeMaster = 'SearchMode'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'1', 0, 1, N'Tra cứu', N'', 0, NULL, N'Chế độ xem (Màn hình Danh sách phiếu DNTT/DNTTTU/DNTU - BEMF2000)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'2', 0, 2, N'Xét duyệt', N'', 0, NULL, N'Chế độ xem (Màn hình Danh sách phiếu DNTT/DNTTTU/DNTU - BEMF2000)'

----------------------------------------- Phân loại Nguồn hình thành của đề nghị thanh toán -------------------------------------
SET @CodeMaster = 'Formation'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'CP', 0, 1, N'Chi phí', N'', 0, NULL, N'Nguồn hình thành (Màn hình  Danh sách phiếu DNTT/DNTTTU/DNTU - BEMF2000)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'PMH', 0, 2, N'Kế thừa công nợ', N'', 0, NULL, N'Nguồn hình thành (Màn hình  Danh sách phiếu DNTT/DNTTTU/DNTU - BEMF2000)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'DNCT', 0, 3, N'Kế thừa phiếu công tác', N'', 0, NULL, N'Nguồn hình thành (Màn hình  Danh sách phiếu DNTT/DNTTTU/DNTU - BEMF2000)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'DC/TT', 0, 4, N'Đặt cọc/trả trước', N'', 0, NULL, N'Nguồn hình thành (Màn hình  Danh sách phiếu DNTT/DNTTTU/DNTU - BEMF2000)'

----------------------------------------- Trạng thái -------------------------------------
SET @CodeMaster = 'Status'
EXEC AddDataMasterERP9 @TableID, N'Status', N'0', 0, 1, N'Chờ duyệt', N'承認待ち', 0, NULL, N'Trạng thái'
EXEC AddDataMasterERP9 @TableID, N'Status', N'1', 1, 2, N'Duyệt', N'承認', 0, NULL, N'Trạng thái'
EXEC AddDataMasterERP9 @TableID, N'Status', N'2', 2, 3, N'Từ chối', N'否認', 0, NULL, N'Trạng thái'

