/****** Object:  Index [01_POST9999_DivisionID_TranMonth_TranYear_Disabled]    Script Date: 07/04/2014 11:43:41 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POST9999]') 
            AND name = N'01_POST9999_DivisionID_TranMonth_TranYear_Disabled')
CREATE NONCLUSTERED INDEX [01_POST9999_DivisionID_TranMonth_TranYear_Disabled] ON [dbo].[POST9999]
(
	[DivisionID] ASC,
	[TranMonth] ASC,
	[TranYear] ASC,
	[Disabled] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
