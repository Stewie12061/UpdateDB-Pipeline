-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on 14/04/2015 by Hoàng Vũ: Add column into table AT7902STD about [TT200]
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT7902STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT7902STD](
	[LineID] [nvarchar](50) NOT NULL,
	[ReportCode] [nvarchar](50) NULL,
	[Type] [tinyint] NULL,
	[LineCode] [nvarchar](50) NULL,
	[LineDescription] [nvarchar](250) NULL,
	[AccountIDFrom] [nvarchar](50) NULL,
	[AccountIDTo] [nvarchar](50) NULL,
	[D_C] [tinyint] NULL,
	[Detail] [tinyint] NULL,
	[ParrentLineID] [nvarchar](50) NULL,
	[Accumulator] [nvarchar](100) NULL,
	[Level1] [tinyint] NULL,
	[PrintStatus] [tinyint] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LineDescriptionE] [nvarchar](250) NULL,
	[Notes] [nvarchar](250) NULL
) ON [PRIMARY]
END
---- Add Columns
If Exists (Select * From sysobjects Where name = 'AT7902STD' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT7902STD'  and col.name = 'DisplayedMark')
           Alter Table  AT7902STD Add DisplayedMark tinyint default 0  --0: Hiện dấu dương, 1: Hiện dấu âm
END
