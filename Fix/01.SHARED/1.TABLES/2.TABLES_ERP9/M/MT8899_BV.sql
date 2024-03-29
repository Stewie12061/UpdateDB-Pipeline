---- Create by Đình Ly on 03/12/2020
---- Lưu quy cách hàng module M
---- Modified on ... by ...

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MT8899_BV]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[MT8899_BV]
     (
	  [DivisionID] VARCHAR(50) NOT NULL,
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
    CONSTRAINT [PK_MT8899_BV] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,	
      [TransactionID]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END

