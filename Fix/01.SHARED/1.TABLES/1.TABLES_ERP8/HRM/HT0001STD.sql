-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT0001STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT0001STD](
	[TargetTypeID] [nvarchar](50) NOT NULL,
	[TargetName] [nvarchar](250) NULL,
	[Caption] [nvarchar](250) NULL,
	[IsUsed] [tinyint] NOT NULL,
	[IsAmount] [tinyint] NOT NULL
) ON [PRIMARY]
END