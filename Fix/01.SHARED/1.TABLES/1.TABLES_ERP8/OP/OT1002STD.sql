-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT1002STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OT1002STD](
	[AnaID] [nvarchar](50) NOT NULL,
	[AnaTypeID] [nvarchar](50) NOT NULL,
	[AnaName] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[Disabled] [tinyint] NOT NULL,
	[AnaNameE] [nvarchar](250) NULL
) ON [PRIMARY]
END

