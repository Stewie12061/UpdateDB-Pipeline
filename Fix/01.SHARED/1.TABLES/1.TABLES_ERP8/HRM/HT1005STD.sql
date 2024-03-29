-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT1005STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT1005STD](
	[EducationLevelID] [nvarchar](50) NOT NULL,
	[EducationLevelName] [nvarchar](250) NULL,
	[Disabled] [tinyint] NOT NULL,
	[CreateUserID] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastModifyUserID] [nvarchar](50) NOT NULL,
	[LastModifyDate] [datetime] NOT NULL,
	[RaceEducation] [smallmoney] NULL
) ON [PRIMARY]
END