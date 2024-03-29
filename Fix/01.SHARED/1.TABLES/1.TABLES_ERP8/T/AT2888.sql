-- <Summary>
---- 
-- <History>
---- Create on 13/12/2012 by Bảo Anh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT2888]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[AT2888](
		[APK] [uniqueidentifier] DEFAULT NEWID(),
		[DivisionID] [nvarchar](3) NOT NULL,
		[WareHouseID] [nvarchar](50) NOT NULL,
		[TranMonth] [int] NOT NULL,
		[TranYear] [int] NOT NULL,
		[InventoryID] [nvarchar](50) NOT NULL,
		[InventoryAccountID] [nvarchar](50) NOT NULL,
		[BeginQuantity] [decimal](28, 8) NULL,
		[EndQuantity] [decimal](28, 8) NULL,
		[DebitQuantity] [decimal](28, 8) NULL,
		[CreditQuantity] [decimal](28, 8) NULL,
		[InDebitQuantity] [decimal](28, 8) NULL,
		[InCreditQuantity] [decimal](28, 8) NULL,
		[BeginAmount] [decimal](28, 8) NULL,
		[EndAmount] [decimal](28, 8) NULL,
		[DebitAmount] [decimal](28, 8) NULL,
		[CreditAmount] [decimal](28, 8) NULL,
		[InDebitAmount] [decimal](28, 8) NULL,
		[InCreditAmount] [decimal](28, 8) NULL,
		[UnitPrice] [decimal](28, 8) NULL,
		[Parameter01] [decimal](28, 8) NULL,
		[Parameter02] [decimal](28, 8) NULL,
		[Parameter03] [decimal](28, 8) NULL,
		[Parameter04] [decimal](28, 8) NULL,
		[Parameter05] [decimal](28, 8) NULL,
		[BeginMarkQuantity] [decimal](28, 8) NULL,
		[EndMarkQuantity] [decimal](28, 8) NULL,
		[DebitMarkQuantity] [decimal](28, 8) NULL,
		[CreditMarkQuantity] [decimal](28, 8) NULL,
		[InDebitMarkQuantity] [decimal](28, 8) NULL,
		[InCreditMarkQuantity] [decimal](28, 8) NULL
	) ON [PRIMARY]
END