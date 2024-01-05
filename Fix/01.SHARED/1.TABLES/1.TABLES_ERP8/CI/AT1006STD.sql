-- <Summary>
---- 
-- <History>
---- Create on 13/12/2010 by Thanh Trẫm
---- Modified on ... by ...
-- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1006STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1006STD](
	[GroupID] [nvarchar](50) NOT NULL,
	[GroupName] [nvarchar](250) NULL,
	[Disabled] [tinyint] NOT NULL,
	[GroupNameE] [nvarchar](250) NULL
) ON [PRIMARY]
END
