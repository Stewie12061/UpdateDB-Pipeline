------------------------------------------------------------------------------------------------------
-- Fix Bổ sung phân quyền màn hình -- Module CI
-- ScreenID: 1-Báo cáo; 2-Danh mục; 3-Nhập liệu; 4-Khác
------------------------------------------------------------------------------------------------------
-- Store Insert dữ liệu vào Table chuẩn
------------------------------------------------------------------------------------------------------
-- create by Hoàng Tú  Date 18/11/2014 
-- modified by Lê Hoàng Date 12/11/2020 : bổ sung phân quyền màn hình danh mục máy
-- Thêm dữ liệu vào bảng Master

DECLARE @ModuleID AS NVARCHAR(50) = 'ASOFTCI'


DECLARE
	@ScreenID VARCHAR(50),
	@ScreenName NVARCHAR(MAX),
	@ScreenNameE NVARCHAR(MAX),
	@ScreenType TINYINT

------------------------------------------------------------------------------------------------------
--- Báo cáo
------------------------------------------------------------------------------------------------------
SET @ScreenType = 1


------------------------------------------------------------------------------------------------------
--- Danh mục
------------------------------------------------------------------------------------------------------
SET @ScreenType =2

SET @ScreenID = N'CIF1000'
SET @ScreenName = N'Danh mục phòng ban'
SET @ScreenNameE = N'Department List'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1010'
SET @ScreenName = N'Danh mục tổ nhóm'
SET @ScreenNameE = N'List of teams'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1020'
SET @ScreenName = N'Danh mục chức vụ'
SET @ScreenNameE = N'List of positions'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1030'
SET @ScreenName = N'Danh mục mã phân tích nghiệp vụ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1060'
SET @ScreenName = N'Danh mục tỉnh thành'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1070'
SET @ScreenName = N'Danh mục quận huyện'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1090'
SET @ScreenName = N'Danh mục mã phân tích đối tượng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1100'
SET @ScreenName = N'Danh mục mã phân tích mặt hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1110'
SET @ScreenName = N'Danh mục phương thức thanh toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1120'
SET @ScreenName = N'Danh mục đơn vị'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1130'
SET @ScreenName = N'Danh mục loại mặt hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1150'
SET @ScreenName = N'Danh mục đối tượng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1140'
SET @ScreenName = N'Danh mục kho hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1160'
SET @ScreenName = N'Danh mục tài khoản'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1170'
SET @ScreenName = N'Danh mục mặt hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1190'
SET @ScreenName = N'Danh mục loại ngoại tệ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1200'
SET @ScreenName = N'Danh mục nhóm thuế'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1210'
SET @ScreenName = N'Danh mục quốc gia'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1220'
SET @ScreenName = N'Danh mục vùng khu vực'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1270'
SET @ScreenName = N'Danh mục loại đối tượng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1280'
SET @ScreenName = N'Danh mục điều khoản thanh toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1290'
SET @ScreenName = N'Danh mục đơn vị tính'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1180'
SET @ScreenName = N'Danh mục bộ định mức KIT'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1300'
SET @ScreenName = N'Danh sách loại định mức tồn kho'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1310'
SET @ScreenName = N'Danh mục mã phân tích'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1230'
SET @ScreenName = N'Danh mục định mức hàng tồn kho'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1250'
SET @ScreenName = N'Danh mục bảng giá bán'
SET @ScreenNameE = N''
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1260'
SET @ScreenName = N'Danh mục khuyến mãi theo giá trị hóa đơn'
SET @ScreenNameE = N''
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1320'
SET @ScreenName = N'Danh mục loại chứng từ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1240'
SET @ScreenName = N'Dannh mục khuyến mãi theo mặt hàng'
SET @ScreenNameE = N'Dannh mục khuyến mãi theo mặt hàng'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1360'
SET @ScreenName = N'Danh mục hợp đồng'
SET @ScreenNameE = N'Danh mục hợp đồng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'TF2000'
SET @ScreenName = N'Danh mục ngân sách'
SET @ScreenNameE = N'Danh mục ngân sách'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1370'
SET @ScreenName = N'Danh mục máy'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1380'
SET @ScreenName = N'Danh mục mối quan hệ ASM-SUP-SALES-DEALER'
SET @ScreenNameE = N'Danh mục mối quan hệ ASM-SUP-SALES-DEALER'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF1820'
SET @ScreenName = N'Danh mục nguồn lực sản xuất'
SET @ScreenNameE = N'Danh mục nguồn lực sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1390'
SET @ScreenName = N'Danh mục thiết lập công thức quy đổi'
SET @ScreenNameE = N'Danh mục thiết lập công thức quy đổi'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1400'
SET @ScreenName = N'Danh mục đơn vị tính chuyển đổi'
SET @ScreenNameE = N'Danh mục đơn vị tính chuyển đổi'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1410'
SET @ScreenName = N'Danh mục thiết lập quy cách hàng hóa'
SET @ScreenNameE = N'Danh mục thiết lập quy cách hàng hóa'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1420'
SET @ScreenName = N'Danh mục quy cách hàng hóa'
SET @ScreenNameE = N'Danh mục quy cách hàng hóa'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1430'
SET @ScreenName = N'Danh mục tuyến'
SET @ScreenNameE = N'Danh mục tuyến'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

