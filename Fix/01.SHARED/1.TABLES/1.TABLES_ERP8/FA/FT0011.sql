-- <Summary>
---- 
-- <History>
---- Create on 15/12/2020 by Kiều Nga
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FT0011]') AND type in (N'U'))
CREATE TABLE [dbo].[FT0011](
	[APK] [uniqueidentifier] DEFAULT NEWID(),
	[AssetID] [nvarchar](50) NOT NULL,
	[DivisionID] [nvarchar](50) NOT NULL,
	[ToolID] [nvarchar](50) NOT NULL,
	[ToolName] [nvarchar](Max) NULL,
	[UnitID] [nvarchar](50) NULL,
	[Quantity] Decimal (28,8) NULL,
	[Amount] Decimal (28,8) NULL
 CONSTRAINT [PK_FT0011] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC,
	[APK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

