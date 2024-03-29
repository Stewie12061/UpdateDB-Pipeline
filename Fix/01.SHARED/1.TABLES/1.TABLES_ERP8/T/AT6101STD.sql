-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on 03/02/2012 by Huỳnh Tấn Phú: Bo sung 5 ma phan tich Ana
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT6101STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT6101STD](
	[ReportCode] [nvarchar](50) NOT NULL,
	[LineID] [nvarchar](50) NOT NULL,
	[LineCode] [nvarchar](50) NOT NULL,
	[LineDescription] [nvarchar](250) NULL,
	[AccountIDFrom] [nvarchar](50) NULL,
	[AccountIDTo] [nvarchar](50) NULL,
	[CorAccountIDFrom] [nvarchar](50) NULL,
	[CorAccountIDTo] [nvarchar](50) NULL,
	[LineType] [nvarchar](50) NULL,
	[BreakDetail] [tinyint] NULL,
	[AmountSign] [tinyint] NULL,
	[AccuSign] [nvarchar](5) NULL,
	[Accumulator] [nvarchar](100) NULL,
	[Accumulator1] [nvarchar](100) NULL,
	[Accumulator2] [nvarchar](100) NULL,
	[PrintStatus] [tinyint] NULL,
	[Type] [tinyint] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[IsAccount] [tinyint] NULL,
	[LevelID] [tinyint] NULL,
	[Sign] [nvarchar](5) NULL,
	[Ana01ID] [nvarchar](50) NULL,
	[Ana02ID] [nvarchar](50) NULL,
	[Ana03ID] [nvarchar](50) NULL,
	[Ana04ID] [nvarchar](50) NULL,
	[Ana05ID] [nvarchar](50) NULL
) ON [PRIMARY]
END
---- Add Columns
If Exists (Select * From sysobjects Where name = 'AT6101STD' and xtype ='U') 
Begin 
If not exists (select * from syscolumns col inner join sysobjects tab 
On col.id = tab.id where tab.name =   'AT6101STD'  and col.name = 'Ana06ID')
Alter Table  AT6101STD Add Ana06ID nvarchar(50) Null,
					 Ana07ID nvarchar(50) Null,
					 Ana08ID nvarchar(50) Null,
					 Ana09ID nvarchar(50) Null,
					 Ana10ID nvarchar(50) Null
End