-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Cam Loan
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[OT2010]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[OT2010]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NULL,
      [TranMonth] INT NULL,
      [TranYear] INT NULL,
      [SOrderID] NVARCHAR(50) NOT NULL,
      [VoucherTypeID] NVARCHAR(50) NULL,
      [VoucherNo] NVARCHAR(50) NULL,
      [VoucherDate] DATETIME NULL,
      [ShipID] NVARCHAR(50) NULL,
      [ObjectID] NVARCHAR(50) NULL,
      [ReceiverID] NVARCHAR(50) NULL,
      [OrderStatus] INT NULL,
      [IsPrinted] TINYINT DEFAULT 0 NULL,
      [Ana01ID] NVARCHAR(50) NULL,
      [Ana02ID] NVARCHAR(50) NULL,
      [Ana03ID] NVARCHAR(50) NULL,
      [Ana04ID] NVARCHAR(50) NULL,
      [Ana05ID] NVARCHAR(50) NULL,
      [Notes] NVARCHAR(250) NULL,
      [ExchangeRate] DECIMAL(28, 8) NULL,
      [CurrencyID] NVARCHAR(50) NULL,
      [PriceListID] NVARCHAR(50) NULL,
      [ArrivedTime] DATETIME NULL,
      [DepartureTime] DATETIME NULL,
      [BerthedTime] DECIMAL(28, 8) NULL,
      [AlongsideFrom] DATETIME NULL,
      [AlongsideTo] DATETIME NULL,
      [AlongsideTime] DECIMAL(28, 8) NULL,
      [PenaltyFrom] DATETIME NULL,
      [PenaltyTo] DATETIME NULL,
      [PenaltyTime] DECIMAL(28, 8) NULL,
      [GRT] DECIMAL(28, 8) NULL,
      [CreateDate] DATETIME NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL
    CONSTRAINT [PK_OT2010] PRIMARY KEY CLUSTERED
      (
      [SOrderID]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END