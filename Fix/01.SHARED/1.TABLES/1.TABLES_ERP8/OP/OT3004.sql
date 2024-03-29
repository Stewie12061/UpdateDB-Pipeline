-- <Summary>
---- 
-- <History>
---- Create on 28/10/2014 by Trí Thiện
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[OT3004]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[OT3004]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [TranMonth] INT NOT NULL,
      [TranYear] INT NOT NULL,
      [OrderID] NVARCHAR(50) NOT NULL,
      [VoucherTypeID] NVARCHAR(50) NULL,
      [VoucherNo] NVARCHAR(50) NULL,
      [InventoryTypeID] NVARCHAR(50) NULL,
      [CurrencyID] NVARCHAR(50) NULL,
      [ExchangeRate] DECIMAL(28) NULL,
      [ObjectID] NVARCHAR(50) NULL,
      [Notes] NVARCHAR(250) NULL,
      [Description] NVARCHAR(250) NULL,
      [OrderStatus] TINYINT DEFAULT 0 NULL,
      [Ana01ID] NVARCHAR(50) NULL,
      [Ana02ID] NVARCHAR(50) NULL,
      [Ana03ID] NVARCHAR(50) NULL,
      [Ana04ID] NVARCHAR(50) NULL,
      [Ana05ID] NVARCHAR(50) NULL,
      [EmployeeID] NVARCHAR(50) NULL,
      [OrderDate] DATETIME NULL,
      [IsPrinted] TINYINT DEFAULT 0 NULL,
      [Ana06ID] NVARCHAR(50) NULL,
      [Ana07ID] NVARCHAR(50) NULL,
      [Ana08ID] NVARCHAR(50) NULL,
      [Ana09ID] NVARCHAR(50) NULL,
      [Ana10ID] NVARCHAR(50) NULL,
      [ReVoucherID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [DivisionID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL
    CONSTRAINT [PK_OT3004] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END