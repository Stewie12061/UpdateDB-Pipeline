-- CREATE BY Trần Quốc Tuấn ON 16/09/2015
-- Thêm dữ liệu vào bảng Master Module S
-- Modified by Như Hàn on 30/07/2019:Tích hợp 2 fix Data
-- Modified by Tấn Thành on 29/09/2020: Bổ sung dữ liệu ngầm, trạng thái Pipeline
-- Modified by Lê Hoàng ON 16/11/2020 : kiểm tra insert nếu không tồn tại và cập nhật nếu đã tồn tại
-- Modified by Tấn Thành ON 26/01/2021 : Dữ liệu các nền tảng ASOFT - PlatForm
-- Modified by Hoài Bảo ON 28/07/2021 : Bổ sung dữ liệu cột [CodeMasterName]

DECLARE @CodeMaster NVARCHAR(50)
DECLARE @TableID VARCHAR(50) = 'ST0099'

--DELETE ST0099
-----------------------------------------ActionType Hành động-------------------------------------
-- CodeMaster, ID, [Description], DescriptionE, [Disabled]
-- EXEC AddDataMasterERP9 @TableID, @CodeMaster,@ID,@ID1,@OrderNo,@Description,@DescriptionE,@Disabled,@LanguageID

SET @CodeMaster = 'ActionType'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 2, NULL, NULL, N'Thêm', N'Add new',0, NULL, N'Hành động (Màn hình Xem thông tin lịch sử - SF1040)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 4, NULL, NULL, N'Sửa', N'Edit',0, NULL, N'Hành động (Màn hình Xem thông tin lịch sử - SF1040)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 1, NULL, NULL, N'Xóa', N'Delete',0, NULL, N'Hành động (Màn hình Xem thông tin lịch sử - SF1040)'

--------------------- Loại dữ liệu (màn hình Thiết lập xét duyệt SF0010)
SET @CodeMaster = 'DataType'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 0, NULL, NULL, N'Theo chứng từ', N'By voucher',0, NULL, N'Loại dữ liệu (màn hình Thiết lập xét duyệt SF0010)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 1, NULL, NULL, N'Theo tháng', N'By month',0, NULL, N'Loại dữ liệu (màn hình Thiết lập xét duyệt SF0010)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 2, NULL, NULL, N'Theo năm', N'By year',0, NULL, N'Loại dữ liệu (màn hình Thiết lập xét duyệt SF0010)'

EXEC AddDataMasterERP9 @TableID, 'S000001',1, NULL, NULL, N'Không', N'', 0, NULL, N'Dùng chung'
EXEC AddDataMasterERP9 @TableID, 'S000001',2, NULL, NULL, N'Có', N'', 0, NULL, N'Dùng chung'
EXEC AddDataMasterERP9 @TableID, 'S000002',1, NULL, NULL, N'Không', N'', 0, NULL, N'Không hiển thị'
EXEC AddDataMasterERP9 @TableID, 'S000002',2, NULL, NULL, N'Có', N'', 0, NULL, N'Không hiển thị'

------------------------------------------------Trạng thái Pipeline------------------------------------------------
SET @CodeMaster = 'PipelineStatus'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 0, NULL, NULL, N'Chưa hoạt động', N'Not Active',0, NULL, N'Trạng thái (Màn hình Quản lý Pipeline - SF2010)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 1, NULL, NULL, N'Đang hoạt động', N'Actived',0, NULL, N'Trạng thái (Màn hình Quản lý Pipeline - SF2010)'

-----------------------------------------Loại điều kiện kích hoạt PipeLine-----------------------------------------

SET @CodeMaster = 'ConditionActiveType'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 0, NULL, NULL, N'Theo hành động', N'By Action',0, NULL, N'Sự kiện kích hoạt (Màn hình Cập nhật Pipeline - SF2011)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 1, NULL, NULL, N'Theo thời gian', N'By Time',0, NULL, N'Sự kiện kích hoạt (Màn hình Cập nhật Pipeline - SF2011)'

---------------------------------------------ActionType Hành động chuẩn--------------------------------------------

SET @CodeMaster = 'ActionCommon'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 0, NULL, NULL, N'Thêm mới', N'Add new',0, NULL, N'Hành động kích hoạt (Màn hình Cập nhật Pipeline - SF2011)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 1, NULL, NULL, N'Cập nhật', N'Update',0, NULL, N'Hành động kích hoạt (Màn hình Cập nhật Pipeline - SF2011)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 2, NULL, NULL, N'Xóa', N'Delete',0, NULL, N'Hành động kích hoạt (Màn hình Cập nhật Pipeline - SF2011)'

