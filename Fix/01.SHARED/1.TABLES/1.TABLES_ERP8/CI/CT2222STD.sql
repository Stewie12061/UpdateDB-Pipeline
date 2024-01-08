-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Việt Khánh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CT2222STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CT2222STD](
	[TablesName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[FieldID] [nvarchar](50) NOT NULL,
	[Type] [tinyint] NULL,
	[Orders] [tinyint] NULL,
	[Disabled] [tinyint] NOT NULL
) ON [PRIMARY]
END