--SET @ScreenID = N'CIF1440'
--SET @ScreenName = N'Danh mục địa điểm'
--SET @ScreenNameE = N'Danh mục địa điểm'
--EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1450'
SET @ScreenName = N'Danh mục mã phân tích'
SET @ScreenNameE = N'Danh mục mã phân tích'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1460'
SET @ScreenName = N'Danh mục bảng giá bán (Sale out)'
SET @ScreenNameE = N'Danh mục bảng giá bán (Sale out)'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1470'
SET @ScreenName = N'Danh mục bảng giá mua'
SET @ScreenNameE = N'Danh mục bảng giá mua'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1480'
SET @ScreenName = N'Danh mục mã phân tích mua và bán'
SET @ScreenNameE = N'Danh mục mã phân tích mua và bán'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1490'
SET @ScreenName = N'Danh mục mã phân tích đơn hàng bán'
SET @ScreenNameE = N'Danh mục mã phân tích đơn hàng bán'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1500'
SET @ScreenName = N'Danh mục mã phân tích đơn hàng mua'
SET @ScreenNameE = N'Danh mục mã phân tích đơn hàng mua'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1510'
SET @ScreenName = N'Danh mục định nghĩa điều kiện khuyến mãi'
SET @ScreenNameE = N'DiscountTool List'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType =2
SET @ScreenID = N'CIF1520'
SET @ScreenName = N'Danh mục chương trình khuyến mãi theo điều kiện'
SET @ScreenNameE = N'Danh mục chương trình khuyến mãi theo điều kiện'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1530'
SET @ScreenName = N'Danh mục ví khuyến mãi tích lũy'
SET @ScreenNameE = N'DiscountWallet List'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


--- 16/06/2023 - [Hoàng Long] - Bổ sung phân quyền màn hình danh mục chi phí
SET @ScreenID = N'CIF1540'
SET @ScreenName = N'Danh mục chi phí'
SET @ScreenNameE = N'Expense List'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1550'
SET @ScreenName = N'Danh mục bảng giá vốn dự kiến'
SET @ScreenNameE = N'PriceControlSuggested List'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

IF EXISTS (SELECT * FROM CustomerIndex WHERE CustomerName = 166)
BEGIN
	SET @ScreenID = N'CIF1560'
	SET @ScreenName = N'Danh mục thông tin xe vận chuyển'
	SET @ScreenNameE = N'Danh mục thông tin xe vận chuyển'
	EXEC AddScreenERP9 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL
