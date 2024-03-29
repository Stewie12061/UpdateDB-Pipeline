-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Thanh Nguyen
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT6000STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT6000STD](
	[Code] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Type] [tinyint] NOT NULL,
	[Orders] [tinyint] NOT NULL,
	[Disabled] [tinyint] NOT NULL,
	[IsASOFTFA] [tinyint] NULL,
	[DescriptionE] [nvarchar](250) NULL
) ON [PRIMARY]
END