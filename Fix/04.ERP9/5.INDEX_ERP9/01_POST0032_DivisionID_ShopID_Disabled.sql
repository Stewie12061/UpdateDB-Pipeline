--****** Object:  Index [01_POST0032_DivisionID_ShopID_Disabled]
-- Create by: Lê Thị Hạnh
-- Create Date: 27/06/2014 
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POST0032]')
											   AND name = N'01_POST0032_DivisionID_ShopID_Disabled')
CREATE NONCLUSTERED INDEX [01_POST0032_DivisionID_ShopID_Disabled] ON [DBO].[POST0032]
(
	[DivisionID] ASC,
	[ShopID] ASC,
	[Disabled] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]