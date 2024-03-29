-- <Summary>
---- 
-- <History>
---- Create on 17/10/2013 by Huỳnh Tấn Phú
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FT0001]') AND type in (N'U'))
CREATE TABLE [dbo].[FT0001](
	[APK] [uniqueidentifier] NULL,
	[DivisionID] [nvarchar](50) NOT NULL,
	[TypeID] [nvarchar](20) NOT NULL,
	[IsAsset] [tinyint] NOT NULL,
	[SystemName] [nvarchar](100) NULL,
	[UserName] [nvarchar](100) NULL,
	[IsUsed] [tinyint] NOT NULL,
	[UserNameE] [nvarchar](100) NULL,

 CONSTRAINT [PK_FT0001] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC,
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
---- Add giá trị default
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_FT0001_APK]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT0001] ADD  CONSTRAINT [DF_FT0001_APK]  DEFAULT (newid()) FOR [APK]
END
