-- <Summary>
---- 
-- <History>
---- Create on 13/12/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1598STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1598STD](
	[ReportCode] [nvarchar](50) NOT NULL,
	[ReportName] [nvarchar](250) NULL,
	[ReportTitle] [nvarchar](250) NULL,
	[AmountFormat] [decimal](28, 8) NULL,
	[BracketNegative] [decimal](28, 8) NULL,
	[ReportID] [nvarchar](50) NULL,
	[IsCustomized] [decimal](28, 8) NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL
) ON [PRIMARY]
END