
/****** Object:  Index [01_AT1301_DivisionID_Disabled]    Script Date: 17/01/2014 11:43:41 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AT1301]') 
            AND name = N'01_AT1301_DivisionID_Disabled')

CREATE NONCLUSTERED INDEX [01_AT1301_DivisionID_Disabled] ON [dbo].[AT1301]
(
	[DivisionID] ASC,
	[Disabled] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

