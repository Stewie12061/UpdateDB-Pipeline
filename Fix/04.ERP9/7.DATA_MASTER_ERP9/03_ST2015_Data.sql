-- <Summary>
---- 
-- <History>
---- Create on 08/10/2020 on Trọng Kiên
---- <Example>
---- Add Data


--------- Modified on 08/10/2020 by Trọng Kiên
	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2015 WHERE ObjectTableName = N'CRMT10001')
		Insert into ST2015 (DivisionID, ObjectID, RefObjectName, ObjectTableName, Area, FormID, Disabled, IsCommon, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ObjectTableNameDetail, VoucherSettingTable, VoucherSettingColumn)
		values ('@@@', '04', N'Liên hệ', 'CRMT10001', 'CRM', 'CRMF1001', 0, 1, 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', NULL, 'AT0002','S1')

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2015 WHERE ObjectTableName = N'POST0011')
		Insert into ST2015 (DivisionID, ObjectID, RefObjectName, ObjectTableName, Area, FormID, Disabled, IsCommon, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ObjectTableNameDetail, VoucherSettingTable, VoucherSettingColumn)
		values ('@@@', '03', N'Khách hàng', 'POST0011', 'CRM', 'CRMF1011', 0, 1, 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', NULL, 'AT0002','S1')

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2015 WHERE ObjectTableName = N'CRMT20501')
		Insert into ST2015 (DivisionID, ObjectID, RefObjectName, ObjectTableName, Area, FormID, Disabled, IsCommon, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ObjectTableNameDetail, VoucherSettingTable, VoucherSettingColumn)
		values ('@@@', '02', N'Cơ hội', 'CRMT20501', 'CRM', 'CRMF2051', 0, 1, 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', NULL, 'AT0002','S1')

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2015 WHERE ObjectTableName = N'CRMT20401')
		Insert into ST2015 (DivisionID, ObjectID, RefObjectName, ObjectTableName, Area, FormID, Disabled, IsCommon, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ObjectTableNameDetail, VoucherSettingTable, VoucherSettingColumn)
		values ('@@@', '05', N'Chiến dịch', 'CRMT20401', 'CRM', 'CRMF2041', 0, 1, 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', NULL, 'AT0002','S1')

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2015 WHERE ObjectTableName = N'OOT2110')
		Insert into ST2015 (DivisionID, ObjectID, RefObjectName, ObjectTableName, Area, FormID, Disabled, IsCommon, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ObjectTableNameDetail, VoucherSettingTable, VoucherSettingColumn)
		values ('@@@', '08', N'Công việc', 'OOT2110', 'OO', 'OOF2111', 0, 1, 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', NULL, 'OOT0060','VoucherTask')

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2015 WHERE ObjectTableName = N'CRMT20301')
		Insert into ST2015 (DivisionID, ObjectID, RefObjectName, ObjectTableName, Area, FormID, Disabled, IsCommon, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ObjectTableNameDetail, VoucherSettingTable, VoucherSettingColumn)
		values ('@@@', '01', N'Đầu mối', 'CRMT20301', 'CRM', 'CRMF2031', 0, 1, 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', NULL, 'AT0002','S1')

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2015 WHERE ObjectTableName = N'CRMT90051')
		Insert into ST2015 (DivisionID, ObjectID, RefObjectName, ObjectTableName, Area, FormID, Disabled, IsCommon, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ObjectTableNameDetail, VoucherSettingTable, VoucherSettingColumn)
		values ('@@@', '07', N'Sự kiện', 'CRMT90051', 'CRM', 'CRMF9005', 0, 1, 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', NULL, NULL, NULL)

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2015 WHERE ObjectTableName = N'CRMT20801')
		Insert into ST2015 (DivisionID, ObjectID, RefObjectName, ObjectTableName, Area, FormID, Disabled, IsCommon, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ObjectTableNameDetail, VoucherSettingTable, VoucherSettingColumn)
		values ('@@@', '06', N'Yêu cầu', 'CRMT20801', 'CRM', 'CRMF2081', 0, 1, 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', NULL, 'CRMT00000','VoucherRequestCustomer')

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2015 WHERE ObjectTableName = N'CMNT90051_1')
		Insert into ST2015 (DivisionID, ObjectID, RefObjectName, ObjectTableName, Area, FormID, Disabled, IsCommon, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ObjectTableNameDetail, VoucherSettingTable, VoucherSettingColumn)
		values ('@@@', '09', N'Email', 'CMNT90051_1', NULL, 'CMNF90051_1', 0, 1, 'ASOFTADMIN', '2020-09-24 00:00:00.000', 'ASOFTADMIN', '2020-09-24 00:00:00.000', NULL, NULL, NULL)

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2015 WHERE ObjectTableName = N'AT1103')
		Insert into ST2015 (DivisionID, ObjectID, RefObjectName, ObjectTableName, Area, FormID, Disabled, IsCommon, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ObjectTableNameDetail, VoucherSettingTable, VoucherSettingColumn)
		values ('@@@', '10', N'Người dùng', 'AT1103', NULL, 'SF1001', 0, 1, 'ASOFTADMIN', '2020-11-05 00:00:00.000', 'ASOFTADMIN', '2020-11-05 00:00:00.000', NULL, NULL, NULL)

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2015 WHERE ObjectTableName = N'HRMT2160')
		Insert into ST2015 (DivisionID, ObjectID, RefObjectName, ObjectTableName, Area, FormID, Disabled, IsCommon, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ObjectTableNameDetail, VoucherSettingTable, VoucherSettingColumn)
		values ('@@@', '11', N'Huê hồng', 'HRMT2160', NULL, 'HRMF2160', 0, 1, 'ASOFTADMIN', '2020-11-27 00:00:00.000', 'ASOFTADMIN', '2020-11-27 00:00:00.000', NULL, NULL, NULL)
	
	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2015 WHERE ObjectTableName = N'HRMT2150')
		Insert into ST2015 (DivisionID, ObjectID, RefObjectName, ObjectTableName, Area, FormID, Disabled, IsCommon, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ObjectTableNameDetail, VoucherSettingTable, VoucherSettingColumn)
		values ('@@@', '12', N'BlackList', 'HRMT2150', NULL, 'HRMF2150', 0, 1, 'ASOFTADMIN', '2020-11-27 00:00:00.000', 'ASOFTADMIN', '2020-11-27 00:00:00.000', NULL, NULL, NULL)

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2015 WHERE ObjectTableName = N'CRMT2210')
		Insert into ST2015 (DivisionID, ObjectID, RefObjectName, ObjectTableName, Area, FormID, Disabled, IsCommon, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ObjectTableNameDetail, VoucherSettingTable, VoucherSettingColumn)
		values ('@@@', '13', N'Ao đầu mối', 'CRMT2210', NULL, 'CRMF2210', 0, 1, 'ASOFTADMIN', '2020-11-27 00:00:00.000', 'ASOFTADMIN', '2020-11-27 00:00:00.000', NULL, NULL, NULL)

	IF NOT EXISTS(SELECT TOP 1 1 FROM ST2015 WHERE ObjectID = '00')
		Insert into ST2015 (DivisionID, ObjectID, RefObjectName, ObjectTableName, Area, FormID, Disabled, IsCommon, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, ObjectTableNameDetail, VoucherSettingTable, VoucherSettingColumn)
		values ('@@@', '00', N'SYSTEM', 'NONE' , NULL, 'NONE', 0, 1, 'ASOFTADMIN', '2020-11-27 00:00:00.000', 'ASOFTADMIN', '2020-11-27 00:00:00.000', NULL, NULL, NULL)
 	
