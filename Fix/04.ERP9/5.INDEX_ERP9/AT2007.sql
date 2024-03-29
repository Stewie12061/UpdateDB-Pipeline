
/****** Object:  Index [DivisionID_VoucherID_InheritVoucherID]    Script Date: 1/27/2014 8:50:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AT2007]') 
            AND name = N'DivisionID_VoucherID_InheritVoucherID')

CREATE NONCLUSTERED INDEX [DivisionID_VoucherID_InheritVoucherID] ON [dbo].[AT2007]
(
	[DivisionID] ASC,
	[VoucherID] ASC,
	[InheritVoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


