-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT7601STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT7601STD](
	[ReportCode] [nvarchar](50) NOT NULL,
	[ReportName1] [nvarchar](250) NULL,
	[ReportName2] [nvarchar](250) NULL,
	[ReportID] [nvarchar](50) NULL,
	[ReportID2] [nvarchar](50) NULL,
	[ReportID3] [nvarchar](50) NULL,
	[BracketNegative] [tinyint] NULL,
	[AmountFormat] [tinyint] NULL,
	[Customized] [tinyint] NULL,
	[Column01_1] [nvarchar](50) NULL,
	[Column01_2] [nvarchar](50) NULL,
	[Column01_3] [nvarchar](50) NULL,
	[Column01_4] [nvarchar](50) NULL,
	[Column01_5] [nvarchar](50) NULL,
	[Column02_1] [nvarchar](50) NULL,
	[Column02_2] [nvarchar](50) NULL,
	[Column02_3] [nvarchar](50) NULL,
	[Column02_4] [nvarchar](50) NULL,
	[Column02_5] [nvarchar](50) NULL,
	[Column02_6] [nvarchar](50) NULL,
	[Column02_7] [nvarchar](50) NULL,
	[Column02_8] [nvarchar](50) NULL,
	[Column02_9] [nvarchar](50) NULL,
	[Column03_1] [nvarchar](50) NULL,
	[Column03_2] [nvarchar](50) NULL,
	[Column03_4] [nvarchar](50) NULL,
	[Column03_5] [nvarchar](50) NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[Disabled] [tinyint] NULL
) ON [PRIMARY]
END