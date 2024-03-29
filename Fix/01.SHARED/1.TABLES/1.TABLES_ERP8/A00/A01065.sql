-- <Summary>
---- 
-- <History>
---- Create on 21/01/2010 by Bình Minh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[A01065]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[A01065](
	[APK] [uniqueidentifier] NOT NULL,
	[ImportTemplateID] [nvarchar](50) NOT NULL,
	[ImportTemplateName] [nvarchar](250) NOT NULL,
	[ImportTransTypeID] [nvarchar](50) NOT NULL,
	[DefaultSheet] [nvarchar](50) NULL,
	[AnchorCol] [nvarchar](50) NOT NULL,
	[StartRow] [int] NOT NULL,
	[DataFolder] [nvarchar](250) NULL,
	[DefaultFileName] [nvarchar](50) NULL,
	[Disabled] [tinyint] NOT NULL,
	[CreateUserID] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastModifyUserID] [nvarchar](50) NOT NULL,
	[LastModifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_A01065] PRIMARY KEY CLUSTERED 
(
	[ImportTemplateID] ASC
) ON [PRIMARY]
)
END
---- Add giá trị default
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_A01065_APK]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[A01065] ADD  CONSTRAINT [DF_A01065_APK]  DEFAULT (newid()) FOR [APK]
END
