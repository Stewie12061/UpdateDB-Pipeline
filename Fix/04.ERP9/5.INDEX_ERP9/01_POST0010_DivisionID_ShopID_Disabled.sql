
/****** Object:  Index [01_POST0010_DivisionID_ShopID_Disabled]    Script Date: 1/27/2014 8:50:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POST0010]') 
            AND name = N'01_POST0010_DivisionID_ShopID_Disabled')

CREATE NONCLUSTERED INDEX [01_POST0010_DivisionID_ShopID_Disabled] ON [dbo].[POST0010]
(
	[DivisionID] ASC,
	[ShopID] ASC,
	[Disabled] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


