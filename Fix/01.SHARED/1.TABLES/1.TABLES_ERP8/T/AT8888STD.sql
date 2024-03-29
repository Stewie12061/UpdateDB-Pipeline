-- <Summary>
---- 
-- <History>
---- Create on 10/12/2010 by Phát Danh
---- Modified on 19/07/2012 by T.Khánh: add a new column IsDelete to AT8888STD
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT8888STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT8888STD](
	[ReportID] [nvarchar](50) NOT NULL,
	[ReportName] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[GroupID] [nvarchar](50) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Disabled] [tinyint] NOT NULL,
	[SQLstring] [nvarchar](4000) NULL,
	[Orderby] [nvarchar](100) NULL,
	[Description] [nvarchar](250) NULL,
	[DescriptionE] [nvarchar](250) NULL,
	[TitleE] [nvarchar](250) NULL,
	[ReportNameE] [nvarchar](250) NULL
) ON [PRIMARY]
END
---- Add Columns
If Exists (Select * From sysobjects Where name = 'AT8888STD' and xtype ='U') 
Begin
    If not exists (select * from syscolumns col inner join sysobjects tab 
    On col.id = tab.id where tab.name =   'AT8888STD'  and col.name = 'IsDelete')
    Alter Table  AT8888STD Add IsDelete tinyint Not Null Default(0)
End 

---- Modified by Bảo Thy on 25/04/2017: Alter column Type TINYINT -> INT
IF EXISTS (SELECT * FROM Sysobjects WHERE Name = 'AT8888STD' and xtype ='U') 
BEGIN
    IF EXISTS (SELECT * FROM Syscolumns Col INNER JOIN Sysobjects Tab ON Col.ID = tab.ID where Tab.Name = 'AT8888STD' AND Col.Name = 'Type')
    ALTER TABLE AT8888STD ALTER COLUMN [Type] INT NULL
END 
