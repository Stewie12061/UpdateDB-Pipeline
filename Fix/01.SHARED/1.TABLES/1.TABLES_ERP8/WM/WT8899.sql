---- Create by Thanh Sơn on 18/06/2015
---- Lưu quy cách hàng module WM
---- Modified on 26/10/2015 by Tiểu Mai: Add columns DivisionID_Primarykey, update DivisionID
---- Modified by Tiểu Mai on 18/10/2016: Bổ sung các trường QC_Quantity, QC_Amount
---Modified by Minh Dũng on 30/11/2023: Modyfied column from S01ID to S20ID, Convert VARCHAR(50) to NVARCHAR(50)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[WT8899]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[WT8899]
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
    CONSTRAINT [PK_WT8899] PRIMARY KEY CLUSTERED
      (
      [TransactionID]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END

--- Alter CONSTRAINT
IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[WT8899]') AND TYPE IN (N'U'))
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT8899' AND col.name='DivisionID')
	ALTER TABLE WT8899 ADD DivisionID VARCHAR (50) DEFAULT('FIX_R06') NOT NULL
	
END 	

IF NOT EXISTS (SELECT ind.name AS Index_Name, col.name AS Column_Name FROM SYS.indexes ind 
					INNER JOIN SYS.index_columns ic 
						ON  ind.OBJECT_ID = ic.OBJECT_ID and ind.index_id = ic.index_id 
					INNER JOIN SYS.COLUMNS col 
						ON ic.OBJECT_ID = col.OBJECT_ID and ic.column_id = col.column_id 
					WHERE ind.name = 'PK_WT8899' AND col.name = 'DivisionID') 
BEGIN
	ALTER TABLE WT8899 DROP CONSTRAINT [PK_WT8899]
	ALTER TABLE WT8899 ADD CONSTRAINT [PK_WT8899] PRIMARY KEY ([DivisionID],[TransactionID])
END	

IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[WT8899]') AND TYPE IN (N'U'))
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT8899' AND col.name='QC_OriginalQuantity')
	ALTER TABLE WT8899 ADD QC_OriginalQuantity DECIMAL(28,8) NULL
END 

IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[WT8899]') AND TYPE IN (N'U'))
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT8899' AND col.name='QC_OriginalAmount')
	ALTER TABLE WT8899 ADD QC_OriginalAmount DECIMAL(28,8) NULL
END
 
IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[WT8899]') AND TYPE IN (N'U'))
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT8899' AND col.name='QC_ConvertedQuantity')
	ALTER TABLE WT8899 ADD QC_ConvertedQuantity DECIMAL(28,8) NULL
END 

IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[WT8899]') AND TYPE IN (N'U'))
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT8899' AND col.name='QC_ConvertedAmount')
	ALTER TABLE WT8899 ADD QC_ConvertedAmount DECIMAL(28,8) NULL
END 



---Modified by Minh Dũng on 30/11/2023: Modyfied column from S01ID to S20ID, Convert VARCHAR(50) to NVARCHAR(50)
IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S01ID') 
ALTER TABLE WT8899 ALTER COLUMN S01ID NVARCHAR(50)	

IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S02ID') 
ALTER TABLE WT8899 ALTER COLUMN S02ID NVARCHAR(50) 
 
IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S03ID') 
ALTER TABLE WT8899 ALTER COLUMN S03ID NVARCHAR(50) 

IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S04ID') 
ALTER TABLE WT8899 ALTER COLUMN S04ID NVARCHAR(50) 

IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S05ID') 
ALTER TABLE WT8899 ALTER COLUMN S05ID NVARCHAR(50) 

IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S06ID') 
ALTER TABLE WT8899 ALTER COLUMN S06ID NVARCHAR(50) 

IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S07ID') 
ALTER TABLE WT8899 ALTER COLUMN S07ID NVARCHAR(50) 
 
IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S08ID') 
ALTER TABLE WT8899 ALTER COLUMN S08ID NVARCHAR(50) 

IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S09ID') 
ALTER TABLE WT8899 ALTER COLUMN S09ID NVARCHAR(50) 

IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S10ID') 
ALTER TABLE WT8899 ALTER COLUMN S10ID NVARCHAR(50) 

IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S11ID') 
ALTER TABLE WT8899 ALTER COLUMN S11ID NVARCHAR(50) 

IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S12ID') 
ALTER TABLE WT8899 ALTER COLUMN S12ID NVARCHAR(50) 
 
IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S13ID') 
ALTER TABLE WT8899 ALTER COLUMN S13ID NVARCHAR(50) 

IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S14ID') 
ALTER TABLE WT8899 ALTER COLUMN S14ID NVARCHAR(50) 

IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S15ID') 
ALTER TABLE WT8899 ALTER COLUMN S15ID NVARCHAR(50) 

IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S16ID') 
ALTER TABLE WT8899 ALTER COLUMN S16ID NVARCHAR(50) 

IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S17ID') 
ALTER TABLE WT8899 ALTER COLUMN S17ID NVARCHAR(50) 

IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S18ID') 
ALTER TABLE WT8899 ALTER COLUMN S18ID NVARCHAR(50) 
 
IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S19ID') 
ALTER TABLE WT8899 ALTER COLUMN S19ID NVARCHAR(50) 

IF  EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
ON col.id = tab.id WHERE tab.name = 'WT8899' AND col.name = 'S20ID') 
ALTER TABLE WT8899 ALTER COLUMN S20ID NVARCHAR(50) 