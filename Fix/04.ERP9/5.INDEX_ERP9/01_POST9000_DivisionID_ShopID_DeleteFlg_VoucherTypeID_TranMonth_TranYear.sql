/****** Object:  Index [01_POST9000_DivisionID_ShopID_DeleteFlg_VoucherTypeID_TranMonth_TranYear]    Script Date: 07/04/2014 11:43:41 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POST9000]') 
            AND name = N'01_POST9000_DivisionID_ShopID_DeleteFlg_VoucherTypeID_TranMonth_TranYear')
CREATE NONCLUSTERED INDEX [01_POST9000_DivisionID_ShopID_DeleteFlg_VoucherTypeID_TranMonth_TranYear] ON [dbo].[POST9000]
(
	[DivisionID] ASC,
	[ShopID] ASC,
	[DeleteFlg] ASC,
	[VoucherTypeID] ASC,
	[TranMonth] ASC,
	[TranYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
