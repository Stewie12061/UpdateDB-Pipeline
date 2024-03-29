-- Thêm dữ liệu vào bảng Master

DECLARE
	@ModuleID VARCHAR(50),
	@ScreenID VARCHAR(50),
	@ScreenName NVARCHAR(MAX),
	@ScreenNameE NVARCHAR(MAX),
	@ScreenType TINYINT

SET @ModuleID = N'ASOFTQC'

-----------Hệ thống----------------------------
SET @ScreenType = 3
SET @ScreenID = N'QCF0000'
SET @ScreenName = N'Thiết lập hệ thống'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
 
-----------Tiện ích----------------------------

SET @ScreenType = 2
SET @ScreenID = N'QCF00011'
SET @ScreenName = N'Danh mục tạm chọn thông tin đầu ca'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'QCF00012'
SET @ScreenName = N'Chọn thông tin đầu ca'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Danh mục----------------------------
SET @ScreenType = 2
SET @ScreenID = N'MF21101'
SET @ScreenName = N'Danh mục cấu trúc sản phẩm'
SET @ScreenNameE = N'Danh mục cấu trúc sản phẩm'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Danh mục tiêu chuẩn----------------------------
SET @ScreenType = 2
SET @ScreenID = N'QCF1000'
SET @ScreenName = N'Danh mục Tiêu chuẩn'
SET @ScreenNameE = N'Danh mục Tiêu chuẩn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'QCF1001'
SET @ScreenName = N'Cập nhật thông tin Tiêu chuẩn'
SET @ScreenNameE = N'Cập nhật thông tin Tiêu chuẩn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 5
SET @ScreenID = N'QCF1002'
SET @ScreenName = N'Xem thông tin Tiêu chuẩn'
SET @ScreenNameE = N'Xem thông tin Tiêu chuẩn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Danh mục tiêu chuẩn----------------------------
SET @ScreenType = 2
SET @ScreenID = N'QCF1020'
SET @ScreenName = N'Định nghĩa Tiêu chuẩn'
SET @ScreenNameE = N'Định nghĩa Tiêu chuẩn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'QCF1021'
SET @ScreenName = N'Cập nhật thông tin định nghĩa Tiêu chuẩn'
SET @ScreenNameE = N'Cập nhật thông tin định nghĩa Tiêu chuẩn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 5
SET @ScreenID = N'QCF1022'
SET @ScreenName = N'Xem thông tin định nghĩa Tiêu chuẩn'
SET @ScreenNameE = N'Xem thông tin định nghĩa Tiêu chuẩn'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Danh mục lý do----------------------------
SET @ScreenType = 2
SET @ScreenID = N'QCF1030'
SET @ScreenName = N'Danh mục lý do'
SET @ScreenNameE = N'Danh mục lý do'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'QCF1031'
SET @ScreenName = N'Cập nhật lý do'
SET @ScreenNameE = N'Cập nhật lý do'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 5
SET @ScreenID = N'QCF1032'
SET @ScreenName = N'Xem chi tiết lý do'
SET @ScreenNameE = N'Xem chi tiết lý do'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Phiếu nhập đầu ca----------------------------
SET @ScreenType = 2
SET @ScreenID = N'QCF2000'
SET @ScreenName = N'Phiếu nhập đầu ca'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'QCF2001'
SET @ScreenName = N'Cập nhật phiếu nhập đầu ca'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 5
SET @ScreenID = N'QCF2002'
SET @ScreenName = N'Xem chi tiết phiếu nhập đầu ca'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Phiếu ghi nhận số lượng thành phẩm----------------------------
SET @ScreenType = 2
SET @ScreenID = N'QCF2010'
SET @ScreenName = N'Phiếu ghi nhận số lượng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'QCF2011'
SET @ScreenName = N'Cập nhật phiếu ghi nhận số lượng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 5
SET @ScreenID = N'QCF2012'
SET @ScreenName = N'Xem chi tiết phiếu ghi nhận số lượng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Phiếu xử lý lỗi thành phẩm----------------------------
SET @ScreenType = 2
SET @ScreenID = N'QCF2020'
SET @ScreenName = N'Phiếu xử lý lỗi thành phẩm'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'QCF2021'
SET @ScreenName = N'Cập nhật phiếu xử lý hàng lỗi'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 5
SET @ScreenID = N'QCF2022'
SET @ScreenName = N'Xem chi tiết phiếu xử lý hàng lỗi'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Phiếu nhập thông số kỹ thuật----------------------------
SET @ScreenType = 2
SET @ScreenID = N'QCF2030'
SET @ScreenName = N'Phiếu nhập thông số kỹ thuật'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'QCF2031'
SET @ScreenName = N'Cập nhật phiếu thông số kỹ thuật'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 5
SET @ScreenID = N'QCF2032'
SET @ScreenName = N'Xem chi tiết phiếu thông số kỹ thuật'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Phiếu nhập thông số vận hành máy----------------------------
SET @ScreenType = 2
SET @ScreenID = N'QCF2040'
SET @ScreenName = N'Phiếu nhập thông số vận hành máy'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'QCF2041'
SET @ScreenName = N'Cập nhật phiếu thông số vận hành máy'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 5
SET @ScreenID = N'QCF2042'
SET @ScreenName = N'Xem chi tiết phiếu thông số vận hành máy'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Phiếu nhập nguyên vật liệu----------------------------
SET @ScreenType = 2
SET @ScreenID = N'QCF2050'
SET @ScreenName = N'Phiếu nhập nguyên vật liệu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'QCF2051'
SET @ScreenName = N'Cập nhật phiếu nguyên vật liệu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 5
SET @ScreenID = N'QCF2052'
SET @ScreenName = N'Xem chi tiết phiếu nguyên vật liệu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Màn hình thống kê----------------------------
SET @ScreenType = 2
SET @ScreenID = N'QCF2060'
SET @ScreenName = N'Màn hình thống kê'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'QCF2061'
SET @ScreenName = N'Màn hình thống kê'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'QCF2003'
SET @ScreenName = N'Chọn mẫu in phiếu QC'
SET @ScreenNameE = N'Chọn mẫu in phiếu QC'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Báo cáo----------------------------
SET @ScreenType = 1
SET @ScreenID = N'QCF3001'
SET @ScreenName = N'Biên bản chất lượng'
SET @ScreenNameE = N'Minutes of quality'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 1
SET @ScreenID = N'QCF3002'
SET @ScreenName = N'Theo dõi nguyên vật liệu'
SET @ScreenNameE = N'Tracking of materials'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 1
SET @ScreenID = N'QCF3003'
SET @ScreenName = N'Báo cáo vận hành máy'
SET @ScreenNameE = N'Operating parameters report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 1
SET @ScreenID = N'QCF3004'
SET @ScreenName = N'Biên bản kiểm tra thông tin kỹ thuật máy'
SET @ScreenNameE = N'Minutes of checking machine technical information'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 1
SET @ScreenID = N'QCF3005'
SET @ScreenName = N'Báo cáo sản xuất'
SET @ScreenNameE = N'Production report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 1
SET @ScreenID = N'QCF3006'
SET @ScreenName = N'Biên bản xử lý lỗi'
SET @ScreenNameE = N'Minutes of handling defect'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 1
SET @ScreenID = N'QCF3007'
SET @ScreenName = N'Biểu đồ tiêu chuẩn'
SET @ScreenNameE = N'Chart of standards'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 1
SET @ScreenID = N'QCF3008'
SET @ScreenName = N'In tem'
SET @ScreenNameE = N'Print stamp'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 1
SET @ScreenID = N'QCF3009'
SET @ScreenName = N'Báo cáo theo dõi chất lượng sản phẩm'
SET @ScreenNameE = N'Product quality tracking reports'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 1
SET @ScreenID = N'QCF3010'
SET @ScreenName = N'Báo cáo kiểm tra thông số tiêu chuẩn sản phẩm'
SET @ScreenNameE = N'Product standard parameter test report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 1
SET @ScreenID = N'QCF3011'
SET @ScreenName = N'Báo cáo đánh giá và nguyên nhân lỗi ghi nhận'
SET @ScreenNameE = N'Report reviews and error causes noted'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 1
SET @ScreenID = N'QCF3012'
SET @ScreenName = N'Báo cáo dữ liệu kiểm tra'
SET @ScreenNameE = N'Test data report'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Danh sách tiêu chuẩn----------------------------
SET @ScreenType = 4
SET @ScreenID = N'QCF10001'
SET @ScreenName = N'Chọn tiêu chuẩn'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 4
SET @ScreenID = N'QCF10002'
SET @ScreenName = N'Chọn tiêu chuẩn'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 4
SET @ScreenID = N'QCF10003'
SET @ScreenName = N'Chọn tiêu chuẩn'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 4
SET @ScreenID = N'QCF10004'
SET @ScreenName = N'Chọn tiêu chuẩn'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 4
SET @ScreenID = N'QCF10005'
SET @ScreenName = N'Chọn tiêu chuẩn'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'QCF10006'
SET @ScreenName = N'Chọn tiêu chuẩn'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Chọn tiêu chuẩn----------------------------
SET @ScreenType = 4
SET @ScreenID = N'CMNF9001'
SET @ScreenName = N'Chọn mặt hàng'
SET @ScreenNameE = N'Chọn mặt hàng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 4
SET @ScreenID = N'QCF10007'
SET @ScreenName = N'Chọn tiêu chuẩn'
SET @ScreenNameE = N'Chọn tiêu chuẩn'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, 128, NULL

