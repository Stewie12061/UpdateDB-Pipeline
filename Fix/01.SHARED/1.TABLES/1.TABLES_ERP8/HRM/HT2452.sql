-- <Summary>
---- 
-- <History>
---- Create on 20/03/2012 by Huỳnh Tấn Phú
---- Modified on ... by ...
---- <Example>
IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT2452]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT2452](
	[APK] [uniqueidentifier] NOT NULL DEFAULT NEWID(),
	[DivisionID] [nvarchar] (50) NOT NULL,
	[FileType] [int] NOT NULL DEFAULT ((1)),
	[StepID] [nvarchar](50) NOT NULL,
	[Orders] [int] NOT NULL DEFAULT (0),
	[FromCValue] [decimal](28, 8) NULL DEFAULT (0),
	[ToCValue] [decimal](28, 8) NULL DEFAULT (0),
	[AValue] [decimal](28, 8) NULL DEFAULT (0),
CONSTRAINT [PK_HT252] PRIMARY KEY CLUSTERED 
(
	[StepID] ASC,
	[DivisionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END