-- Thêm dữ liệu vào bảng Master

DECLARE
	@ModuleID VARCHAR(50),
	@ScreenID VARCHAR(50),
	@ScreenName NVARCHAR(MAX),
	@ScreenNameE NVARCHAR(MAX),
	@ScreenType TINYINT

SET @ModuleID = N'ASOFTKPI'

---------------------------------------------- Danh mục ------------------------------------------------------------
SET @ScreenType = 2

SET @ScreenID = N'KPIF1000'
SET @ScreenName = N'Danh mục xếp loại'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1010'
SET @ScreenName = N'Danh mục nhóm chỉ tiêu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1020'
SET @ScreenName = N'Danh mục từ điển chỉ tiêu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1030'
SET @ScreenName = N'Danh mục nguồn đo'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1040'
SET @ScreenName = N'Danh mục đơn vị tính KPI'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1044'
SET @ScreenName = N'Danh mục tham số'
SET @ScreenNameE = N'Catalog parameters'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1047'
SET @ScreenName = N'Danh mục công thức'
SET @ScreenNameE = N'Catalog formula'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1050'
SET @ScreenName = N'Danh mục chỉ tiêu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1060'
SET @ScreenName = N'Danh mục đợt đánh giá'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1070'
SET @ScreenName = N'Danh mục thiết lập bảng đánh giá từng vị trí'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--- Danh Mục quy định thưởng KPIs
SET @ScreenID = N'KPIF1080'
SET @ScreenName = N'Danh mục quy định thưởng KPIs'
SET @ScreenNameE = N'Danh mục quy định thưởng KPIs'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF2000'
SET @ScreenName = N'Danh mục cá nhân tự đánh giá'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF2003'
SET @ScreenName = N'Danh sách kết quả thực hiện KPI'
SET @ScreenNameE = N'List of KPI performance results'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF2010'
SET @ScreenName = N'Danh mục tính thưởng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-- Danh mục quy chuẩn Up-Down đánh giá KPI
SET @ScreenID = N'KPIF2020'
SET @ScreenName = N'Danh mục bảng quy chuẩn Updown đánh giá KPI'
SET @ScreenNameE = N'Danh mục bảng quy chuẩn Updown đánh giá KPI'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--- Danh Mục hệ số tính lương mềm
SET @ScreenID = N'KPIF2030'
SET @ScreenName = N'Danh mục hệ số tính lương mềm'
SET @ScreenNameE = N'Danh mục hệ số tính lương mềm'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-- Danh mục tính lương mềm
SET @ScreenID = N'KPIF2040'
SET @ScreenName = N'Tính lương mềm'
SET @ScreenNameE = N'Tính lương mềm'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

---------------------------------------------- Cập nhật ------------------------------------------------------------
SET @ScreenType = 3

SET @ScreenID = N'KPIF1001'
SET @ScreenName = N'Cập nhật xếp loại'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1011'
SET @ScreenName = N'Cập nhật nhóm chỉ tiêu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1021'
SET @ScreenName = N'Cập nhật từ điển chỉ tiêu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1031'
SET @ScreenName = N'Cập nhật nguồn đo'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1041'
SET @ScreenName = N'Cập nhật đơn vị tính KPI'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1045'
SET @ScreenName = N'Cập nhật tham số tính chỉ tiêu KPI'
SET @ScreenNameE = N'Update KPI parameters calculation'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1048'
SET @ScreenName = N'Cập nhật công thức tính chỉ tiêu KPI'
SET @ScreenNameE = N'Update KPI formula calculation'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1051'
SET @ScreenName = N'Cập nhật chỉ tiêu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1061'
SET @ScreenName = N'Cập nhật đợt đánh giá'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1071'
SET @ScreenName = N'Cập nhật thiết lập bảng đánh giá từng vị trí'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--- Cập nhật quy định thưởng KPIs
SET @ScreenID = N'KPIF1081'
SET @ScreenName = N'Cập nhật quy định thưởng KPIs'
SET @ScreenNameE = N'Cập nhật quy định thưởng KPIs'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF2001'
SET @ScreenName = N'Cập nhật cá nhân tự đánh giá'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF2004'
SET @ScreenName = N'Cập nhật kết quả thực hiện KPI'
SET @ScreenNameE = N'Update KPI performance results'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF2006'
SET @ScreenName = N'Tính kết quả thực hiện chỉ tiêu KPI'
SET @ScreenNameE = N'Calculating results of KPI'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF2011'
SET @ScreenName = N'Cập nhật tính thưởng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-- Cập nhật quy chuẩn Up-Down đánh giá KPI
SET @ScreenID = N'KPIF2021'
SET @ScreenName = N'Cập nhật bảng quy chuẩn Updown đánh giá KPI'
SET @ScreenNameE = N'Cập nhật bảng quy chuẩn Updown đánh giá KPI'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--- Cập nhật hệ số tính lương mềm
SET @ScreenID = N'KPIF2031'
SET @ScreenName = N'Cập nhật hệ số tính lương mềm'
SET @ScreenNameE = N'Cập nhật hệ số tính lương mềm'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-- Tính Lương mềm
SET @ScreenID = N'KPIF2041'
SET @ScreenName = N'Tính lương mềm'
SET @ScreenNameE = N'Tính lương mềm'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-- Chốt kỳ lương
SET @ScreenID = N'KPIF2043'
SET @ScreenName = N'Chốt kỳ lương'
SET @ScreenNameE = N'Chốt kỳ lương'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-- Thông tin kỳ lương
SET @ScreenID = N'KPIF2044'
SET @ScreenName = N'Thông tin kỳ lương'
SET @ScreenNameE = N'Thông tin kỳ lương'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

