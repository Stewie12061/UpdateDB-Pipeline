-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Mỹ Tuyền
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT4011STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OT4011STD](
	[ReportCode] [nvarchar](50) NOT NULL,
	[ReportName] [nvarchar](250) NULL,
	[Filter01ID] [nvarchar](50) NULL,
	[Filter02ID] [nvarchar](50) NULL,
	[Filter03ID] [nvarchar](50) NULL,
	[Filter04ID] [nvarchar](50) NULL,
	[Disabled] [tinyint] NOT NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL
) ON [PRIMARY]
END