-- <Summary>: Cải tiến tốc độ màn hình tìm kiếm, truy vấn, in, xuất excel, Bổ sung Index (dùng store CRMP10101)
----Created by: Phan thanh hoàng vũ, Date: 06/07/2017
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CRMT10101]') AND name = N'DivisionID_AssignedToUserID')
CREATE NONCLUSTERED INDEX [DivisionID_AssignedToUserID] ON [dbo].[CRMT10101]
(
	[DivisionID] ASC,
	[AssignedToUserID] ASC
)
INCLUDE ([APK],
	[AccountName],
	[Address],
	[Tel],
	[Email],
	[InheritConvertID],
	[IsCommon],
	[IsUsing],
	[Disabled]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

-- <Summary>: Cải tiến tốc độ báo cáo phễu bán hàng theo nhân viên (dùng store CRMP30102)
----Created by: Phan thanh hoàng vũ, Date: 06/07/2017
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CRMT10101]') AND name = N'DivisionID_InheritConvertID')
CREATE NONCLUSTERED INDEX [DivisionID_InheritConvertID] ON [dbo].[CRMT10101] 
(
	[DivisionID],
	[InheritConvertID]
)
INCLUDE ([CreateDate],[CreateUserID],[AssignedToUserID])
GO

