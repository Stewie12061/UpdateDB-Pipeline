﻿-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Hoang Phuoc
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PT1102]') AND type in (N'U'))
CREATE TABLE [dbo].[PT1102](
	[APK] [uniqueidentifier] DEFAULT NEWID(),
	[DivisionID] [nvarchar](50) NOT NULL,
	[MacTypeID] [nvarchar](50) NOT NULL,
	[MacTypeName] [nvarchar](250) NOT NULL,
	[MacTypeGroupID] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](250) NULL,
	[Disabled] [tinyint] NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
 CONSTRAINT [PK_PT1102] PRIMARY KEY CLUSTERED 
(
	[MacTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
---- Add giá trị default
IF NOT EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PT1102_Disabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PT1102] ADD  CONSTRAINT [DF_PT1102_Disabled]  DEFAULT ((0)) FOR [Disabled]
END