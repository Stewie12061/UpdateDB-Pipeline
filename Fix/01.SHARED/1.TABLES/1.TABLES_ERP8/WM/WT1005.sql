-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Việt Khánh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WT1005]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[WT1005](
		[APK] [uniqueidentifier] DEFAULT NEWID(),
		[DivisionID] [nvarchar](3) NOT NULL,
		[TypeID] [nvarchar](50) NOT NULL,
		[SystemName] [nvarchar](250) NOT NULL,
		[UserName] [nvarchar](250) NOT NULL,
		[IsUsed] [tinyint] NOT NULL,
		[SystemNameE] [nvarchar](250) NULL,
		[UserNameE] [nvarchar](250) NULL,
	 CONSTRAINT [PK_WT1005] PRIMARY KEY NONCLUSTERED 
	(
		[TypeID] ASC,
		[DivisionID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END