/****** Object:  Index [01_APK_DivisionID_ShopID_DeleteFlg_APKMaster]    Script Date: 07/04/2014 11:43:41 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POST00161]') 
            AND name = N'01_APK_DivisionID_ShopID_DeleteFlg_APKMaster')
CREATE NONCLUSTERED INDEX [01_APK_DivisionID_ShopID_DeleteFlg_APKMaster] ON [dbo].[POST00161]
(
	[APK] ASC,
	[DivisionID] ASC,
	[ShopID] ASC,
	[DeleteFlg] ASC,
	[APKMaster] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


