-- <Summary>
---- 
-- <History>
---- Create on 26/12/2014 by Lưu Khánh Vân
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CMT0013]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[CMT0013]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NOT NULL,
      [CommissionMethodID] VARCHAR(50) NOT NULL,
      [InventoryID] VARCHAR(50) NOT NULL,
      [VoucherNo] NVARCHAR(50) NOT NULL,
      [TranMonth] INT NOT NULL,
      [TranYear] INT NOT NULL,
      [ObjectID] VARCHAR(50) NOT NULL,
      [ComAmount] DECIMAL(28,8) DEFAULT (0) NULL,
      [Notes] NVARCHAR(250) NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_CMT0013] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END

---- Add Columns
If Exists (Select * From sysobjects Where name = 'CMT0013' and xtype ='U') 
Begin 

	If not exists (select * from syscolumns col inner join sysobjects tab 
	On col.id = tab.id where tab.name = 'CMT0013'  and col.name = 'SaleManID')
		ALTER TABLE  CMT0013 ADD SaleManID VARCHAR(50) Null

	If not exists (select * from syscolumns col inner join sysobjects tab 
	On col.id = tab.id where tab.name = 'CMT0013'  and col.name = 'ConvertedAmount')
		ALTER TABLE  CMT0013 ADD ConvertedAmount DECIMAL(28, 8) Null

End

---- Add Columns
If Exists (Select * From sysobjects Where name = 'CMT0013' and xtype ='U') 
Begin 
	If not exists (select * from syscolumns col inner join sysobjects tab 
	On col.id = tab.id where tab.name = 'CMT0013'  and col.name = 'IsRoyalty')
		ALTER TABLE  CMT0013 ADD IsRoyalty TINYINT Null

End

---- Add Columns
If Exists (Select * From sysobjects Where name = 'CMT0013' and xtype ='U') 
Begin 
	If not exists (select * from syscolumns col inner join sysobjects tab 
	On col.id = tab.id where tab.name = 'CMT0013'  and col.name = 'InventoryName')
		ALTER TABLE  CMT0013 ADD InventoryName VARCHAR(50) Null

		If not exists (select * from syscolumns col inner join sysobjects tab 
	On col.id = tab.id where tab.name = 'CMT0013'  and col.name = 'Quantity')
		ALTER TABLE  CMT0013 ADD Quantity VARCHAR(50) Null
				
		If not exists (select * from syscolumns col inner join sysobjects tab 
	On col.id = tab.id where tab.name = 'CMT0013'  and col.name = 'UnitID')
		ALTER TABLE  CMT0013 ADD UnitID VARCHAR(50) Null

	IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CMT0013' AND col.name = 'IsRoyalty') 
	   ALTER TABLE CMT0013 ADD IsRoyalty TINYINT NULL DEFAULT(0)

	--- Chứng từ phát sinh Bút toán tổng hợp
	IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CMT0013' AND col.name = 'GVoucherID') 
	   ALTER TABLE CMT0013 ADD GVoucherID VARCHAR(50) NULL
End