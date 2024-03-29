-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Cam Loan
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[OT2011]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[OT2011]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NULL,
      [SOrderID] NVARCHAR(50) NULL,
      [InventoryID] NVARCHAR(50) NULL,
      [UnitID] NVARCHAR(50) NULL,
      [OriginalQuantity] DECIMAL(28, 8) NULL,
      [UnitPrice] DECIMAL(28, 8) NULL,
      [ConvertedPrice] DECIMAL(28, 8) NULL,
      [OriginalAmount] DECIMAL(28, 8) NULL,
      [VATPercent] DECIMAL(28, 8) NULL,
      [VATOriginalAmount] DECIMAL(28, 8) NULL,
      [TotalAmount] DECIMAL(28, 8) NULL,
	  [Orders] INT NULL,
      [Notes01] NVARCHAR(250) NULL,
      [Notes02] NVARCHAR(250) NULL,
      [Notes03] NVARCHAR(250) NULL,
      [Notes04] NVARCHAR(250) NULL,
      [Notes05] NVARCHAR(250) NULL,
      [Notes06] NVARCHAR(250) NULL,
      [Notes07] NVARCHAR(250) NULL,
      [Notes08] NVARCHAR(250) NULL,
      [Notes09] NVARCHAR(250) NULL,
      [Notes10] NVARCHAR(250) NULL,
      [Ana01ID] NVARCHAR(50) NULL,
      [Ana02ID] NVARCHAR(50) NULL,
      [Ana03ID] NVARCHAR(50) NULL,
      [Ana04ID] NVARCHAR(50) NULL,
      [Ana05ID] NVARCHAR(50) NULL,
      [Ana06ID] NVARCHAR(50) NULL,
      [Ana07ID] NVARCHAR(50) NULL,
      [Ana08ID] NVARCHAR(50) NULL,
      [Ana09ID] NVARCHAR(50) NULL,
      [Ana10ID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL
    CONSTRAINT [PK1_OT2011] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END