END
------------------------------------------------------------------------------------------------------
--- Nhập liệu
------------------------------------------------------------------------------------------------------
SET @ScreenType = 3
SET @ScreenID = N'CIF1001'
SET @ScreenName = N'Cập nhật phòng ban'
SET @ScreenNameE = N'Update department'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1011'
SET @ScreenName = N'Cập nhật tổ nhóm'
SET @ScreenNameE = N'Updating team'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1021'
SET @ScreenName = N'Cập nhật chức vụ'
SET @ScreenNameE = N'Updating position'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1031'
SET @ScreenName = N'Cập nhật mã phân tích nghiệp vụ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1061'
SET @ScreenName = N'Cập nhật tỉnh thành'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1071'
SET @ScreenName = N'Cập nhật quận huyện'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1091'
SET @ScreenName = N'Cập nhật mã phân tích đối tượng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1101'
SET @ScreenName = N'Cập nhật mã phân tích mặt hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1111'
SET @ScreenName = N'Cập nhật phương thức thanh toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1121'
SET @ScreenName = N'Cập nhật đơn vị'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1131'
SET @ScreenName = N'Cập nhật loại mặt hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1141'
SET @ScreenName = N'Cập nhật kho hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1151'
SET @ScreenName = N'Cập nhật đối tượng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1161'
SET @ScreenName = N'Cập nhật tài khoản'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1171'
SET @ScreenName = N'Cập nhật mặt hàng'
SET @ScreenNameE = N'Cập nhật mặt hàng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1191'
SET @ScreenName = N'Cập nhật loại ngoại tệ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1173'
SET @ScreenName = N'Cập nhật mặt hàng - tồn kho - doanh thu'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1174'
SET @ScreenName = N'Cập nhật mặt hàng - khác'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1175'
SET @ScreenName = N'Cập nhật mặt hàng - định mức tồn kho'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1211'
SET @ScreenName = N'Cập nhật quốc gia'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1221'
SET @ScreenName = N'Cập nhật vùng khu vực'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1271'
SET @ScreenName = N'Cập nhật loại đối tượng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1181'
SET @ScreenName = N'Cập nhật bộ định mức KIT'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1183'
SET @ScreenName = N'Cập nhật chi tiết bộ định mức KIT'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1184'
SET @ScreenName = N'Cập nhật định mức cho bộ mã hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1281'
SET @ScreenName = N'Cập nhật điều khoản thanh toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1201'
SET @ScreenName = N'Cập nhật nhóm thuế'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1301'
SET @ScreenName = N'Cập nhật loại định mức tồn kho'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1291'
SET @ScreenName = N'Cập nhật đơn vị tính'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1311'
SET @ScreenName = N'Cập nhật mã phân tích'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1231'
SET @ScreenName = N'Cập nhật định mức hàng tồn kho'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1241'
SET @ScreenName = N'Cập nhật khuyến mãi theo mặt hàng'
SET @ScreenNameE = N'Cập nhật khuyến mãi theo mặt hàng'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1251'
SET @ScreenName = N'Cập nhật bảng giá bán'
SET @ScreenNameE = N''
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1253'
SET @ScreenName = N'Cập nhật chi tiết bảng giá bán'
SET @ScreenNameE = N''
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'CIF1321'
SET @ScreenName = N'Cập nhật loại chứng từ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1261'
SET @ScreenName = N'Cập nhật khuyến mãi theo giá trị hóa đơn'
SET @ScreenNameE = N''
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1263'
SET @ScreenName = N'Cập nhật chi tiết khuyến mãi theo hóa đơn'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1176'
SET @ScreenName = N'Tham chiếu mã hàng từ quản lý dự án và ERP'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1361'
SET @ScreenName = N'Cập nhật hợp đồng'
SET @ScreenNameE = N'Cập nhật hợp đồng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'TF2001'
SET @ScreenName = N'Cập nhật ngân sách'
SET @ScreenNameE = N'Cập nhật ngân sách'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1371'
SET @ScreenName = N'Cập nhật thông tin máy'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1381'
SET @ScreenName = N'Thiết lập mối quan hệ ASM-SUP-SALES-DEALER'
SET @ScreenNameE = N'Thiết lập mối quan hệ ASM-SUP-SALES-DEALER'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF1821'
SET @ScreenName = N'Cập nhật nguồn lực sản xuất'
SET @ScreenNameE = N'Cập nhật nguồn lực sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1391'
SET @ScreenName = N'Cập nhật thiết lập công thức quy đổi'
SET @ScreenNameE = N'Cập nhật thiết lập công thức quy đổi'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1401'
SET @ScreenName = N'Cập nhật đơn vị tính chuyển đổi'
SET @ScreenNameE = N'Cập nhật đơn vị tính chuyển đổi'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1411'
SET @ScreenName = N'Cập nhật thiết lập quy cách hàng hóa'
SET @ScreenNameE = N'Cập nhật thiết lập quy cách hàng hóa'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1421'
SET @ScreenName = N'Cập nhật quy cách hàng hóa'
SET @ScreenNameE = N'Cập nhật quy cách hàng hóa'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1431'
SET @ScreenName = N'Cập nhật tuyến'
SET @ScreenNameE = N'Cập nhật tuyến'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1441'
SET @ScreenName = N'Cập nhật địa điểm'
SET @ScreenNameE = N'Cập nhật địa điểm'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1244'
SET @ScreenName = N'Cập nhật chi khuyến mãi cho mặt hàng'
SET @ScreenNameE = N'Cập nhật chi khuyến mãi cho mặt hàng'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1451'
SET @ScreenName = N'Cập nhật mã phân tích'
SET @ScreenNameE = N'Cập nhật mã phân tích'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1257'
SET @ScreenName = N'Cập nhật chi tiết bảng giá bán'
SET @ScreenNameE = N'Cập nhật chi tiết bảng giá bán'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1461'
SET @ScreenName = N'Cập nhật bảng giá bán (Sell out)'
SET @ScreenNameE = N'Cập nhật bảng giá bán (Sell out)'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1463'
SET @ScreenName = N'Cập nhật chi tiết bảng giá bán (Sell out)'
SET @ScreenNameE = N'Cập nhật chi tiết bảng giá bán (Sell out)'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'CIF1471'
SET @ScreenName = N'Cập nhật bảng giá mua'
SET @ScreenNameE = N'Cập nhật bảng giá mua'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1473'
SET @ScreenName = N'Cập nhật chi tiết bảng giá mua'
SET @ScreenNameE = N'Cập nhật chi tiết bảng giá mua'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1481'
SET @ScreenName = N'Cập nhật mã phân tích mua và bán'
SET @ScreenNameE = N'Cập nhật mã phân tích mua và bán'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1491'
SET @ScreenName = N'Cập nhật mã phân tích đơn hàng bán'
SET @ScreenNameE = N'Cập nhật mã phân tích đơn hàng bán'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1501'
SET @ScreenName = N'Cập nhật mã phân tích đơn hàng mua'
SET @ScreenNameE = N'Cập nhật mã phân tích đơn hàng mua'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenType = 3
SET @ScreenID = N'CIF1511'
SET @ScreenName = N'Cập nhật định nghĩa điều kiện khuyến mãi'
SET @ScreenNameE = N'Update DiscountTool'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'CIF1531'
SET @ScreenName = N'Cập nhật ví khuyến mãi tích lũy'
SET @ScreenNameE = N'Update DiscountWallet'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'CIF1551'
SET @ScreenName = N'Cập nhật bảng giá vốn dự kiến'
SET @ScreenNameE = N'Update PriceControlSuggested'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'CIF1521'
SET @ScreenName = N'Cập nhật chương trình khuyến mãi theo điều kiện'
SET @ScreenNameE = N'Cập nhật chương trình khuyến mãi theo điều kiện'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1523'
SET @ScreenName = N'Cập nhật chi tiết điều kiện khuyến mãi con'
SET @ScreenNameE = N'Cập nhật chi tiết điều kiện khuyến mãi con'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