-------------------------------------------Loại Schedule RecurrencyType---------------------------------------------

SET @CodeMaster = 'ScheduleRecurrencyType'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 0, NULL, NULL, N'Một lần', N'One Time',0, NULL, N'Loại Schedule RecurrencyType'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 1, NULL, NULL, N'Ngày', N'Day',0, NULL, N'Loại Schedule RecurrencyType'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 2, NULL, NULL, N'Tuần', N'Week',0, NULL, N'Loại Schedule RecurrencyType'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 3, NULL, NULL, N'Tháng', N'Month',0, NULL, N'Loại Schedule RecurrencyType'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 4, NULL, NULL, N'Năm', N'Year',0, NULL, N'Loại Schedule RecurrencyType'

-------------------------------------------Đơn vị thời gian lặp lại - TypeOfRepeatTime---------------------------------------------

SET @CodeMaster = 'TypeOfRepeatTime'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 0, NULL, NULL, N'Phút', N'Minutes',0, NULL, N'Đơn vị thời gian lặp lại'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 1, NULL, NULL, N'Giờ', N'Hours',0, NULL, N'Đơn vị thời gian lặp lại'

-------------------------------------------Thời hạn lặp lại - TypeOfRepeatTime---------------------------------------------

SET @CodeMaster = 'TypeOfDuration'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 0, NULL, NULL, N'Giờ', N'Hours',0, NULL, N'Loại thời hạn'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 1, NULL, NULL, N'Ngày', N'Days',0, NULL, N'Loại thời hạn'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 2, NULL, NULL, N'Vĩnh viễn', N'Forever',0, NULL, N'Loại thời hạn'

-------------------------------------------Dữ liệu nền tảng - PlatForm---------------------------------------------

SET @CodeMaster = 'PlatForm'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 0, NULL, NULL, N'ASOFT-ERP 8.3.7', N'ASOFT-ERP 8.3.7',0, NULL, N'Tên nền tảng (Màn hình phân quyền chức năng - SF0001)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 1, NULL, NULL, N'ASOFT-ERP 9.9', N'ASOFT-ERP 9.9',0, NULL, N'Tên nền tảng (Màn hình phân quyền chức năng - SF0001)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 2, NULL, NULL, N'ASOFT-SuperApps', N'ASOFT-SuperApps',0, NULL, N'Tên nền tảng (Màn hình phân quyền chức năng - SF0001)'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 3, NULL, NULL, N'ASOFT-API', N'ASOFT-API',0, NULL, N'Tên nền tảng (Màn hình phân quyền chức năng - SF0001)'


-------------------------------------------Đối tác Văn bản điện tử---------------------------------------------
SET @CodeMaster = 'EContractPartner'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 0, NULL, NULL, N'FPT eContract', N'FPT eContract',0, NULL, N''

-------------------------------------------Dữ liệu Menu thiết lập phân hệ---------------------------------------------

SET @CodeMaster = 'ModuleSetting'
-- OO
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 0, N'OOF0060|OO', 1, N'Thiết lập số lẻ giờ công', N'', 0, NULL, N'Danh sách Menu thiết lập phân hệ'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 1, N'OOF0050|OO', 2, N'Thiết lập đánh giá', N'', 0, NULL, N'Danh sách Menu thiết lập phân hệ'
--PO
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 2, N'POF0001|PO', 3, N'Thiết lập đơn hàng mua', N'', 0, NULL, N'Danh sách Menu thiết lập phân hệ'
--WM
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 3, N'WMF0001|WM', 4, N'Thiết lập cấp quản lý theo vị trí', N'', 0, NULL, N'Danh sách Menu thiết lập phân hệ'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 4, N'WMF0003|WM', 5, N'Tính giá xuất kho', N'', 0, NULL, N'Danh sách Menu thiết lập phân hệ'
--HRM
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 5, N'HF0390|HRM', 6, N'Thiết lập thông tin quản lý nhân sự và chấm công', N'', 0, NULL, N'Danh sách Menu thiết lập phân hệ'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, 6, N'OOF0010|HRM', 7, N'Thiết lập thời gian xét duyệt', N'', 0, NULL, N'Danh sách Menu thiết lập phân hệ'