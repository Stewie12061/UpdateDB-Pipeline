-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT0003STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT0003STD](
	[CoefficientID] [nvarchar](50) NOT NULL,
	[FieldName] [nvarchar](250) NULL,
	[CoefficientName] [nvarchar](250) NULL,
	[Caption] [nvarchar](250) NULL,
	[IsUsed] [tinyint] NULL,
	[IsConstant] [tinyint] NULL,
	[ValueOfConstant] [decimal](28, 8) NULL
) ON [PRIMARY]
END