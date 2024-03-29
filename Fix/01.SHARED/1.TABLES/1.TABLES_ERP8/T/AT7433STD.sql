-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT7433STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT7433STD](
	[ReportCode] [nvarchar](50) NOT NULL,
	[ReportName] [nvarchar](250) NULL,
	[ReportID] [nvarchar](50) NULL,
	[Disabled] [tinyint] NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL
) ON [PRIMARY]
END