--- 16/06/2023 - [Hoàng Long] - Bổ sung phân quyền màn hình danh mục chi phí
SET @ScreenType = 3
SET @ScreenID = N'CIF1541'
SET @ScreenName = N'Cập nhật công thức chi phí'
SET @ScreenNameE = N'Cập nhật công thức chi phí'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

IF EXISTS (SELECT * FROM CustomerIndex WHERE CustomerName = 166)
BEGIN
	SET @ScreenID = N'CIF1561'
	SET @ScreenName = N'Cập nhật thông tin xe vận chuyển'
	SET @ScreenNameE = N'Cập nhật thông tin xe vận chuyển'
	EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
END

IF ((SELECT CustomerName FROM CustomerIndex) = 166)
BEGIN
	SET @ScreenID = N'CIF1258'
	SET @ScreenName = N'Cập nhật thiết lập bảng giá theo quy cách'
	SET @ScreenNameE = N'Cập nhật thiết lập bảng giá theo quy cách'
	EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL
END
------------------------------------------------------------------------------------------------------
--- Khác (Thiết lập)
------------------------------------------------------------------------------------------------------
SET @ScreenType = 4

SET @ScreenID = N'CIF0001'
SET @ScreenName = N'Thiết lập hệ thống'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF0020'
SET @ScreenName = N'Thông tin công ty'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1013'
SET @ScreenName = N'Thêm người dùng vào nhóm'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF0030'
SET @ScreenName = N'Định nghĩa mã phân tích'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF0040'
SET @ScreenName = N'Thiết lập tiện ích'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1330'
SET @ScreenName = N'Mã tự động đối tượng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1340'
SET @ScreenName = N'Mã tự động mặt hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1177'
SET @ScreenName = N'Chọn dự án'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1259'
SET @ScreenName = N'Kế thừa giá vốn dự kiến'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1363'
SET @ScreenName = N'Chọn hợp đồng'
SET @ScreenNameE = N'Chọn hợp đồng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF0050'
SET @ScreenName = N'Thiết lập hệ số sử dụng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1373'
SET @ScreenName = N'Chọn máy'
SET @ScreenNameE = N'Chọn máy'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CMNF9001'
SET @ScreenName = N'Chọn mặt hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF9003'
SET @ScreenName = N'Chọn nhân viên'
SET @ScreenNameE = N''
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1539'
SET @ScreenName = N'Chọn chiết khấu tích lũy'
SET @ScreenNameE = N''
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF9004'
SET @ScreenName = N'Chọn đối tượng'
SET @ScreenNameE = N''
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF9007'
SET @ScreenName = N'Chọn dự án'
SET @ScreenNameE = N''
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF9008'
SET @ScreenName = N'Chọn mặt hàng(theo loại)'
SET @ScreenNameE = N''
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF9009'
SET @ScreenName = N'Chọn đối tượng(theo loại)'
SET @ScreenNameE = N''
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF9010'
SET @ScreenName = N'Chọn quy cách'
SET @ScreenNameE = N''
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF90011'
SET @ScreenName = N'Soạn thảo(editor)'
SET @ScreenNameE = N''
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF9001'
SET @ScreenName = N'Chọn mặt hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1003'
SET @ScreenName = N'Chọn phòng ban'
SET @ScreenNameE = N''
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

