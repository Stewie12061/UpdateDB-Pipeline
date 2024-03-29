-- Thêm dữ liệu vào bảng Master

DECLARE
	@ModuleID VARCHAR(50),
	@ScreenID VARCHAR(50),
	@ScreenName NVARCHAR(MAX),
	@ScreenNameE NVARCHAR(MAX),
	@ScreenType TINYINT

SET @ModuleID = N'ASOFTCSM'

------------------------------------------------ Thiết lập --------------------------------------------------------
SET @ScreenType = 4

SET @ScreenID = N'CSMF0001'
SET @ScreenName = N'Thiết lập hệ thống CSM (ERP-9.0)'
SET @ScreenNameE = N'CSM Module Setting (ERP-9.0)'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF0002'
SET @ScreenName = N'Thiết lập tài khoản API cho User theo hãng'
SET @ScreenNameE = N'API Account Setting for Users by Manufacturer'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF0003'
SET @ScreenName = N'Chọn người dùng'
SET @ScreenNameE = N'Choose User'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


SET @ScreenID = N'CSMF2005'
SET @ScreenName = N'Xác nhận đơn hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1002'
SET @ScreenName = N''
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


---------------------------------------------- Danh mục ------------------------------------------------------------
SET @ScreenType = 2

SET @ScreenID = N'CSMF1010'
SET @ScreenName = N'Danh mục lý do từ chối bảo hành'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1050'
SET @ScreenName = N'Danh mục VMI'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1000'
SET @ScreenName = N'Danh mục tình trạng lỗi'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1040'
SET @ScreenName = N'Danh mục mô tả sản phẩm'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1060'
SET @ScreenName = N'Danh mục loại dịch vụ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1070'
SET @ScreenName = N'Danh mục Checklist'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2000'
SET @ScreenName = N'Danh mục Đơn hàng giao nhận'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2010'
SET @ScreenName = N'Phiếu sửa chữa'
SET @ScreenNameE = N'Repair Votes'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2030'
SET @ScreenName = N'Điều phối QC'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2040'
SET @ScreenName = N'Điều phối kỹ thuật'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2034'
SET @ScreenName = N'Chọn kỹ thuật - QC'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2050'
SET @ScreenName = N'Biên bản trả hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2060'
SET @ScreenName = N'Claim'
SET @ScreenNameE = N'Claim'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1020'
SET @ScreenName = N'Danh mục nhóm lỗi'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1070'
SET @ScreenName = N'Danh mục Checklist'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1090'
SET @ScreenName = N'Danh mục mã lỗi chi tiết'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1100'
SET @ScreenName = N'Danh mục hãng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1080'
SET @ScreenName = N'Danh mục Model'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1120'
SET @ScreenName = N'Danh mục Depot Billing'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1130'
SET @ScreenName = N'Danh mục Reimbursement Parts'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1132'
SET @ScreenName = N'Danh mục Reimbursement Parts'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2004'
SET @ScreenName = N'Chọn Cửa hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2016'
SET @ScreenName = N'Chọn Phụ kiện'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2017'
SET @ScreenName = N'Chọn Model'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
---------------------------------------------- Cập nhật ------------------------------------------------------------
SET @ScreenType = 3

SET @ScreenID = N'CSMF1011'
SET @ScreenName = N'Cập nhật lý do từ chối bảo hành'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1051'
SET @ScreenName = N'Cập nhật VMI'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1001'
SET @ScreenName = N'Cập nhật tình trạng lỗi'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1041'
SET @ScreenName = N'Cập nhật mô tả sản phẩm'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1061'
SET @ScreenName = N'Cập nhật loại dịch vụ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1071'
SET @ScreenName = N'Cập nhật Checklist'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2001'
SET @ScreenName = N'Cập nhật Đơn hàng giao nhận'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


