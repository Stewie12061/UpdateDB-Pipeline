-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT4710STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT4710STD](
	[ReportCode] [nvarchar](50) NOT NULL,
	[ReportName1] [nvarchar](250) NULL,
	[ReportName2] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[ReportID] [nvarchar](50) NOT NULL,
	[Disabled] [tinyint] NOT NULL,
	[IsReceivable] [tinyint] NOT NULL,
	[IsDetail] [tinyint] NOT NULL,
	[DateType] [tinyint] NOT NULL,
	[GetColumnTitle] [tinyint] NOT NULL,
	[DebtAgeStepID] [nvarchar](50) NOT NULL,
	[Group1ID] [nvarchar](50) NULL,
	[Group2ID] [nvarchar](50) NULL,
	[Group3ID] [nvarchar](50) NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[Selection01ID] [nvarchar](50) NULL,
	[Selection02ID] [nvarchar](50) NULL,
	[Selection03ID] [nvarchar](50) NULL
) ON [PRIMARY]
END