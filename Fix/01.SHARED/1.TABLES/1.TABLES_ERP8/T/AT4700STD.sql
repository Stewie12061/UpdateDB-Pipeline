-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT4700STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT4700STD](
	[ReportCode] [nvarchar](50) NOT NULL,
	[ReportName1] [nvarchar](250) NOT NULL,
	[ReportName2] [nvarchar](250) NULL,
	[Selection01] [nvarchar](100) NULL,
	[Selection02] [nvarchar](100) NULL,
	[Selection03] [nvarchar](100) NULL,
	[Selection04] [nvarchar](100) NULL,
	[Selection05] [nvarchar](100) NULL,
	[Level01] [nvarchar](100) NULL,
	[Level02] [nvarchar](100) NULL,
	[Level03] [nvarchar](100) NULL,
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
	[LineZeroSuppress] [tinyint] NULL,
	[Level00] [nvarchar](50) NULL
) ON [PRIMARY]
END
