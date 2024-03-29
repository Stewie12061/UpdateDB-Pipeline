/****** Object:  Index [01_POST0014_DivisionID_WareHouseID_Disabled]    Script Date: 07/04/2014 11:43:41 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POST0014]') 
            AND name = N'01_POST0014_DivisionID_WareHouseID_Disabled')
CREATE NONCLUSTERED INDEX [01_POST0014_DivisionID_WareHouseID_Disabled] ON [dbo].[POST0014]
(
	[DivisionID] ASC,
	[WareHouseID] ASC,
	[Disabled] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

