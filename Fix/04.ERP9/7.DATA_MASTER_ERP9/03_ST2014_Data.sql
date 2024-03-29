-- <Summary>
---- 
-- <History>
---- Create on 08/10/2020 on Trọng Kiên
---- Modify on 18/09/2023 by Thành Sang - Sửa loại Action10
---- <Example>
---- Add Data


--------- Modified on 08/10/2020 by Trọng Kiên
	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2014 WHERE ActionID = N'ACT0001')
		Insert into ST2014 (DivisionID, ActionID, ActionName, RefObject, ActionClient, PopupUrl, Description, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ActionType, ObjectTableName)
		values ('@@@', 'ACT0001', N'Gửi Mail', NULL, NULL, '/PopupMasterDetail/Index/S/SF2014', N'Gửi mail cho khách hàng', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 1, 'CMNT90051_1')

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2014 WHERE ActionID = N'ACT0004')
		Insert into ST2014 (DivisionID, ActionID, ActionName, RefObject, ActionClient, PopupUrl, Description, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ActionType, ObjectTableName)
		values ('@@@', 'ACT0004', N'Tạo lịch', NULL, NULL, '/PopupMasterDetail/Index/S/SF2014', N'Tạo lịch đi khách', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 1, NULL)

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2014 WHERE ActionID = N'ACT0006')
		Insert into ST2014 (DivisionID, ActionID, ActionName, RefObject, ActionClient, PopupUrl, Description, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ActionType, ObjectTableName)
		values ('@@@', 'ACT0006', N'Tạo liên hệ', NULL, NULL, '/PopupMasterDetail/Index/S/SF2014', N'Tạo liên hệ khách hàng', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 1, 'CRMT10001')

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2014 WHERE ActionID = N'ACT0008')
		Insert into ST2014 (DivisionID, ActionID, ActionName, RefObject, ActionClient, PopupUrl, Description, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ActionType, ObjectTableName)
		values ('@@@', 'ACT0008', N'Thực thi hàm API', NULL, NULL, '/PopupMasterDetail/Index/S/SF2015', N'Thực thi API', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 4, NULL)

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2014 WHERE ActionID = N'ACT0000')
		Insert into ST2014 (DivisionID, ActionID, ActionName, RefObject, ActionClient, PopupUrl, Description, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ActionType, ObjectTableName)
		values ('@@@', 'ACT0000', N'Gửi thông báo', NULL, NULL, '/PopupMasterDetail/Index/S/SF2014', N'Gửi thông báo', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 1, NULL)

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2014 WHERE ActionID = N'ACT0007')
		Insert into ST2014 (DivisionID, ActionID, ActionName, RefObject, ActionClient, PopupUrl, Description, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ActionType, ObjectTableName)
		values ('@@@', 'ACT0007', N'Thực thi câu lệnh', NULL, NULL, '/PopupMasterDetail/Index/S/SF2013', N'Thực thi lệnh hiện có', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 2, NULL)

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2014 WHERE ActionID = N'ACT0005')
		Insert into ST2014 (DivisionID, ActionID, ActionName, RefObject, ActionClient, PopupUrl, Description, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ActionType, ObjectTableName)
		values ('@@@', 'ACT0005', N'Tạo khách hàng', NULL, NULL, '/PopupMasterDetail/Index/S/SF2014', N'Thêm đối tác mới', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 1, 'POST0011')

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2014 WHERE ActionID = N'ACT0009')
		Insert into ST2014 (DivisionID, ActionID, ActionName, RefObject, ActionClient, PopupUrl, Description, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ActionType, ObjectTableName)
		values ('@@@', 'ACT0009', N'Thực thi DLL', NULL, NULL, '/PopupMasterDetail/Index/S/SF2013', N'Thực thi DLL hiện có', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 1, NULL)

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2014 WHERE ActionID = N'ACT0003')
		Insert into ST2014 (DivisionID, ActionID, ActionName, RefObject, ActionClient, PopupUrl, Description, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ActionType, ObjectTableName)
		values ('@@@', 'ACT0003', N'Tạo sự kiện', NULL, NULL, '/PopupMasterDetail/Index/S/SF2014', N'Tạo sự kiện mới', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 1, 'CRMT90051')

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2014 WHERE ActionID = N'ACT0002')
		Insert into ST2014 (DivisionID, ActionID, ActionName, RefObject, ActionClient, PopupUrl, Description, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ActionType, ObjectTableName)
		values ('@@@', 'ACT0002', N'Tạo công việc', NULL, NULL, '/PopupMasterDetail/Index/S/SF2014', N'Tạo công việc mới', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', 1, 'OOT2110')

---- Update on 13/09/2023 Update by Thành Sang: Bổ sung Action10 - Phát hành HĐĐT tự động cho khách ANGEL
	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2014 WHERE ActionID = N'ACT0010')
		Insert into ST2014 (DivisionID, ActionID, ActionName, RefObject, ActionClient, PopupUrl, Description, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ActionType, ObjectTableName)
		values ('@@@', 'ACT0010', N'Phát hành HĐĐT (khách ANGEL)', NULL, NULL, '/PopupMasterDetail/Index/S/SF2015', N'Phát hành HĐĐT (khách ANGEL)', 'ASOFTADMIN', '2023-09-13 00:00:00.000', 'ASOFTADMIN', '2020-09-13 00:00:00.000', 4, NULL)

	UPDATE ST2014 SET DivisionID = '@@@'