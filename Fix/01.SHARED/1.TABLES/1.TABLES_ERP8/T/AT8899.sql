---- Create by Thanh Sơn on 23/06/2015
---- Lưu quy cách hàng module T
---- Modified on 26/10/2015 by Tiểu Mai: Add columns DivisionID_Primarykey, update DivisionID

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT8899]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT8899]
     (
      [TableID] VARCHAR(50) NULL,
      [VoucherID] VARCHAR(50) NOT NULL,
      [TransactionID] VARCHAR(50) NOT NULL,
      [S01ID] VARCHAR(50) NULL,
      [S02ID] VARCHAR(50) NULL,
      [S03ID] VARCHAR(50) NULL,
      [S04ID] VARCHAR(50) NULL,
      [S05ID] VARCHAR(50) NULL,
      [S06ID] VARCHAR(50) NULL,
      [S07ID] VARCHAR(50) NULL,
      [S08ID] VARCHAR(50) NULL,
      [S09ID] VARCHAR(50) NULL,
      [S10ID] VARCHAR(50) NULL,
      [S11ID] VARCHAR(50) NULL,
      [S12ID] VARCHAR(50) NULL,
      [S13ID] VARCHAR(50) NULL,
      [S14ID] VARCHAR(50) NULL,
      [S15ID] VARCHAR(50) NULL,
      [S16ID] VARCHAR(50) NULL,
      [S17ID] VARCHAR(50) NULL,
      [S18ID] VARCHAR(50) NULL,
      [S19ID] VARCHAR(50) NULL,
      [S20ID] VARCHAR(50) NULL,
      [UnitPrice01] DECIMAL(28,8) NULL,
      [UnitPrice02] DECIMAL(28,8) NULL,
      [UnitPrice03] DECIMAL(28,8) NULL,
      [UnitPrice04] DECIMAL(28,8) NULL,
      [UnitPrice05] DECIMAL(28,8) NULL,
      [UnitPrice06] DECIMAL(28,8) NULL,
      [UnitPrice07] DECIMAL(28,8) NULL,
      [UnitPrice08] DECIMAL(28,8) NULL,
      [UnitPrice09] DECIMAL(28,8) NULL,
      [UnitPrice10] DECIMAL(28,8) NULL,
      [UnitPrice11] DECIMAL(28,8) NULL,
      [UnitPrice12] DECIMAL(28,8) NULL,
      [UnitPrice13] DECIMAL(28,8) NULL,
      [UnitPrice14] DECIMAL(28,8) NULL,
      [UnitPrice15] DECIMAL(28,8) NULL,
      [UnitPrice16] DECIMAL(28,8) NULL,
      [UnitPrice17] DECIMAL(28,8) NULL,
      [UnitPrice18] DECIMAL(28,8) NULL,
      [UnitPrice19] DECIMAL(28,8) NULL,
      [UnitPrice20] DECIMAL(28,8) NULL,
      [UnitPriceStandard] DECIMAL(28,8) NULL
    CONSTRAINT [PK_AT8899] PRIMARY KEY CLUSTERED
      (
      [TransactionID]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END


--- Add Columns DivisionID
IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT8899]') AND TYPE IN (N'U'))
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='AT8899' AND col.name='DivisionID')
	ALTER TABLE AT8899 ADD DivisionID VARCHAR (50) DEFAULT('FIX_R06') NOT NULL
	
END 	

--- Alter CONSTRAINT
IF NOT EXISTS (SELECT ind.name AS Index_Name, col.name AS Column_Name FROM SYS.indexes ind 
					INNER JOIN SYS.index_columns ic 
						ON  ind.OBJECT_ID = ic.OBJECT_ID and ind.index_id = ic.index_id 
					INNER JOIN SYS.COLUMNS col 
						ON ic.OBJECT_ID = col.OBJECT_ID and ic.column_id = col.column_id 
					WHERE ind.name = 'PK_AT8899' AND col.name = 'DivisionID') 
	BEGIN
		ALTER TABLE AT8899 DROP CONSTRAINT [PK_AT8899]
		ALTER TABLE AT8899 ADD CONSTRAINT [PK_AT8899] PRIMARY KEY ([DivisionID],[TransactionID])

	END	