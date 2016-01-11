-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT9011STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT9011STD](
	[ColumnID] [nvarchar](50) NOT NULL,
	[ColumnName] [nvarchar](250) NULL,
	[SysColumnName] [nvarchar](250) NULL,
	[Orders] [int] NOT NULL,
	[IsChosen] [tinyint] NOT NULL
) ON [PRIMARY]
END