--ĐÌnh Hòa - [20/04/2021]
--- Chọn nhân viên 
SET @ScreenID = N'CMNF9003'
SET @ScreenName = N'Chọn nhân viên'
SET @ScreenNameE = N'Chọn nhân viên'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

SET @ScreenID = N'CIF1273'
SET @ScreenName = N'Chọn loại đối tượng'
SET @ScreenNameE = N'Chọn loại đối tượng'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL

--Hoài Bảo - [25/07/2022] - Màn hình chọn kho hàng
SET @ScreenID = N'CIF1144'
SET @ScreenName = N'Chọn kho hàng'
SET @ScreenNameE = N'Chọn kho hàng'
EXEC AddScreenERP @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE, -1, 'ERP9', NULL
------------------------------------------------------------------------------------------------------
--- Chi tiết
------------------------------------------------------------------------------------------------------
SET @ScreenType = 5
SET @ScreenID = N'CIF1002'
SET @ScreenName = N'Xem chi tiết phòng ban'
SET @ScreenNameE = N'Update Department'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1012'
SET @ScreenName = N'Xem chi tiết tổ nhóm'
SET @ScreenNameE = N'Updating team'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1022'
SET @ScreenName = N'Xem chi tiết chức vụ'
SET @ScreenNameE = N'Updating position'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1032'
SET @ScreenName = N'Xem chi tiết mã phân tích nghiệp vụ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1062'
SET @ScreenName = N'Xem chi tiết tỉnh thành'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1072'
SET @ScreenName = N'Xem chi tiết quận huyện'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1092'
SET @ScreenName = N'Xem chi tiết mã phân tích đối tượng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1102'
SET @ScreenName = N'Xem chi tiết mã phân tích mặt hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1112'
SET @ScreenName = N'Xem chi tiết phương thức thanh toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1122'
SET @ScreenName = N'Xem chi tiết đơn vị'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1123'
SET @ScreenName = N'Sơ đồ tổ chức'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1132'
SET @ScreenName = N'Xem chi tiết loại mặt hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1142'
SET @ScreenName = N'Xem chi tiết kho hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1152'
SET @ScreenName = N'Xem chi tiết đối tượng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1162'
SET @ScreenName = N'Xem chi tiết tài khoản'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1172'
SET @ScreenName = N'Xem chi tiết mặt hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1192'
SET @ScreenName = N'Xem chi tiết loại ngoại tệ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1202'
SET @ScreenName = N'Xem chi tiết nhóm thuế'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1212'
SET @ScreenName = N'Xem chi tiết quốc gia'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1222'
SET @ScreenName = N'Xem chi tiết vùng khu vực'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1272'
SET @ScreenName = N'Xem chi tiết loại đối tượng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1282'
SET @ScreenName = N'Xem chi tiết điều khoản thanh toán'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1182'
SET @ScreenName = N'Xem chi tiết bộ định mức KIT'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1292'
SET @ScreenName = N'Xem chi tiết đơn vị tính'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1302'
SET @ScreenName = N'Xem chi tiết loại định mức tồn kho'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1312'
SET @ScreenName = N'Xem chi tiết mã phân tích'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1232'
SET @ScreenName = N'Xem chi tiết định mức hàng tồn kho'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1252'
SET @ScreenName = N'Xem chi tiết bảng giá bán'
SET @ScreenNameE = N''
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1322'
SET @ScreenName = N'Xem chi tiết loại chứng từ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1262'
SET @ScreenName = N'Xem chi tiết khuyến mãi theo giá trị hóa đơn'
SET @ScreenNameE = N''
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1362'
SET @ScreenName = N'Xem chi tiết hợp đồng'
SET @ScreenNameE = N'Xem chi tiết hợp đồng'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'TF2002'
SET @ScreenName = N'Chi tiết ngân sách'
SET @ScreenNameE = N'Chi tiết ngân sách'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1372'
SET @ScreenName = N'Xem chi tiết thông tin máy'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1382'
SET @ScreenName = N'Xem chi tiết mối quan hệ ASM-SUP-SALES-DEALER'
SET @ScreenNameE = N'Xem chi tiết mối quan hệ ASM-SUP-SALES-DEALER'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'MF1822'
SET @ScreenName = N'Xem chi tiết nguồn lực sản xuất'
SET @ScreenNameE = N'Xem chi tiết nguồn lực sản xuất'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1392'
SET @ScreenName = N'Xem chi tiết thiết lập công thức quy đổi'
SET @ScreenNameE = N'Xem chi tiết thiết lập công thức quy đổi'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1402'
SET @ScreenName = N'Xem chi tiết đơn vị tính chuyển đổi'
SET @ScreenNameE = N'Xem chi tiết đơn vị tính chuyển đổi'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1412'
SET @ScreenName = N'Xem chi tiết thiết lập quy cách'
SET @ScreenNameE = N'Xem chi tiết thiết lập quy cách'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1422'
SET @ScreenName = N'Xem chi tiết quy cách hàng hóa'
SET @ScreenNameE = N'Xem chi tiết quy cách hàng hóa'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1432'
SET @ScreenName = N'Xem chi tiết tuyến'
SET @ScreenNameE = N'Xem chi tiết tuyến'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1442'
SET @ScreenName = N'Xem chi tiết địa điểm'
SET @ScreenNameE = N'Xem chi tiết địa điểm'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1462'
SET @ScreenName = N'Xem chi tiết bảng giá bán (Sale out)'
SET @ScreenNameE = N'Xem chi tiết bảng giá bán (Sale out)'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1242'
SET @ScreenName = N'Xem chi tiết khuyến mãi theo mặt hàng'
SET @ScreenNameE = N'Xem chi tiết khuyến mãi theo mặt hàng'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1472'
SET @ScreenName = N'Xem chi tiết bảng giá mua'
SET @ScreenNameE = N'Xem chi tiết bảng giá mua'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1492'
SET @ScreenName = N'Xem chi tiết mã phân tích đơn hàng bán'
SET @ScreenNameE = N'Xem chi tiết mã phân tích đơn hàng bán'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1502'
SET @ScreenName = N'Xem chi tiết mã phân tích đơn hàng mua'
SET @ScreenNameE = N'Xem chi tiết mã phân tích đơn hàng mua'
EXEC AddScreenERP9_V2 @ModuleID, @ScreenID, @ScreenType, @ScreenName, @ScreenNameE, -1, NULL

SET @ScreenID = N'CIF1512'
SET @ScreenName = N'Xem chi tiết định nghĩa điều kiện khuyến mãi'
SET @ScreenNameE = N'DiscountTool Detail'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1522'
SET @ScreenName = N'Xem chi tiết chương trình khuyến mãi theo điều kiện'
SET @ScreenNameE = N'Xem chi tiết chương trình khuyến mãi theo điều kiện'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1532'
SET @ScreenName = N'Xem chi tiết ví khuyến mãi tích lũy'
SET @ScreenNameE = N'DiscountWallet Detail'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CIF1552'
SET @ScreenName = N'Xem chi tiết bảng giá vốn dự kiến'
SET @ScreenNameE = N'PriceControlSuggested Detail'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

IF EXISTS (SELECT * FROM CustomerIndex WHERE CustomerName = 166)
BEGIN
	SET @ScreenID = N'CIF1562'
	SET @ScreenName = N'Xem chi tiết thông tin xe vận chuyển'
	SET @ScreenNameE = N'Xem chi tiết thông tin xe vận chuyển'
	EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
END