-- <Summary>
---- 
-- <History>
---- Create on 10/12/2010 by Thanh Trẫm
---- Modified on ... by ...
-- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1001STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1001STD](
	[CountryID] [nvarchar](50) NOT NULL,
	[CountryName] [nvarchar](250) NULL,
	[Disabled] [tinyint] NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL
) ON [PRIMARY]
END

