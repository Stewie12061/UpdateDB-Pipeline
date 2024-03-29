-- Thêm dữ liệu vào bảng Master

DECLARE
	@ModuleID VARCHAR(50),
	@ScreenID VARCHAR(50),
	@ScreenName NVARCHAR(MAX),
	@ScreenNameE NVARCHAR(MAX),
	@ScreenType TINYINT

SET @ModuleID = N'ASOFTBI'
------------------------------------------------ Thiết lập --------------------------------------------------------
SET @ScreenType = 4

SET @ScreenID = N'BF0000'
SET @ScreenName = N'DrashBoard'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

---------------------------------------------- Danh mục ------------------------------------------------------------
SET @ScreenType = 2


---------------------------------------------- Cập nhật ------------------------------------------------------------
SET @ScreenType = 3

---------------------------------------------- Báo cáo ------------------------------------------------------------
SET @ScreenType = 1

SET @ScreenID = N'BF3000'
SET @ScreenName = N'Báo cáo Tài chính'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3001'
SET @ScreenName = N'Biểu đồ tình hình tài chính'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3002'
SET @ScreenName = N'Biểu đồ tình hình doanh thu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3003'
SET @ScreenName = N'Báo cáo tồn kho bình quân'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3004'
SET @ScreenName = N'Biểu đồ doanh số khu vực'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3005'
SET @ScreenName = N'Biểu đồ sản lượng sản xuất'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3006'
SET @ScreenName = N'Biểu đồ số lượng bán và doanh số bán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3007'
SET @ScreenName = N'Báo cáo tổng hợp'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'BF3008'
SET @ScreenName = N'Báo cáo hoạt động kinh doanh'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'BF3009'
SET @ScreenName = N'Báo cáo phân tích hàng bán chạy'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'BF3010'
SET @ScreenName = N'Báo cáo lượng đơn hàng công ty'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3013'
SET @ScreenName = N'Báo cáo doanh số theo nhóm khách hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3015'
SET @ScreenName = N'Báo cáo doanh số theo nhóm khách hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3016'
SET @ScreenName = N'Báo cáo doanh số bán hàng theo nhà máy'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3011'
SET @ScreenName = N'Báo cáo doanh số theo từng khách hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3017'
SET @ScreenName = N'Báo cáo tỷ lệ chuyển đổi từ Phiếu chào giá sang Đơn hàng bán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


SET @ScreenID = N'BF3012'
SET @ScreenName = N'Báo cáo doanh số trung bình'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3014'
SET @ScreenName = N'Báo cáo doanh số bán hàng theo mặt hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3018'	
SET @ScreenName = N'Báo cáo số dư tiền mặt, tiền gửi ngân hàng'	
SET @ScreenNameE = N'Report cash balance, bank deposit'		
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE	

SET @ScreenID = N'BF3019'	
SET @ScreenName = N'Báo cáo số dư tiền mặt, tiền gửi ngân hàng mẫu 2'	
SET @ScreenNameE = N'Report cash balance, bank deposit form 2'		
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE	

SET @ScreenID = N'BF3020'
SET @ScreenName = N'Báo cáo số dư tài khoản'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3021'
SET @ScreenName = N'Báo cáo tồn kho'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'BF3024'
SET @ScreenName = N'Báo cáo chi tiết chi phí dự án'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3025'
SET @ScreenName = N'Bảng theo dõi định mức Quota'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


SET @ScreenID = N'BF3026'
SET @ScreenName = N'Báo cáo lãi lỗ từng chi nhánh'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3027'
SET @ScreenName = N'Báo cáo lãi lỗ chi nhánh nhiều kỳ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3028'
SET @ScreenName = N'Báo cáo so sánh chi phí chi nhánh nhiều kỳ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3034'
SET @ScreenName = N'Báo cáo SALES'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3900'
SET @ScreenName = N'Báo cáo KQKD theo mã phân tích'
SET @ScreenNameE = N'Báo cáo KQKD theo mã phân tích'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF3035'
SET @ScreenName = N'Biểu đồ SALES'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BFR3004'
SET @ScreenName = N'Biểu đồ doanh số theo khu vực'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

---------------------------------------------- Báo cáo Ngân sách --------------------------------------------------------
SET @ScreenID = N'TF3001'
SET @ScreenName = N'Báo cáo kế hoạch ngân sách trường'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'TF3002'	
SET @ScreenName = N'Báo cáo kế hoạch ngân sách phòng'	
SET @ScreenNameE = NULL	
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE	

