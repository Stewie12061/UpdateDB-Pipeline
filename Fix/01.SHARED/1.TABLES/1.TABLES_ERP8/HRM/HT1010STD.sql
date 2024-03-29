-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT1010STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT1010STD](
	[PoliticsID] [nvarchar](50) NOT NULL,
	[PoliticsName] [nvarchar](250) NULL,
	[Disabled] [tinyint] NOT NULL,
	[CreateUserID] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NOT NULL,
	[LastModifyDate] [datetime] NULL
) ON [PRIMARY]
END