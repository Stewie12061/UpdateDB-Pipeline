-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MT0811STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MT0811STD](
	[ResultTypeID] [nvarchar](50) NOT NULL,
	[ResultTypeName] [nvarchar](250) NOT NULL,
	[InventoryTypeCaption] [nvarchar](100) NULL,
	[InventoryCaption] [nvarchar](100) NULL,
	[DefaultTypeID] [nvarchar](50) NULL,
	[ResultOrder] [tinyint] NULL,
	[Type] [tinyint] NOT NULL,
	[ResultTypeNameOther] [nvarchar](50) NULL,
	[InventoryTypeOther] [nvarchar](50) NULL,
	[InventoryOther] [nvarchar](50) NULL
) ON [PRIMARY]
END

