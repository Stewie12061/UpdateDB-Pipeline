-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1206STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1206STD](
	[DebtAgeStepID] [nvarchar](50) NOT NULL,
	[AgeID] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Orders] [tinyint] NOT NULL,
	[FromDay] [int] NULL,
	[ToDay] [int] NULL,
	[Title] [nvarchar](250) NULL,
	[DefinedUserID] [nvarchar](50) NULL,
	[Disabled] [tinyint] NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL
) ON [PRIMARY]
END
