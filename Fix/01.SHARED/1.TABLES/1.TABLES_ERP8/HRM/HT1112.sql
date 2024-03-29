-- <Summary>
---- 
-- <History>
---- Create on 20/03/2012 by Huỳnh Tấn Phú
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT1112]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT1112](
[APK] [uniqueidentifier] NOT NULL DEFAULT NEWID(),
[DivisionID] [nvarchar] (50) NOT NULL,
	[BaseSalaryFieldID] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[DescriptionE] [nvarchar](250) NULL,
	[Orders] [int] NULL,
	[FieldID] [nvarchar](50) NULL,
	[FOrders] [int] NULL,
	[TypeID] [int] NULL
) ON [PRIMARY]
END