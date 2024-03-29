-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT1006STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OT1006STD](
	[UnitID] [nvarchar](50) NOT NULL,
	[UnitName] [nvarchar](250) NULL,
	[UnitNameE] [nvarchar](250) NULL,
	[Type] [tinyint] NOT NULL,
	[Disabled] [tinyint] NOT NULL
) ON [PRIMARY]
END
