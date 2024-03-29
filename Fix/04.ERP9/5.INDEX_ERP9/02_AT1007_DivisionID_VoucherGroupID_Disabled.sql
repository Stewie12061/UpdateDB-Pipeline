/****** Object:  Index [02_AT1007_DivisionID_VoucherGroupID_Disabled]    Script Date: 20/01/2014 11:43:41 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AT1007]') 
            AND name = N'02_AT1007_DivisionID_VoucherGroupID_Disabled')

CREATE NONCLUSTERED INDEX [02_AT1007_DivisionID_VoucherGroupID_Disabled] ON [dbo].[AT1007] 
(
	[DivisionID] ASC,
	[VoucherGroupID] ASC,
	[Disabled] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


