/****** Object:  Index [01_APK_DivisionID_ShopID_DeleteFlg]    Script Date: 07/04/2014 11:43:41 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POST0016]') 
            AND name = N'01_APK_DivisionID_ShopID_DeleteFlg')
CREATE UNIQUE NONCLUSTERED INDEX [01_APK_DivisionID_ShopID_DeleteFlg] ON [dbo].[POST0016]
(
	[APK] ASC,
	[DivisionID] ASC,
	[ShopID] ASC,
	[DeleteFlg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


