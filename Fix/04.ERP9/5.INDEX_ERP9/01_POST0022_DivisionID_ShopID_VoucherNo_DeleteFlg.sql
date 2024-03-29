/****** Object:  Index [01_POST0022_DivisionID_ShopID_VoucherNo_DeleteFlg]    Script Date: 5/6/2014 4:52:34 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POST0022]') 
											   AND name = N'01_POST0022_DivisionID_ShopID_VoucherNo_DeleteFlg')
CREATE NONCLUSTERED INDEX [01_POST0022_DivisionID_ShopID_VoucherNo_DeleteFlg] ON [dbo].[POST0022]
(
	[DivisionID] ASC,
	[ShopID] ASC,
	[VoucherNo] ASC,
	[DeleteFlg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


