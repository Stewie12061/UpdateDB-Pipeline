-- <Summary>
---- 
-- <History>
---- Create on 13/12/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1599STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1599STD](
	[LineID] [nvarchar](50) NOT NULL,
	[ReportCode] [nvarchar](50) NULL,
	[LineDescription] [nvarchar](250) NULL,
	[AccountIDFrom] [nvarchar](50) NULL,
	[AccountIDTo] [nvarchar](50) NULL,
	[D_C] [tinyint] NULL,
	[Detail] [tinyint] NULL,
	[Method] [nvarchar](50) NULL,
	[TypeValues] [nvarchar](100) NULL,
	[Cause] [nvarchar](100) NULL,
	[Level1] [tinyint] NULL,
	[PrintStatus] [tinyint] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LineDescriptionE] [nvarchar](250) NULL,
	[Notes] [nvarchar](250) NULL,
	[Sign] [nvarchar](50) NOT NULL,
	[NowstatusID] [nvarchar](50) NULL
) ON [PRIMARY]
END