SET @ScreenType = 4
SET @ScreenID = N'QCF10008'
SET @ScreenName = N'Chọn số batch'
SET @ScreenNameE = N'Chọn số batch'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, 128, NULL

SET @ScreenType = 4
SET @ScreenID = N'QCF10009'
SET @ScreenName = N'Chọn phiếu nhập đầu ca'
SET @ScreenNameE = N'Chọn phiếu nhập đầu ca'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, 128, NULL

SET @ScreenType = 4
SET @ScreenID = N'QCF2009'
SET @ScreenName = N'Chọn phiếu chất lượng'
SET @ScreenNameE = N'Chọn phiếu chất lượng'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, 164, NULL

SET @ScreenType = 4
SET @ScreenID = N'QCF10010'
SET @ScreenName = N'Chọn tiêu chuẩn'
SET @ScreenNameE = N'Chọn tiêu chuẩn'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, NULL

SET @ScreenType = 4
SET @ScreenID = N'QCF10011'
SET @ScreenName = N'Chọn tiêu chuẩn ngoại quan'
SET @ScreenNameE = N'Chọn tiêu chuẩn ngoại quan'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, NULL

SET @ScreenType = 4
SET @ScreenID = N'QCF10012'
SET @ScreenName = N'Chọn mặt hàng (Định nghĩa tiêu chuẩn)'
SET @ScreenNameE = N'Chọn mặt hàng (Định nghĩa tiêu chuẩn)'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, NULL

SET @ScreenType = 4
SET @ScreenID = N'QCF10013'
SET @ScreenName = N'Chọn mặt hàng in tem'
SET @ScreenNameE = N'Chọn mặt hàng in tem'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, NULL

SET @ScreenType = 4
SET @ScreenID = N'QCF10014'
SET @ScreenName = N'Chọn nguyên vật liệu'
SET @ScreenNameE = N'Chọn nguyên vật liệu'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, NULL

---------------------------------------------- Phân quyền màn hình DashBoard ------------------------------------
SET @ScreenType = 6

SET @ScreenID = N'QCF0010'
SET @ScreenName = N'Dashboard Chất lượng đầu ca'
SET @ScreenNameE = N'Dashboard Chất lượng đầu ca'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL

SET @ScreenID = N'QCD0001'
SET @ScreenName = N'Biểu đồ cột hàng NG theo Line'
SET @ScreenNameE = N'NG product column chart by Line'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL

SET @ScreenID = N'QCD0002'
SET @ScreenName = N'Biểu đồ tỷ lệ hàng NG theo Line tháng/ tuần (Dữ liệu cột theo Line)'
SET @ScreenNameE = N'Biểu đồ tỷ lệ hàng NG theo Line tháng/ tuần (Dữ liệu cột theo Line)'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL

SET @ScreenID = N'QCD0003'
SET @ScreenName = N'Biểu đồ tỉ lệ hàng NG các line tháng/tuần'
SET @ScreenNameE = N'Biểu đồ tỉ lệ hàng NG các line tháng/tuần'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL

SET @ScreenID = N'QCD0004'
SET @ScreenName = N'Biểu đồ tỷ lệ hàng NG theo nhà cung cấp'
SET @ScreenNameE = N'Biểu đồ tỷ lệ hàng NG theo nhà cung cấp'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, NULL
