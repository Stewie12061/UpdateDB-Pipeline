-- Thêm dữ liệu vào bảng Master

DECLARE
	@ModuleID VARCHAR(50),
	@ScreenID VARCHAR(50),
	@ScreenName NVARCHAR(MAX),
	@ScreenNameE NVARCHAR(MAX),
	@ScreenType TINYINT

SET @ModuleID = N'ASOFTFN'
------------------------------------------------ Thiết lập --------------------------------------------------------
SET @ScreenType = 4



---------------------------------------------- Danh mục ------------------------------------------------------------
SET @ScreenType = 2

SET @ScreenID = N'FNF1000'
SET @ScreenName = N'Danh mục định mức chi phí'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF1020'
SET @ScreenName = N'Danh mục mức độ ưu tiên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF2000'
SET @ScreenName = N'Kế hoạch thu chi'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF2010'
SET @ScreenName = N'Kết quả thu chi thực tế'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

---------------------------------------------- Cập nhật ------------------------------------------------------------
SET @ScreenType = 3

SET @ScreenID = N'FNF1001'
SET @ScreenName = N'Cập nhật định mức chi phí'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF1021'
SET @ScreenName = N'Cập nhật mức độ ưu tiên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF2001'
SET @ScreenName = N'Cập nhật kế hoạch thu chi'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF2011'
SET @ScreenName = N'Cập nhật kết quả thu chi thực tế'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

--SET @ScreenID = N'FNF2013'
--SET @ScreenName = N'Chọn kế hoạch thu chi'
--SET @ScreenNameE = N''
--EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF2008'
SET @ScreenName = N'Cập nhật đợt chi'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF0000'
SET @ScreenName = N'Thiết lập hệ thống'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
---------------------------------------------- Báo cáo ------------------------------------------------------------
SET @ScreenType = 1

SET @ScreenID = N'FNF3001'
SET @ScreenName = N'Báo cáo so sánh giá thu/chi thực tế với kế hoạch'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF3002'
SET @ScreenName = N'Báo cáo so sánh thực chi với ngân sách'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF3003'
SET @ScreenName = N'Báo cáo đánh giá thực hiện kế hoạch'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF3004'
SET @ScreenName = N'Báo cáo tổng hợp dòng tiền theo năm tháng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF3005'
SET @ScreenName = N'Báo cáo kế hoạch thu chi theo ngày'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF3006'
SET @ScreenName = N'Báo cáo tổng hợp kế hoạch thu chi từng dự án'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF3007'
SET @ScreenName = N'Báo cáo tổng hợp thu chi toàn công ty'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF3008'
SET @ScreenName = N'Báo cáo tổng hợp kế hoạch thu chi theo khoản mục dòng tiền'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF3009'
SET @ScreenName = N'Báo cáo tổng hợp thu chi hoạt động chung'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

---------------------------------------------- Xem chi tiết --------------------------------------------------------
SET @ScreenType = 5

SET @ScreenID = N'FNF1002'
SET @ScreenName = N'Xem chi tiết định mức chi phí'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF1021'
SET @ScreenName = N'Cập nhật mức độ ưu tiên'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'FNF2002'
SET @ScreenName = N'Xem chi tiết kế hoạch thu chi'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


SET @ScreenID = N'FNF2012'
SET @ScreenName = N'Xem kết quả thu chi thực tế'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

---------------------------------------------- Chọn --------------------------------------------------------
SET @ScreenType = 4
SET @ScreenID = N'FNF2013'
SET @ScreenName = N'Chọn kế hoạch thu chi'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 4
SET @ScreenID = N'FNF2004'
SET @ScreenName = N'Kế thừa yêu cầu mua hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 4
SET @ScreenID = N'FNF2005'
SET @ScreenName = N'Kế thừa quản lý vay'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 4
SET @ScreenID = N'FNF2006'
SET @ScreenName = N'Kế thừa từ công nợ kế toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 4
SET @ScreenID = N'FNF2007'
SET @ScreenName = N'Kế thừa kế hoạch thu chi phòng ban'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE