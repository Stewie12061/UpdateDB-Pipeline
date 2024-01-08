-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT2222STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT2222STD](
	[TablesName] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[FieldID] [nvarchar](50) NOT NULL,
	[Type] [tinyint] NULL,
	[Orders] [tinyint] NULL,
	[Disabled] [tinyint] NOT NULL
) ON [PRIMARY]
END