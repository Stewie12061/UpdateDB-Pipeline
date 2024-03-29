-- <Summary>
---- Bảng ghi nhận mức lũy kế theo từng đơn hàng (Sinolife)
-- <History>
---- Create on 30/03/2013 by Bảo Anh
---- Modified on 03/12/2013 by Mai Duyen: Bo sung them cot ContractNo
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1212]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[AT1212](
		[APK] [uniqueidentifier] DEFAULT NEWID(),
		[DivisionID] [nvarchar](3) NOT NULL,
		[ObjectID] [nvarchar](50) NULL,--nhan vien duoc huong luy ke doanh so
		[OrderID] [nvarchar](50) NULL,
		[OrderDate] [datetime] NULL,
		[OrderAmount] decimal(28,8) NULL
) ON [PRIMARY]
END
---- Add Columns
If Exists (Select * From sysobjects Where name = 'AT1212' and xtype ='U') 
Begin
		   If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT1212'  and col.name = 'OrderNo')
           Alter Table  AT1212 Add OrderNo int Null	--- số thứ tự tách đơn hàng
           	
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT1212'  and col.name = 'LevelNo')
           Alter Table  AT1212 Add LevelNo int Null
           
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT1212'  and col.name = 'ManagerID')
           Alter Table  AT1212 Add ManagerID nvarchar(50) Null
           
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT1212'  and col.name = 'ContractNo')
           Alter Table  AT1212 Add ContractNo nvarchar(50) Null           
End