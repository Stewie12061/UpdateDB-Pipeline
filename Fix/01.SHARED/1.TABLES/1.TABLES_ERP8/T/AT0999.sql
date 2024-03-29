-- <Summary>
---- 
-- <History>
---- Create on 13/12/2011 by Bình Minh
-- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT0999]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT0999](
	[UserID] [nvarchar](50) NOT NULL,
	[KeyID] [nvarchar](50) NOT NULL,
	[TransTypeID] [nvarchar](50) NOT NULL,
	[Str02] [nvarchar](50) NULL,
	[Str03] [nvarchar](50) NULL,
	[Str04] [nvarchar](50) NULL,
	[Str05] [nvarchar](50) NULL,
	[Str06] [nvarchar](250) NULL,
	[Str07] [nvarchar](250) NULL,
	[Str08] [nvarchar](250) NULL,
	[Str09] [nvarchar](250) NULL,
	[Str10] [nvarchar](250) NULL,
	[Num01] [decimal](28, 8) NULL,
	[Num02] [decimal](28, 8) NULL,
	[Num03] [decimal](28, 8) NULL,
	[Num04] [decimal](28, 8) NULL,
	[Num05] [decimal](28, 8) NULL,
	[Date01] [datetime] NULL,
	[Date02] [datetime] NULL,
	[Date03] [datetime] NULL,
	[Date04] [datetime] NULL,
	[Date05] [datetime] NULL
) ON [PRIMARY]
END
---- Add giá trị default
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_AT0999_UserID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AT0999] ADD  CONSTRAINT [DF_AT0999_UserID]  DEFAULT ('') FOR [UserID]
END
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_AT0999_KeyID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AT0999] ADD  CONSTRAINT [DF_AT0999_KeyID]  DEFAULT ('') FOR [KeyID]
END
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_AT0999_TransTypeID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AT0999] ADD  CONSTRAINT [DF_AT0999_TransTypeID]  DEFAULT ('') FOR [TransTypeID]
END

