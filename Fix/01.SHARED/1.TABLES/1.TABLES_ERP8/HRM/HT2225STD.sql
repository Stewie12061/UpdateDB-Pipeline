-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT2225STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT2225STD](
	[Orders] [int] NOT NULL,
	[Bold] [tinyint] NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Step] [tinyint] NULL,
	[Code] [nvarchar](50) NULL,
	[Code0] [nvarchar](50) NULL,
	[Sign] [numeric](18, 0) NOT NULL,
	[Amount1] [decimal](28, 8) NULL,
	[Amount2] [decimal](28, 8) NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL
) ON [PRIMARY]
END