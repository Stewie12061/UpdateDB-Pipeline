-- <Summary>
---- 
-- <History>
---- Create on 28/12/2012 by Huỳnh Tấn Phú
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1501STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1501STD](
	[AssetGroupID] [nvarchar](50) NOT NULL,
	[AssetGroupName] [nvarchar](250) NULL,
	[MinDepreciation] decimal(28,8) NULL,
	[MaxDepreciation] decimal(28,8) NULL,
	[Disabled] [tinyint] NOT NULL,
	[Orders] tinyint NULL
) ON [PRIMARY]
END