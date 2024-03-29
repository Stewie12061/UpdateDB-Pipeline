-- <Summary>
---- 
-- <History>
---- Create on 30/12/2013 by Bảo Anh
---- Modified on 09/12/2013 by Mai Duyen
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT0123]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[OT0123](
		[APK] [uniqueidentifier] DEFAULT NEWID(),
		[DivisionID] [nvarchar](3) NOT NULL,
		[OrderID] [nvarchar] (50) NULL,
		[OrderDate] [datetime] NULL,
		[OrderAmount] decimal(28,8) NULL,
		[SalesmanID] [nvarchar](50) NOT NULL,-- nguoi duoc huong hoa hong
		[PreLevelNo] [int] NULL,-- cap hien tai truoc khi ps don hang		
		[UpAmount] decimal(28,8) NULL,-- doanh so len cap
		[UpLevelNo] [int] NULL, -- cap sau khi ps don hang
		[AccAmount] decimal(28,8) NULL, -- doanh so luy ke sau khi ps don hang
		[SalesAmount] decimal(28,8) NULL,--hoa hong doanh so cua don hang hien tai
		[SameAmount] decimal(28,8) NULL,--hoa hong dong cap
		[ExtendAmount] decimal(28,8) NULL,-- hoa hong phu dao
		[IsUpLevel] [tinyint] DEFAULT(0)	--1: da len cap ; o: chua len cap
) ON [PRIMARY]
END
---- Add Columns
If Exists (Select * From sysobjects Where name = 'OT0123' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'OT0123'  and col.name = 'OrderNo')
           Alter Table  OT0123 Add OrderNo int Null	--- số thứ tự tách đơn hàng           
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'OT0123'  and col.name = 'ContractNo')
           Alter Table  OT0123 Add ContractNo nvarchar(50) Null           
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'OT0123'  and col.name = 'SalesPercent') 
           Alter Table  OT0123 Add SalesPercent Decimal(28,8) Null           
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'OT0123'  and col.name = 'ExtendPercent') 
           Alter Table  OT0123 Add ExtendPercent Decimal(28,8) Null           
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'OT0123'  and col.name = 'SamePercent') 
           Alter Table  OT0123 Add SamePercent Decimal(28,8) Null         
End