-- <Summary>
---- 
-- <History>
---- Create on 09/10/2012 by Trọng Khánh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1411]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1411](
	[APK] [uniqueidentifier] DEFAULT NEWID(),
	[DivisionID] [nvarchar](50) NOT NULL,
	[GroupID] [nvarchar](50) NOT NULL,
	[PermissionDivisionID] [nvarchar](50) NOT NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
 CONSTRAINT [PK_AT1411] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC,
	[GroupID] ASC,
	[PermissionDivisionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END