SET @ScreenID = N'TF3003'
SET @ScreenName = N'Báo cáo đề nghị thanh toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'TF3004'	
SET @ScreenName = N'Báo cáo so sánh ngân sách kế hoạch và thực tế'	
SET @ScreenNameE = NULL	
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'TF3005'	
SET @ScreenName = N'Báo cáo ngân sách nhu cầu vốn'	
SET @ScreenNameE = NULL	
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, 141, 'ERP9', NULL	

-- Bích Thảo tạo ngày 04/09/2020
SET @ScreenID = N'BF3032'	
SET @ScreenName = N'Báo cáo chi phí'	
SET @ScreenNameE = NULL	
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE	

SET @ScreenID = N'BF3033'
SET @ScreenName = N'Biểu đồ doanh số và số lượng bán ra theo nhóm hàng'
SET @ScreenNameE = NULL
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE	


SET @ScreenID = N'BF3004_VNF'
SET @ScreenName = N'Biểu đồ doanh số khu vực'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

---------------------------------------------- Báo cáo tài chính --------------------------------------------------------
--- Bảng cân đối kế toán
SET @ScreenID = N'AF3001'
SET @ScreenName = N'Bảng cân đối kế toán'
SET @ScreenNameE = N'Bảng cân đối kế toán'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

--- Kết quả sản xuất kinh doanh
SET @ScreenID = N'AF3003'
SET @ScreenName = N'Kết quả sản xuất kinh doanh'
SET @ScreenNameE = N'Kết quả sản xuất kinh doanh'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

--- Báo cáo lưu chuyển tiền tệ
SET @ScreenID = N'AF3004'
SET @ScreenName = N'Báo cáo lưu chuyển tiền tệ'
SET @ScreenNameE = N'Báo cáo lưu chuyển tiền tệ'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

---------------------------------------------- Xem chi tiết --------------------------------------------------------
SET @ScreenType = 5

-------------------------------------Modified by Tấn Thành on 01/09/2020 -------------------------------------------
-------------------------------------- Dữ liệu hiển thị trên DashBoard ---------------------------------------------
SET @ScreenType = 6

SET @ScreenID = N'BID3001'
SET @ScreenName = N'Biểu đồ tình hình tài chính'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BID3002'
SET @ScreenName = N'Biểu đồ tình hình doanh thu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BID3003'
SET @ScreenName = N'Biểu đồ tồn kho bình quân'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BID3004'
SET @ScreenName = N'Biểu đồ tỉ lệ chi phí bán hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-- 16/03/2023 - [Hoài Bảo] - Cập nhật: Bổ sung phân quyền biểu đồ Dashboard Tài chính 
SET @ScreenID = N'BID3010'
SET @ScreenName = N'Biểu đồ lãi lỗ chi nhánh nhiều kỳ'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'BID3011'
SET @ScreenName = N'Biểu đồ so sánh chi phí chi nhánh nhiều kỳ'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'BID3012'
SET @ScreenName = N'Biểu đồ lãi lỗ từng chi nhánh'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'BIDASM01'
SET @ScreenName = N'Biểu đồ tỉ lệ chi phí bán hàng (ASM01)'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BIDASM02'
SET @ScreenName = N'Biểu đồ sản lượng và doanh số bán (ASM02)'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'BIDASM03'
SET @ScreenName = N'Biểu đồ sản lượng và doanh số bán (ASM03)'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'BIDASM04'
SET @ScreenName = N'Biểu đồ sản lượng và doanh số bán (ASM04)'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'BIDASM05'
SET @ScreenName = N'Biểu đồ sản lượng và doanh số bán (ASM05)'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'BIDASM06'
SET @ScreenName = N'Biểu đồ sản lượng và doanh số bán (ASM06)'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'BIDASM07'
SET @ScreenName = N'Biểu đồ sản lượng và doanh số bán (ASM07)'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

--SET @ScreenID = N'BID3005'
--SET @ScreenName = N'Biểu đồ sản lượng sản xuất'
--SET @ScreenNameE = N''
--EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--SET @ScreenID = N'BID3006'
--SET @ScreenName = N'Biểu đồ số lượng bán và doanh số bán'
--SET @ScreenNameE = N''
--EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'BF0000'
SET @ScreenName = N'Dashboard'
SET @ScreenNameE = N'Dashboard'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL