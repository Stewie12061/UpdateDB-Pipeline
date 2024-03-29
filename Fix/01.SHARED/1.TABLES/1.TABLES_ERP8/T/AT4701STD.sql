-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT4701STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT4701STD](
	[ReportCode] [nvarchar](50) NOT NULL,
	[ColumnID] [nvarchar](50) NOT NULL,
	[ColumnType] [nvarchar](100) NULL,
	[IsOriginal] [tinyint] NOT NULL,
	[ColumnBudget] [nvarchar](50) NULL,
	[FromAccountID] [nvarchar](50) NULL,
	[ToAccountID] [nvarchar](50) NULL,
	[FromCoAccountID] [nvarchar](50) NULL,
	[ToCorAccountID] [nvarchar](50) NULL,
	[IsUsed] [tinyint] NOT NULL,
	[ColumnCaption] [nvarchar](250) NULL,
	[ColumnID1] [nvarchar](50) NULL,
	[ColumnID2] [nvarchar](50) NULL,
	[ColumnID3] [nvarchar](50) NULL,
	[ColumnID4] [nvarchar](50) NULL,
	[Sign1] [nvarchar](5) NULL,
	[Sign2] [nvarchar](5) NULL,
	[Sign3] [nvarchar](5) NULL,
	[Sign4] [nvarchar](5) NULL
) ON [PRIMARY]
END