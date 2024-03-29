-- <Summary>
---- Bảng giá vốn sản phẩm - Dữ liệu tạm import bảng giá vốn [Customize Index: 36 - Sài Gòn Petro]
-- <History>
---- Create on 29/05/2015 by Lê Thị Hạnh 
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MT0119]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[MT0119]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NULL,
      [VoucherID] NVARCHAR(50) NULL,
      [TransactionID] NVARCHAR(50) NULL,
      [TranMonth] INT NULL,
      [TranYear] INT NULL,
      [VoucherTypeID] NVARCHAR(50) NULL,
      [VoucherNo] NVARCHAR(50) NULL,
      [VoucherDate] DATETIME NULL,
      [CostAmount] DECIMAL(28,8) NULL,
      [CurrencyID] NVARCHAR(50) NULL,
      [ExchangeRate] DECIMAL(28,8) NULL,
      [PMID] NVARCHAR(50) NULL,
      [PriceListID] NVARCHAR(50) NULL,
      [ProductID] NVARCHAR(50) NULL,
      [IsVND] TINYINT NULL,
      [Description] NVARCHAR(250) NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL,
      [MaterialID] NVARCHAR(50) NULL,
      [TypeID] TINYINT NULL, -- 1: BaseOil - dầu gốc , 2: Additive - phụ gia, 3: Packings - Bao bì
      [Orders] INT NULL,
      [UnitPrice] DECIMAL(28,8) NULL,
      [VATImPercent] DECIMAL(28,8) NULL,
      [VATPercent] DECIMAL(28,8) NULL,
      [ConvertedAmount] DECIMAL(28,8) NULL,
      [Quantity] DECIMAL(28,8) NULL,
      [InheritTableID] NVARCHAR(50) NULL,
      [InheritVoucherID] NVARCHAR(50) NULL,
      [InheritTransactionID] NVARCHAR(50) NULL,
      [InheritPCID] NVARCHAR(50) NULL,
      [InheritAnaID] NVARCHAR(50) NULL      
    CONSTRAINT [PK_MT0119] PRIMARY KEY CLUSTERED
      (
      [APK] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
