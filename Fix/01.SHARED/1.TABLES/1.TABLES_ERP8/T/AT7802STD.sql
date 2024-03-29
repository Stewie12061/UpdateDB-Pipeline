-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on 03/02/2012 by Huỳnh Tấn Phú: Bo sung 5 ma phan tich Ana
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT7802STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT7802STD](
	[AllocationID] [nvarchar](50) NOT NULL,
	[SequenceID] [int] NOT NULL,
	[SequenceDesc] [nvarchar](250) NOT NULL,
	[SourceAccountIDFrom] [nvarchar](50) NOT NULL,
	[SourceAccountIDTo] [nvarchar](50) NOT NULL,
	[TargetAccountID] [nvarchar](50) NOT NULL,
	[SourceAmountID] [tinyint] NOT NULL,
	[AllocationMode] [tinyint] NOT NULL,
	[VoucherTypeID] [nvarchar](50) NULL,
	[Percentage] [decimal](28, 8) NOT NULL
) ON [PRIMARY]
END
---- Add Columns
If Exists (Select * From sysobjects Where name = 'AT7802STD' and xtype ='U') 
Begin 
If not exists (select * from syscolumns col inner join sysobjects tab 
On col.id = tab.id where tab.name =   'AT7802STD'  and col.name = 'Ana01ID')
Alter Table  AT7802STD 	Add Ana01ID nvarchar(50) Null,
						 Ana02ID nvarchar(50) Null,
						 Ana03ID nvarchar(50) Null,
						 Ana04ID nvarchar(50) Null,
						 Ana05ID nvarchar(50) Null,
						 Ana06ID nvarchar(50) Null,
						 Ana07ID nvarchar(50) Null,
						 Ana08ID nvarchar(50) Null,
						 Ana09ID nvarchar(50) Null,
						 Ana10ID nvarchar(50) Null
End