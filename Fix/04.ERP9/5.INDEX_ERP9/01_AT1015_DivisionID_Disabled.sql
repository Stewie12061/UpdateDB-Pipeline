/****** Object:  Index [01_AT1015_DivisionID_Disabled]    Script Date: 01/10/2014 11:43:41 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AT1015]') 
            AND name = N'01_AT1015_DivisionID_Disabled')

CREATE NONCLUSTERED INDEX [01_AT1015_DivisionID_Disabled] ON [dbo].[AT1015] 
(
	[DivisionID] ASC,
	[Disabled] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


