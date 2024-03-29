-- <Summary>
---- 
-- <History>
---- Create on 16/01/2013 by Bảo Anh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT0259]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[HT0259](
		[APK] [uniqueidentifier] DEFAULT NEWID(),
		[DivisionID] [nvarchar](3) NOT NULL,
		[ErrorID] [nvarchar](50) NOT NULL,
		[ErrorName] [nvarchar](250) NULL,
		[Notes] [nvarchar](250) NULL,
		[Disabled] [tinyint] NOT NULL,
		[CreateUserID] [nvarchar](50) NULL,
		[CreateDate] [datetime] NULL,
		[LastModifyUserID] [nvarchar](50) NULL,
		[LastModifyDate] [datetime] NULL,
		CONSTRAINT [PK_HT0259] PRIMARY KEY NONCLUSTERED 
		(
			[DivisionID] ASC,
			[ErrorID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END