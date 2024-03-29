/****** Object:  Index [02_POST0017_APK_DivisionID_ShopID_DeleteFlg]    Script Date: 14/04/2014 11:43:41 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POST0017]') 
            AND name = N'02_POST0017_APK_DivisionID_ShopID_DeleteFlg')
CREATE NONCLUSTERED INDEX [02_POST0017_APK_DivisionID_ShopID_DeleteFlg] ON [dbo].[POST0017]
(
	[APK] ASC,
	[DivisionID] ASC,
	[ShopID] ASC,
	[DeleteFlg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

