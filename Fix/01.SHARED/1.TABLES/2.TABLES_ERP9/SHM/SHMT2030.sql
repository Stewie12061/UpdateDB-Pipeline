---- Create by Phan thanh hoàng vũ on 9/17/2018 12:56:09 PM
---- Danh sách chuyển nhượng (master)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[SHMT2030]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[SHMT2030]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NULL,
  [VoucherTypeID] VARCHAR(50) NULL,
  [VoucherNo] VARCHAR(50) NULL,
  [VoucherDate] DATETIME NULL,
  [TranMonth] INT NULL,
  [TranYear] INT NULL,
  [FromObjectID] VARCHAR(50) NULL,
  [BeforeFromQuantity] DECIMAL(28,8) NULL,
  [AfterFromQuantity] DECIMAL(28,8) NULL,
  [ToObjectID] VARCHAR(50) NULL,
  [BeforeToQuantity] DECIMAL(28,8) NULL,
  [AfterToQuantity] DECIMAL(28,8) NULL,
  [Description] NVARCHAR(250) NULL,
  [TransferFree] DECIMAL(28,8) NULL,
  [TotalQuantityTransfered] DECIMAL(28,8) NULL,
  [TotalAmountTransfered] DECIMAL(28,8) NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_SHMT2030] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END