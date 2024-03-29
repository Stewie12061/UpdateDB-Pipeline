/****** Object:  Index [03_POST0017_DivisionID_ShopID_DeleteFlg_VoucherNo]    Script Date: 14/04/2014 11:43:41 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POST0017]') 
            AND name = N'03_POST0017_DivisionID_ShopID_DeleteFlg_VoucherNo')
CREATE NONCLUSTERED INDEX [03_POST0017_DivisionID_ShopID_DeleteFlg_VoucherNo] ON [dbo].[POST0017]
(
	[DivisionID] ASC,
	[ShopID] ASC,
	[DeleteFlg] ASC,
	[VoucherNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO




