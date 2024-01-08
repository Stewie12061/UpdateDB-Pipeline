-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Việt Khánh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WT1005STD]') AND type in (N'U'))
BEGIN	
	CREATE TABLE [dbo].[WT1005STD](
		[TypeID] [nvarchar](50) NOT NULL,
		[SystemName] [nvarchar](250) NULL,
		[UserName] [nvarchar](250) NULL,
		[IsUsed] [tinyint] NOT NULL,
		[SystemNameE] [nvarchar](250) NULL,
		[UserNameE] [nvarchar](250) NULL
	) ON [PRIMARY]

END