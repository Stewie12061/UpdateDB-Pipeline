-- <Summary>
---- 
-- <History>
---- Create on 20/03/2013 by Huỳnh Tấn Phú
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT3333]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[HT3333](
		[APK] [uniqueidentifier] NULL DEFAULT NEWID(),
		[GroupID] [nvarchar](50) NOT NULL,
		[DivisionID] [nvarchar](3) NOT NULL,
		[ModuleID] [nvarchar](50) NOT NULL,
		[ScreenID] [nvarchar](50) NOT NULL,
		[ScreenNameV] [nvarchar](50) NOT NULL,
		[ScreenNameE] [nvarchar](50) NOT NULL,
		[ColumnNameV] [nvarchar](50) NOT NULL,
		[ColumnNameE] [nvarchar](50) NOT NULL,
		[IsSysVisible] [tinyint] NOT NULL,
		[SysOrder] [int] NOT NULL,
		[IsVisible] [tinyint] NOT NULL,
		[Orders] [int] NOT NULL,
		[CreateDate] [datetime] NULL,
		[CreateUserID] [nvarchar](50) NULL,
		[LastModifyUserID] [nvarchar](50) NULL,
		[LastModifyDate] [datetime] NULL
		CONSTRAINT [PK_HT3333] PRIMARY KEY CLUSTERED 
	(
		[GroupID] ASC,
		[DivisionID] ASC,
		[ModuleID] ASC,
		[ScreenID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END