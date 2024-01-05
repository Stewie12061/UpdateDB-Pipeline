﻿-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Mỹ Tuyền
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT7909]') AND type in (N'U'))
CREATE TABLE [dbo].[AT7909](
    [APK] [uniqueidentifier] DEFAULT NEWID(),
    [DivisionID] [nvarchar] (3) NOT NULL,
	[GroupID] [nvarchar](50) NULL,
	[TitleID] [nvarchar](50) NULL,
	[TitleName] [nvarchar](250) NULL,
	[LineDes] [nvarchar](250) NULL,
	[Amount01] [decimal](28, 8) NULL,
	[Amount02] [decimal](28, 8) NULL,
CONSTRAINT [PK_AT7909] PRIMARY KEY NONCLUSTERED 
(
	[APK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
