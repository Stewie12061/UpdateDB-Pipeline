-- <Summary>
---- 
-- <History>
---- Create on 08/02/2012 by Nguyễn Bình Minh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AT1510]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AT1510](
	[APK] [uniqueidentifier] DEFAULT NEWID(),
	[DivisionID] [nvarchar](50) NOT NULL,
	[CoefficientID] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Note] [nvarchar](250) NULL,
	[Disabled] [tinyint] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
 CONSTRAINT [PK_AT1510] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC,
	[CoefficientID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
