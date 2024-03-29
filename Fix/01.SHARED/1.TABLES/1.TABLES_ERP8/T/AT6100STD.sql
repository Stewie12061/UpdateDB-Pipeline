-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT6100STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT6100STD](
	[ReportCode] [nvarchar](50) NOT NULL,
	[ReportName1] [nvarchar](250) NOT NULL,
	[ReportName2] [nvarchar](250) NULL,
	[IsUsedColA] [tinyint] NOT NULL,
	[IsUsedColB] [tinyint] NOT NULL,
	[IsUsedColC] [tinyint] NOT NULL,
	[IsUsedColD] [tinyint] NOT NULL,
	[IsUsedColE] [tinyint] NOT NULL,
	[ColumnACaption] [nvarchar](250) NULL,
	[ColumnBCaption] [nvarchar](250) NULL,
	[ColumnCCaption] [nvarchar](250) NULL,
	[ColumnDCaption] [nvarchar](250) NULL,
	[ColumnECaption] [nvarchar](250) NULL,
	[ColumnABudget] [nvarchar](50) NULL,
	[ColumnBBudget] [nvarchar](50) NULL,
	[ColumnCBudget] [nvarchar](50) NULL,
	[ColumnDBudget] [nvarchar](50) NULL,
	[ColumnEBudget] [nvarchar](50) NULL,
	[Selection01] [nvarchar](50) NULL,
	[Selection02] [nvarchar](50) NULL,
	[Selection03] [nvarchar](50) NULL,
	[Selection04] [nvarchar](50) NULL,
	[Selection05] [nvarchar](50) NULL,
	[Level01] [nvarchar](50) NULL,
	[Level02] [nvarchar](50) NULL,
	[BracketNegative] [tinyint] NULL,
	[DecimalPlaces] [tinyint] NULL,
	[AmountFormat] [tinyint] NULL,
	[Customized] [tinyint] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[Disabled] [tinyint] NOT NULL,
	[ReportID] [nvarchar](50) NULL,
	[LineZeroSuppress] [tinyint] NULL
) ON [PRIMARY]
END