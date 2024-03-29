-- <Summary>
---- 
-- <History>
---- Create on 13/12/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1403STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1403STD](
	[ScreenID] [nvarchar](50) NOT NULL,
	[GroupID] [nvarchar](50) NOT NULL,
	[ModuleID] [nvarchar](50) NOT NULL,
	[IsAddNew] [tinyint] NOT NULL,
	[IsUpdate] [tinyint] NOT NULL,
	[IsDelete] [tinyint] NOT NULL,
	[IsView] [tinyint] NOT NULL,
	[IsPrint] [tinyint] NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL
) ON [PRIMARY]
END