------------------------------------------------ Thiết lập --------------------------------------------------------
SET @ScreenType = 4

SET @ScreenID = N'KPIF9001'
SET @ScreenName = N'Chọn từ điển chỉ tiêu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF9002'
SET @ScreenName = N'Chọn chỉ tiêu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF10481'
SET @ScreenName = N'Chọn tham số cho công thức tính chỉ tiêu KPI'
SET @ScreenNameE = N'Select parameters for KPI calculation formulas'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF9003'
SET @ScreenName = N'Chọn nhân viên'
SET @ScreenNameE = N'Chọn nhân viên'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, 114, 'ERP9', NULL

---------------------------------------------- Báo cáo ------------------------------------------------------------
SET @ScreenType = 1

-- Báo cáo danh sách chỉ tiêu
SET @ScreenID = N'KPIF3001'
SET @ScreenName = N'Báo cáo danh sách chỉ tiêu'
SET @ScreenNameE = N'Báo cáo danh sách chỉ tiêu'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-- Báo cáo bảng đánh giá KPIs
SET @ScreenID = N'KPIF3002'
SET @ScreenName = N'Báo cáo bảng đánh giá KPI'
SET @ScreenNameE = N'Báo cáo bảng đánh giá KPI'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-- Báo cáo bảng đánh giá KPIs
SET @ScreenID = N'KPIF3002_DTI'
SET @ScreenName = N'Báo cáo bảng đánh giá KPI'
SET @ScreenNameE = N'Báo cáo bảng đánh giá KPI'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, 114, 'ERP9', NULL

-- Báo cáo bảng đánh giá KPIs
SET @ScreenID = N'KPIF3003'
SET @ScreenName = N'Báo cáo lương mềm chưa nhận'
SET @ScreenNameE = N'Báo cáo lương mềm chưa nhận'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, 114, 'ERP9', NULL

-- Báo cáo bảng đánh giá KPIs
SET @ScreenID = N'KPIF3004'
SET @ScreenName = N'Báo cáo tổng thu nhập'
SET @ScreenNameE = N'Báo cáo tổng thu nhập'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, 114, 'ERP9', NULL

---------------------------------------------- Xem chi tiết --------------------------------------------------------
SET @ScreenType = 5
SET @ScreenID = N'KPIF1002'
SET @ScreenName = N'Xem chi tiết xếp loại'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1012'
SET @ScreenName = N'Xem chi tiết nhóm chỉ tiêu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1022'
SET @ScreenName = N'Xem chi tiết từ điển chỉ tiêu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1032'
SET @ScreenName = N'Xem chi tiết nguồn đo'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1042'
SET @ScreenName = N'Xem chi tiết đơn vị tính KPI'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1046'
SET @ScreenName = N'Xem chi tiết tham số'
SET @ScreenNameE = N'Parameter details'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1049'
SET @ScreenName = N'Xem chi tiết công thức'
SET @ScreenNameE = N'Formula details'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1052'
SET @ScreenName = N'Xem chi tiết chỉ tiêu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1062'
SET @ScreenName = N'Xem chi tiết đợt đánh giá'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF1072'
SET @ScreenName = N'Xem chi tiết thiết lập bảng đánh giá từng vị trí'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--- Chi tiết quy định thưởng KPIs
SET @ScreenID = N'KPIF1082'
SET @ScreenName = N'Chi tiết quy định thưởng KPIs'
SET @ScreenNameE = N'Chi tiết quy định thưởng KPIs'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF2002'
SET @ScreenName = N'Xem chi tiết cá nhân tự đánh giá'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF2005'
SET @ScreenName = N'Xem chi tiết kết quả thực hiện KPI'
SET @ScreenNameE = N'KPI performance results'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'KPIF2012'
SET @ScreenName = N'Xem chi tiết tính thưởng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-- Xem chi tiết quy chuẩn Up-Down đánh giá KPI
SET @ScreenID = N'KPIF2022'
SET @ScreenName = N'Chi tiết bảng quy chuẩn Updown đánh giá KPI'
SET @ScreenNameE = N'Chi tiết bảng quy chuẩn Updown đánh giá KPI'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--- Chi tiết hệ sồ tính lương mềm
SET @ScreenID = N'KPIF2032'
SET @ScreenName = N'Chi tiết hệ sồ tính lương mềm'
SET @ScreenNameE = N'Chi tiết hệ sồ tính lương mềm'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-- Xem chi tiết tính lương mềm
SET @ScreenID = N'KPIF2042'
SET @ScreenName = N'Chi tiết lương mềm'
SET @ScreenNameE = N'Chi tiết lương mềm'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