SET @ScreenID = N'CSMF2011'
SET @ScreenName = N'Cập nhật phiếu sửa chữa'
SET @ScreenNameE = N'Update Repair Votes'
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2031'
SET @ScreenName = N'Cập nhật điều phối kỹ thuật'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2041'
SET @ScreenName = N'Cập nhật điều phối QC'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2051'
SET @ScreenName = N'Cập nhật biên bản trả hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2053'
SET @ScreenName = N'Cập nhật PSC vào biên bản trả hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2054'
SET @ScreenName = N'Xác nhận biên bản trả hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2055'
SET @ScreenName = N'Xác nhận gửi hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1031'
SET @ScreenName = N'Cập nhật lỗi'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1021'
SET @ScreenName = N'Cập nhật nhóm lỗi'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1091'
SET @ScreenName = N'Cập nhật mã lỗi chi tiết'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1101'
SET @ScreenName = N'Cập nhật hãng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1103'
SET @ScreenName = N'Cập nhật dữ liệu theo hãng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1081'
SET @ScreenName = N'Cập nhật Model'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


SET @ScreenID = N'CSMF1083'
SET @ScreenName = N'Cập nhật Checklist QC theo Model'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1121'
SET @ScreenName = N'Cập nhật Depot Billing'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1131'
SET @ScreenName = N'Cập nhật Reimbursement Parts'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


SET @ScreenID = N'CSMF2003'
SET @ScreenName = N'Cập nhật chi tiết đơn hàng giao nhận'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2013'
SET @ScreenName = N'Cập nhật Restore'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2014'
SET @ScreenName = N'Cập nhật thông tin vận chuyển'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2008'
SET @ScreenName = N'Tạo phiếu sửa chữa'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2020'
SET @ScreenName = N'Cap nhat trang thai'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2023'
SET @ScreenName = N'Checklist Test ky thuat'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2024'
SET @ScreenName = N'QC'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2026'
SET @ScreenName = N'QC'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF202X'
SET @ScreenName = N'Print Inbox Letter'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2015'
SET @ScreenName = N'Cập nhật thông tin linh kiện'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2021'
SET @ScreenName = N'Cập nhật Escalation'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2020'
SET @ScreenName = N'Cập nhật trạng thái PSC'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE
---------------------------------------------- Báo cáo ------------------------------------------------------------
SET @ScreenType = 1


---------------------------------------------- Xem chi tiết --------------------------------------------------------
SET @ScreenType = 5

SET @ScreenID = N'CSMF1012'
SET @ScreenName = N'Xem thông tin lý do từ chối bảo hành'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1052'
SET @ScreenName = N'Xem thông tin VMI'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1002'
SET @ScreenName = N'Xem thông tin tình trạng lỗi'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1042'
SET @ScreenName = N'Xem thông tin mô tả sản phẩm'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1062'
SET @ScreenName = N'Xem thông tin loại dịch vụ'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1072'
SET @ScreenName = N'Xem thông tin Checklist'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2002'
SET @ScreenName = N'Xem chi tiết Đơn hàng giao nhận'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2012'
SET @ScreenName = N'Xem chi tiết phiếu sửa chữa'
SET @ScreenNameE = N'View Repair Votes Details'EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF2052'
SET @ScreenName = N'Xem chi tiết biên bản trả hàng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


SET @ScreenID = N'CSMF1032'
SET @ScreenName = N'Chi tiết lỗi'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1022'
SET @ScreenName = N'Chi tiết nhóm lỗi'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1092'
SET @ScreenName = N'Chi tiết mã lỗi chi tiết'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1102'
SET @ScreenName = N'Chi tiết hãng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1082'
SET @ScreenName = N'Chi tiết Model'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CSMF1122'
SET @ScreenName = N'Chi tiết Depot Billing'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

---------------------------------------------- Màn hình chọn --------------------------------------------------------
SET @ScreenType = 4

SET @ScreenID = N'CSMF2022'
SET @ScreenName = N'Chọn linh kiện'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


SET @ScreenID = N'CMNF9004'
SET @ScreenName = N'Chọn đối tượng'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'CRMF9014'
SET @ScreenName = N'Chọn đầu mối'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE




