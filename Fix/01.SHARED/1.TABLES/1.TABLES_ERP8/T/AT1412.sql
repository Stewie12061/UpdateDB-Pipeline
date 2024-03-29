-- <Summary>
---- 
-- <History>
---- Create on 14/11/2012 by Huỳnh Tấn Phú
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1412]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1412](
	[APK] [uniqueidentifier] NULL DEFAULT NEWID(),
	[DivisionID] [nvarchar](3) NOT NULL,
	[ModuleID] [nvarchar](50) NOT NULL,
	[GroupID] [nvarchar](50) NOT NULL,
	[DataTypeID] [nvarchar](50) NOT NULL DEFAULT (''),
	[Permission] [tinyint] NOT NULL DEFAULT ((1)),
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
 CONSTRAINT [PK_AT1412] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC,
	[ModuleID] ASC,
	[GroupID] ASC,
	[DataTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
