--****** Object:  Index [01_POST0033_DivisionID_ShopID_AreaID_TableID]
------- Purpose: Tạo index dùng cho truy vấn bảng POST0033
-- Create by: Lê Thị Hạnh
-- Create Date: 27/06/2014 
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POST0033]')
											   AND name = N'01_POST0033_DivisionID_ShopID_AreaID_TableID')
CREATE NONCLUSTERED INDEX [01_POST0033_DivisionID_ShopID_AreaID_TableID] ON [DBO].[POST0033]
(
	[DivisionID] ASC,
	[ShopID] ASC,
	[AreaID] ASC,
	[TableID] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]