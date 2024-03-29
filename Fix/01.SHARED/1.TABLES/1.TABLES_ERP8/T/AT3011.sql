-- <Summary>
---- 
-- <History>
---- Create on 13/10/2012 by Huỳnh Tấn Phú
---- Modified on 04/12/2018 by Kim Thư: Bổ sung RefNo01 và RefNo02
---- <Example>
IF NOT  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT3011]') AND type in (N'U'))
CREATE TABLE [dbo].[AT3011](
	[APK] [uniqueidentifier] DEFAULT NEWID(),
	[DivisionID] [nvarchar](3) NOT NULL,
	[VoucherID] [nvarchar](50) NULL,
	[TranMonth] [int] NULL,
	[TranYear] [int] NULL,
	[VoucherTypeID] [nvarchar](50) NULL,
	[VoucherNo] [nvarchar](50) NULL,
	[VoucherDate] [datetime] NULL,
	[VDescription] [nvarchar](250) NULL,
	[AccountID] [nvarchar](50) NULL,
	[CreditAccountID] [nvarchar](4000) NULL,
	[DebitAccountID] [nvarchar](4000) NULL,
	[CreditAmountListID] [nvarchar](4000) NULL,
	[DebitAmountListID] [nvarchar](4000) NULL,
	[ConvertedAmount] [decimal](28, 8) NULL,
	[OriginalAmount] [decimal](28, 8) NULL,
	[InvoiceNoList] [nvarchar](4000) NULL,
	[CurrencyID] [nvarchar](50) NULL,
	[ExchangeRate] [decimal](28, 8) NULL,
	[SenderReceiver] [nvarchar](250) NULL,
	[SRDivisionName] [nvarchar](250) NULL,
	[SRAddress] [nvarchar](250) NULL,
	[TransactionTypeID] [nvarchar](50) NULL,
	[SayVN] [nvarchar](250) NULL,
	[FullName] [nvarchar](250) NULL,
	[ChiefAccountant] [nvarchar](250) NULL,
	CONSTRAINT [PK_AT3011] PRIMARY KEY NONCLUSTERED 
(
	[APK] ASC
    )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

) ON [PRIMARY]
---- Add giá trị default
Declare @DefaultName varchar(200), @DefaultText varchar(200), @AllowNull varchar(50), @SQL varchar(500)
If Exists (Select * From sysobjects Where name = 'AT3011' and xtype ='U') 
Begin
          Select @AllowNull = Case When col.isnullable  = 1 Then 'NULL' Else 'NOT NULL' End 
          From syscolumns col inner join sysobjects tab 
          On col.id = tab.id where tab.name =   'AT3011'  and col.name = 'DebitAcountID'
          If @AllowNull Is Not Null        Begin 
               Select @DefaultName = def.name, @DefaultText = cmm.text from sysobjects def inner join syscomments cmm 
                   on def.id = cmm.id inner join syscolumns col on col.cdefault = def.id 
                   inner join sysobjects tab on col.id = tab.id  
                   where tab.name = 'AT3011'  and col.name = 'DebitAcountID'  
                   --drop constraint 
                   if @DefaultName Is Not Null Execute ('Alter Table AT3011 Drop Constraint ' + @DefaultName)
                   --change column type
                   Set @SQL = 'Alter Table AT3011  Alter Column DebitAcountID nvarchar(4000)'  + @AllowNull 
                   Execute(@SQL) 
                   --restore constraint 
                   if @DefaultName Is Not Null 
                   Execute( 'Alter Table AT3011  Add Constraint ' + @DefaultName   + ' Default (' + @DefaultText + ') For DebitAcountID')
        End
End
If Exists (Select * From sysobjects Where name = 'AT3011' and xtype ='U') 
Begin
          Select @AllowNull = Case When col.isnullable  = 1 Then 'NULL' Else 'NOT NULL' End 
          From syscolumns col inner join sysobjects tab 
          On col.id = tab.id where tab.name =   'AT3011'  and col.name = 'CreditAcountID'
          If @AllowNull Is Not Null        Begin 
               Select @DefaultName = def.name, @DefaultText = cmm.text from sysobjects def inner join syscomments cmm 
                   on def.id = cmm.id inner join syscolumns col on col.cdefault = def.id 
                   inner join sysobjects tab on col.id = tab.id  
                   where tab.name = 'AT3011'  and col.name = 'CreditAcountID'  
                   --drop constraint 
                   if @DefaultName Is Not Null Execute ('Alter Table AT3011 Drop Constraint ' + @DefaultName)
                   --change column type
                   Set @SQL = 'Alter Table AT3011  Alter Column CreditAcountID nvarchar(4000)'  + @AllowNull 
                   Execute(@SQL) 
                   --restore constraint 
                   if @DefaultName Is Not Null 
                   Execute( 'Alter Table AT3011  Add Constraint ' + @DefaultName   + ' Default (' + @DefaultText + ') For CreditAcountID')
        End
End
If Exists (Select * From sysobjects Where name = 'AT3011' and xtype ='U') 
Begin
          Select @AllowNull = Case When col.isnullable  = 1 Then 'NULL' Else 'NOT NULL' End 
          From syscolumns col inner join sysobjects tab 
          On col.id = tab.id where tab.name =   'AT3011'  and col.name = 'InvoiceNoList'
          If @AllowNull Is Not Null        Begin 
               Select @DefaultName = def.name, @DefaultText = cmm.text from sysobjects def inner join syscomments cmm 
                   on def.id = cmm.id inner join syscolumns col on col.cdefault = def.id 
                   inner join sysobjects tab on col.id = tab.id  
                   where tab.name = 'AT3011'  and col.name = 'InvoiceNoList'  
                   --drop constraint 
                   if @DefaultName Is Not Null Execute ('Alter Table AT3011 Drop Constraint ' + @DefaultName)
                   --change column type
                   Set @SQL = 'Alter Table AT3011  Alter Column InvoiceNoList nvarchar(4000)'  + @AllowNull 
                   Execute(@SQL) 
                   --restore constraint 
                   if @DefaultName Is Not Null 
                   Execute( 'Alter Table AT3011  Add Constraint ' + @DefaultName   + ' Default (' + @DefaultText + ') For InvoiceNoList')
        End
END
---- Add Columns
If Exists (Select * From sysobjects Where name = 'AT3011' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT3011'  and col.name = 'CreditAmountListID')
           Alter Table  AT3011 Add CreditAmountListID nvarchar(4000) Null
End 
If Exists (Select * From sysobjects Where name = 'AT3011' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT3011'  and col.name = 'DebitAmountListID')
           Alter Table  AT3011 Add DebitAmountListID nvarchar(4000) Null
END

If Exists (Select * From sysobjects Where name = 'AT3011' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT3011'  and col.name = 'CreditConvertedAmount')
           Alter Table  AT3011 Add CreditConvertedAmount nvarchar(4000) NULL
           
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT3011'  and col.name = 'DebitConvertedAmount')
           Alter Table  AT3011 Add DebitConvertedAmount nvarchar(4000) Null           
End 

---- Modified on 04/12/2018 by Kim Thư: Bổ sung RefNo01 và RefNo02
If Exists (Select * From sysobjects Where name = 'AT3011' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT3011'  and col.name = 'RefNo01')
           Alter Table  AT3011 Add RefNo01 nvarchar(4000) NULL
           
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT3011'  and col.name = 'RefNo02')
           Alter Table  AT3011 Add RefNo02 nvarchar(4000) Null           
End 
