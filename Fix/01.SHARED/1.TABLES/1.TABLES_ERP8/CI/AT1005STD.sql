-- <Summary>
---- 
-- <History>
---- Create on 13/12/2010 by Thanh Trẫm
---- Modified on ... by ...
-- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1005STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1005STD](
	[AccountID] [nvarchar](50) NOT NULL,
	[AccountName] [nvarchar](250) NULL,
	[Notes1] [nvarchar](250) NULL,
	[Notes2] [nvarchar](250) NULL,
	[GroupID] [nvarchar](50) NULL,
	[SubGroupID] [nvarchar](50) NULL,
	[IsBalance] [tinyint] NOT NULL,
	[IsDebitBalance] [tinyint] NOT NULL,
	[IsObject] [tinyint] NOT NULL,
	[IsNotShow] [tinyint] NOT NULL,
	[Disabled] [tinyint] NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[AccountNameE] [nvarchar](250) NULL
) ON [PRIMARY]
END
