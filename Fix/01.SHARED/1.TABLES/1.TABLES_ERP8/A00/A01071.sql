-- <Summary>
---- 
-- <History>
---- Create on 21/01/2010 by Bình Minh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[A01071]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[A01071](
	[ReportID] [nvarchar](50) NOT NULL,
	[OrderNo] [int] NOT NULL,
	[ControlID] [nvarchar](50) NOT NULL,
	[ControlType] [nvarchar](50) NOT NULL,
	[DataType] [tinyint] NOT NULL,
	[Caption] [nvarchar](250) NULL,
	[ControlWidth] [int] NOT NULL,
	[MaxLength] [int] NOT NULL,
	[InputMask] [nvarchar](50) NULL,
	[ControlSourceID] [nvarchar](50) NULL,
	[ControlSourceSQL] [nvarchar](max) NULL,
	[DefaultValue] [nvarchar](50) NULL,
	[Line] [int] NOT NULL,
	[DataCol] [int] NULL,
	[DataRow] [int] NULL,
	[GroupID] [int] NULL,
	[IsObInput] [bit] NOT NULL,
	[Visible] [bit] NOT NULL
 CONSTRAINT [PK_A01071] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC,
	[ControlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
---- Add giá trị default
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_A01077_GroupID]') AND parent_object_id = OBJECT_ID(N'[dbo].[A01071]'))
BEGIN
ALTER TABLE [dbo].[A01071] ADD  CONSTRAINT [DF_A01077_GroupID]  DEFAULT ((0)) FOR [GroupID]
END
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_A01077_Visible]') AND parent_object_id = OBJECT_ID(N'[dbo].[A01071]'))
BEGIN
ALTER TABLE [dbo].[A01071] ADD  CONSTRAINT [DF_A01077_Visible]  DEFAULT ((1)) FOR [Visible]
END
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_A01077_IsObInput]') AND parent_object_id = OBJECT_ID(N'[dbo].[A01071]'))
BEGIN
ALTER TABLE [dbo].[A01071] ADD  CONSTRAINT [DF_A01077_IsObInput]  DEFAULT ((1)) FOR [IsObInput]
END
---- Add Columns
If Exists (Select * From sysobjects Where name = 'A01071' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'A01071'  and col.name = 'DataCol')
           Alter Table  A01071 Add [DataCol] [int] NULL
End 
If Exists (Select * From sysobjects Where name = 'A01071' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'A01071'  and col.name = 'DataRow')
           Alter Table  A01071 Add DataRow int Null
End 
If Exists (Select * From sysobjects Where name = 'A01071' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'A01071'  and col.name = 'RowAllVisibled')
           Alter Table  A01071 Add RowAllVisibled bit NOT NULL Default(0)
End 
