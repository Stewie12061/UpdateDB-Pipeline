-- <Summary>: Cải tiến tốc độ màn hình tìm kiếm, truy vấn, in, xuất excel, Bổ sung Index (dùng store CRMP20501)
----Created by: Phan thanh hoàng vũ, Date: 06/07/2017
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CRMT20501]') AND name = N'DivisionID_AssignedToUserID')
CREATE NONCLUSTERED INDEX [DivisionID_AssignedToUserID] ON [dbo].[CRMT20501]
(
	[DivisionID] ASC,
	[AssignedToUserID] ASC
)
INCLUDE ( 	[APK],
	[OpportunityName],
	[StageID],
	[NextActionID],
	[PriorityID],
	[Disabled],
	[IsCommon],
	[ExpectAmount],
	[Notes],
	[Rate],
	[CreateUserID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

----Created by:Cao Thị Phượng, Date: 06/07/2017
---Bổ sung index cho report báo cáo thống kê cơ hội theo giai đoạn
/****** Object:  Index [Index_Report]    Script Date: 07/06/2017 2:04:32 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CRMT20501]') AND name = N'Index_Report')
CREATE NONCLUSTERED INDEX [Index_Report] ON [dbo].[CRMT20501]
(
	[DivisionID] ASC
)
INCLUDE ( 	[OpportunityID],
	[OpportunityName],
	[StageID],
	[AccountID],
	[ExpectAmount],
	[AssignedToUserID],
	[SourceID],
	[ExpectedCloseDate],
	[Rate],
	[NextActionID],
	[NextActionDate],
	[CreateUserID],
	[CreateDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
