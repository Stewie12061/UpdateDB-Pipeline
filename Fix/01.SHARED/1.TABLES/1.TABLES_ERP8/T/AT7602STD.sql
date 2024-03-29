-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on 14/04/2015 by Hoàng Vũ: Add column into table AT7602STD about [TT200]
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT7602STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT7602STD](
	[ReportCode] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[LineCode] [nvarchar](50) NOT NULL,
	[LineDescription] [nvarchar](250) NULL,
	[PrintCode] [nvarchar](50) NULL,
	[AccountIDFrom] [nvarchar](50) NULL,
	[AccountIDTo] [nvarchar](50) NULL,
	[CorAccountIDFrom] [nvarchar](50) NULL,
	[CorAccountIDTo] [nvarchar](50) NULL,
	[D_C] [tinyint] NULL,
	[AmountSign] [tinyint] NULL,
	[PeriodAmount] [tinyint] NULL,
	[AccuSign] [nvarchar](5) NULL,
	[Accumulator] [nvarchar](50) NULL,
	[Level1] [tinyint] NULL,
	[Suppress] [tinyint] NULL,
	[PrintStatus] [tinyint] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[ColStatus01] [tinyint] NULL,
	[ColStatus02] [tinyint] NULL,
	[ColStatus03] [tinyint] NULL,
	[ColStatus04] [tinyint] NULL,
	[ColStatus05] [tinyint] NULL,
	[ColStatus06] [tinyint] NULL,
	[IsLastPeriod] [tinyint] NULL,
	[LineDescriptionE] [nvarchar](250) NULL,
	[Notes] [nvarchar](250) NULL
) ON [PRIMARY]
END
---- Add Columns
If Exists (Select * From sysobjects Where name = 'AT7602STD' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT7602STD'  and col.name = 'DisplayedMark')
           Alter Table  AT7602STD Add DisplayedMark tinyint default 0  --0: Hiện dấu dương, 1: Hiện dấu âm
END