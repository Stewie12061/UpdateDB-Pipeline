-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT2223STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT2223STD](
	[Orders] [int] NOT NULL,
	[Bold] [tinyint] NULL,
	[Frame] [tinyint] NULL,
	[Step] [int] NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Code0] [nvarchar](50) NULL,
	[Sign] [numeric](18, 0) NOT NULL,
	[Caption1] [nvarchar](250) NULL,
	[Caption2] [nvarchar](250) NULL,
	[Amount1] [decimal](28, 8) NULL,
	[Amount2] [decimal](28, 8) NULL,
	[FCaption1] [nvarchar](250) NULL,
	[FCaption2] [nvarchar](250) NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL
) ON [PRIMARY]
END