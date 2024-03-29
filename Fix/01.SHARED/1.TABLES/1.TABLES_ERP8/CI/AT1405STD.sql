-- <Summary>
---- 
-- <History>
---- Create on 13/12/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1405STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1405STD](
	[UserID] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](250) NULL,
	[Password] [nvarchar](100) NULL,
	[Disabled] [tinyint] NOT NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL
) ON [PRIMARY]
END