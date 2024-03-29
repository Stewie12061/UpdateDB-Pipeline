-- Thêm dữ liệu vào bảng Master

DECLARE
	@ModuleID VARCHAR(50),
	@ScreenID VARCHAR(50),
	@ScreenName NVARCHAR(MAX),
	@ScreenNameE NVARCHAR(MAX),
	@ScreenType TINYINT

SET @ModuleID = N'ASOFTNM'
---------------------------------------------- Báo cáo ------------------------------------------------------------
SET @ScreenType = 1

------------------------------------------------ Thiết lập --------------------------------------------------------
SET @ScreenType = 4

SET @ScreenID = N'NMF0001'
SET @ScreenName = N'Thiết lập hệ thống'
SET @ScreenNameE = N'System Setting'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF0002'
SET @ScreenName = N'Thiết lập định mức tiêu chuẩn sức khỏe'
SET @ScreenNameE = N'Standard of health Setting'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2003'
SET @ScreenName = N'Kế thừa thực đơn tổng'
SET @ScreenNameE = N'Inherit Main Menu'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2004'
SET @ScreenName = N'Chọn món ăn'
SET @ScreenNameE = N'Choose dish'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2023'
SET @ScreenName = N'Chọn thực đơn ngày'
SET @ScreenNameE = N'Choose daily menu'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2033'
SET @ScreenName = N'Chọn phiếu kê chợ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2034'
SET @ScreenName = N'Chọn nguyên liệu/dịch vụ'
SET @ScreenNameE = N'Choose materials/services'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2035'
SET @ScreenName = N'Chọn phiếu điều tra'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

---------------------------------------------- Danh mục ------------------------------------------------------------
SET @ScreenType = 2

SET @ScreenID = N'NMF1000'
SET @ScreenName = N'Danh mục nhóm thực phẩm'
SET @ScreenNameE = N'List Materials'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1010'
SET @ScreenName = N'Danh mục thực phẩm'
SET @ScreenNameE = N'List Materials Type'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1020'
SET @ScreenName = N'Danh mục nhóm thực đơn'
SET @ScreenNameE = N'List Menu Type'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1030'
SET @ScreenName = N'Định mức dinh dưỡng'
SET @ScreenNameE = N'Nutrition Quota'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1040'
SET @ScreenName = N'Loại món ăn'
SET @ScreenNameE = N'Dish Type'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1050'
SET @ScreenName = N'Món ăn'
SET @ScreenNameE = N'Dish'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1060'
SET @ScreenName = N'Bữa ăn'
SET @ScreenNameE = N'Meal'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2000'
SET @ScreenName = N'Nghiệp vụ thực đơn tổng'
SET @ScreenNameE = N'Main Menu'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2020'
SET @ScreenName = N'Nghiệp vụ phiếu kê chợ'
SET @ScreenNameE = N'Market Voucher'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2030'
SET @ScreenName = N'Điều tra dinh dưỡng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2040'
SET @ScreenName = N'Sổ tính tiền chợ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2050'
SET @ScreenName = N'Tiếp phẩm 3 bước'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

---------------------------------------------- Cập nhật ------------------------------------------------------------
SET @ScreenType = 3

SET @ScreenID = N'NMF1001'
SET @ScreenName = N'Cập nhật nhóm thực phẩm'
SET @ScreenNameE = N'Update Materials Type'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1011'
SET @ScreenName = N'Cập nhật thực phẩm'
SET @ScreenNameE = N'Update Materials'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1021'
SET @ScreenName = N'Cập nhật nhóm thực đơn'
SET @ScreenNameE = N'Update Menu Type'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1031'
SET @ScreenName = N'Cập nhật Định mức dinh dưỡng'
SET @ScreenNameE = N'Update Nutrition Quota'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1041'
SET @ScreenName = N'Cập nhật loại món ăn'
SET @ScreenNameE = N'Update Dish Type'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1051'
SET @ScreenName = N'Cập nhật món ăn'
SET @ScreenNameE = N'Update Dish'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1061'
SET @ScreenName = N'Cập nhật bữa ăn'
SET @ScreenNameE = N'Update Meal'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2001'
SET @ScreenName = N'Cập nhật thực đơn tổng'
SET @ScreenNameE = N'Update Main Menu'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2021'
SET @ScreenName = N'Cập nhật phiếu kê chợ'
SET @ScreenNameE = N'Update Market Voucher'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2031'
SET @ScreenName = N'Cập nhật Điều tra dinh dưỡng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2051'
SET @ScreenName = N'Cập nhật Tiếp phẩm 3 bước'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2041'
SET @ScreenName = N'Cập nhật Sổ tính tiền chợ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

---------------------------------------------- Xem chi tiết --------------------------------------------------------
SET @ScreenType = 5

SET @ScreenID = N'NMF1002'
SET @ScreenName = N'Xem chi tiết nhóm thực phẩm'
SET @ScreenNameE = N'View Materials Type'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1012'
SET @ScreenName = N'Xem chi tiết thực phẩm'
SET @ScreenNameE = N'View Materials'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1022'
SET @ScreenName = N'Xem chi tiết nhóm thực đơn'
SET @ScreenNameE = N'View menu type'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1032'
SET @ScreenName = N'Xem thông tin Định mức dinh dưỡng'
SET @ScreenNameE = N'View Nutrition Quota'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1042'
SET @ScreenName = N'Xem thông tin loại món ăn'
SET @ScreenNameE = N'View Dish Type'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1052'
SET @ScreenName = N'Xem thông tin món ăn'
SET @ScreenNameE = N'View Dish Type'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF1062'
SET @ScreenName = N'Xem thông bữa ăn'
SET @ScreenNameE = N'View Meal'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2002'
SET @ScreenName = N'Xem chi tiết thực đơn tổng'
SET @ScreenNameE = N'View menu type'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2022'
SET @ScreenName = N'Xem chi tiết phiếu kê chợ'
SET @ScreenNameE = N'View market voucher'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2032'
SET @ScreenName = N'Xem thông Điều tra dinh dưỡng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2042'
SET @ScreenName = N'Xem thông Sổ tính tiền chợ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'NMF2052'
SET @ScreenName = N'Xem thông Tiếp phẩm 3 bước'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
