-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT1000STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT1000STD](
	[MethodID] [nvarchar](50) NOT NULL,
	[SystemName] [nvarchar](250) NULL,
	[UserName] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[IsDivision] [tinyint] NOT NULL,
	[IsUsed] [tinyint] NULL
) ON [PRIMARY]
END
---- Add Columns

