---- Create by Phan thanh hoàng vũ on 08/08/2016 4:54:23 PM
---- Thông tin cá nhân

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT14051]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT14051]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [UserID] VARCHAR(50) NOT NULL,
      [PageSize] INT NULL,
      [LanguageID] VARCHAR(50) NULL,
      [Avatar] IMAGE NULL,
      [CIConfig] XML NULL,
      [POSConfig] XML NULL,
      [SOConfig] XML NULL,
      [CRMConfig] XML NULL
	 )
END

If Exists (Select * From sysobjects Where name = 'AT14051' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT14051'  and col.name = 'OOD0001')
           Alter Table AT14051 Add OOD0001 TINYINT Null
End

If Exists (Select * From sysobjects Where name = 'AT14051' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT14051'  and col.name = 'OOD0002')
           Alter Table AT14051 Add OOD0002 TINYINT Null
End
If Exists (Select * From sysobjects Where name = 'AT14051' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT14051'  and col.name = 'OOD0003')
           Alter Table AT14051 Add OOD0003 TINYINT Null
End
If Exists (Select * From sysobjects Where name = 'AT14051' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT14051'  and col.name = 'OOD0004')
           Alter Table AT14051 Add OOD0004 TINYINT Null
End
If Exists (Select * From sysobjects Where name = 'AT14051' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT14051'  and col.name = 'OOD0006')
           Alter Table AT14051 Add OOD0006 TINYINT Null
End
If Exists (Select * From sysobjects Where name = 'AT14051' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT14051'  and col.name = 'OOD0007')
           Alter Table AT14051 Add OOD0007 TINYINT Null
End
If Exists (Select * From sysobjects Where name = 'AT14051' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT14051'  and col.name = 'OOD0008')
           Alter Table AT14051 Add OOD0008 TINYINT Null
End
If Exists (Select * From sysobjects Where name = 'AT14051' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT14051'  and col.name = 'OOD0009')
           Alter Table AT14051 Add OOD0009 TINYINT Null
End
If Exists (Select * From sysobjects Where name = 'AT14051' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT14051'  and col.name = 'OOD0010')
           Alter Table AT14051 Add OOD0010 TINYINT Null
End
If Exists (Select * From sysobjects Where name = 'AT14051' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT14051'  and col.name = 'OOD0005')
           Alter Table AT14051 Add OOD0005 TINYINT Null
End

If Exists (Select * From sysobjects Where name = 'AT14051' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'AT14051'  and col.name = 'OOD0011')
           Alter Table AT14051 Add OOD0011 TINYINT Null
End