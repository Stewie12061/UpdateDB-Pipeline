-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Tố Oanh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MT1619STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MT1619STD](
	[EndMethodID] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[IsApportion] [tinyint] NULL
) ON [PRIMARY]
END