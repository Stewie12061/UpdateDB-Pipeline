-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Mỹ Tuyền
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MT5002STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MT5002STD](
	[DistributedMethod] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[IsCoefficient] [tinyint] NOT NULL,
	[IsApportion] [tinyint] NOT NULL,
	[Types] [tinyint] NOT NULL,
	[Other] [nvarchar](50) NULL,
	[Is621] [tinyint] NOT NULL,
	[Is622] [tinyint] NOT NULL,
	[Is627] [tinyint] NOT NULL
) ON [PRIMARY]
END
