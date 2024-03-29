-- <Summary>
---- 
-- <History>
---- Create on 21/01/2010 by Bình Minh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[A01066]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[A01066](
	[APK] [uniqueidentifier] NOT NULL DEFAULT (NEWID()),
	[OrderNum] [int] NOT NULL,
	[ImportTemplateID] [nvarchar](50) NOT NULL,
	[ColID] [nvarchar](50) NOT NULL,
	[ColName] [nvarchar](50) NOT NULL,
	[ColWidth] [int] NOT NULL,
	[CustomerCheckExpression] [nvarchar](50) NULL,
	[CustomerCheckMessage] [nvarchar](250) NULL,
	[DataCol] [nvarchar](50) NOT NULL,
	[Editable] [tinyint] NOT NULL,
	[IsObligated] [tinyint] NOT NULL DEFAULT(0),
	[Disabled] [tinyint] NOT NULL
 CONSTRAINT [PK_A01066] PRIMARY KEY CLUSTERED 
(
	[APK] ASC
) ON [PRIMARY]
)
END