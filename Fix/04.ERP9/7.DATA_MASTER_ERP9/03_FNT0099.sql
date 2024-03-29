--- Created on 02/11/2018 by Bảo Anh
--- Modified by Như Hàn on 19/12/2018: Bổ sung kế hoạch phòng ban
--- Modified by Lê Hoàng ON 16/11/2020 : kiểm tra insert nếu không tồn tại và cập nhật nếu đã tồn tại


DECLARE @CodeMaster NVARCHAR(50)
DECLARE @TableID VARCHAR(50) = 'FNT0099'

--DELETE FNT0099
-----------------------------------------Loại thu/chi-------------------------------------
--[CodeMaster], [ID], [OrderNo], [Description], [DescriptionE], [Disabled]
SET @CodeMaster = 'TransactionType'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'T01', NULL, 1, N'Thu', N'Receivement', 0, NULL
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'T02', NULL, 2, N'Chi', N'Payment', 0, NULL

-----------------------------------------Trạng thái-------------------------------------
SET @CodeMaster = 'Status'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'0', NULL, 0, N'Chờ duyệt', N'Wait for approval', 0, NULL
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'1', NULL, 1, N'Duyệt', N'Approval', 0, NULL
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'2', NULL, 2, N'Từ chối', N'Deny', 0, NULL


-----------------------------------------khu vực-------------------------------------
SET @CodeMaster = 'Area'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'1', NULL, 1, N'Trong nước', N'Domestic', 0, NULL
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'2', NULL, 2, N'Nước ngoài', N'Foreign', 0, NULL


-----------------------------------------Đến hạn/Quá hạn-------------------------------------
SET @CodeMaster = 'OverdueID'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'D01', NULL, 1, N'Đến hạn', N'Due', 0, NULL
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'D02', NULL, 2, N'Quá hạn', N'Overdue', 0, NULL


-----------------------------------------Tình trạng hồ sơ-------------------------------------
SET @CodeMaster = 'StatusFileID'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'S01', NULL, 1, N'Có', N'Haveto', 0, NULL
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'S02', NULL, 2, N'Đang hoàn thiện', N'Improve', 0, NULL
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'S03', NULL, 3, N'Chưa có', N'NotYet', 0, NULL

-------------------------Loại kế hoạch thu chi: Tổng hợp/Phòng ban------------------------------


SET @CodeMaster = 'TypeID'
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'TH', NULL, 1, N'Tổng Hợp', N'General', 0, NULL
EXEC AddDataMasterERP9 @TableID, @CodeMaster, N'PB', NULL, 2, N'Phòng ban', N'DetailDepartment', 0, NULL