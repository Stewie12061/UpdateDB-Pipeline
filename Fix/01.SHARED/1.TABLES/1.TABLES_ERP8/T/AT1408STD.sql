-- <Summary>
---- 
-- <History>
---- Create on 13/12/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1408STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1408STD](
	[DataTypeID] [nvarchar](50) NOT NULL,
	[DataTypeName] [nvarchar](250) NULL,
	[DataTypeNameE] [nvarchar](250) NULL
) ON [PRIMARY]
END
