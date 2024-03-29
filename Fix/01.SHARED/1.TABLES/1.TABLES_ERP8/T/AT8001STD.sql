-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT8001STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT8001STD](
	[Code] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Language] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Disabled] [tinyint] NULL
) ON [PRIMARY]
END
