/****** Object:  Index [02_AT0005_DivisionID_TypeID_IsUsed]    Script Date: 01/22/2014 08:03:12 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AT0005]') 
            AND name = N'02_AT0005_DivisionID_TypeID_IsUsed')
CREATE NONCLUSTERED INDEX [02_AT0005_DivisionID_TypeID_IsUsed] ON [dbo].[AT0005] 
(
	[DivisionID] ASC,
	[TypeID] ASC,
	[IsUsed] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
