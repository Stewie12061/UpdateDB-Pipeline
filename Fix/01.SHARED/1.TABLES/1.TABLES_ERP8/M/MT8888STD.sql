-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Mỹ Tuyền
---- Modified on 19/07/2012 by T.Khánh: add a new column IsDelete
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MT8888STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MT8888STD](
	[ReportID] [nvarchar](50) NOT NULL,
	[ReportName] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[GroupID] [nvarchar](50) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Disabled] [tinyint] NOT NULL,
	[SQLstring] [nvarchar](4000) NULL,
	[Description] [nvarchar](250) NULL,
	[Orderby] [nvarchar](250) NULL,
	[DescriptionE] [nvarchar](250) NULL,
	[TitleE] [nvarchar](250) NULL,
	[ReportNameE] [nvarchar](250) NULL
) ON [PRIMARY]
END
---- Add Columns
If Exists (Select * From sysobjects Where name = 'MT8888STD' and xtype ='U') 
Begin
     If not exists (select * from syscolumns col inner join sysobjects tab 
     On col.id = tab.id where tab.name =   'MT8888STD'  and col.name = 'IsDelete')
     Alter Table  MT8888STD Add IsDelete tinyint Not Null Default(0)
End
