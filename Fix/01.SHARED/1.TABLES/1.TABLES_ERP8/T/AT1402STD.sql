-- <Summary>
---- 
-- <History>
---- Create on 13/12/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1402STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1402STD](
	[GroupID] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END