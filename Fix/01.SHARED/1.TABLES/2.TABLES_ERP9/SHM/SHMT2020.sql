---- Create by Phan thanh hoàng vũ on 9/4/2018 1:07:45 PM
---- Danh sách đăng ký mua cổ phần (master)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[SHMT2020]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[SHMT2020]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [VoucherDate] DATETIME NOT NULL,
  [Tranmonth] int NULL,
  [TranYear] int NULL,
  [VoucherTypeID] VARCHAR(50) NULL,
  [VoucherNo] VARCHAR(50) NOT NULL,
  [SHPublishPeriodID] VARCHAR(50) NULL,
  [ObjectID] VARCHAR(50) NOT NULL,
  [ShareHolderCategoryID] VARCHAR(50) NULL,
  [IsPersonal] TINYINT DEFAULT (0) NULL,
  [ContactPrefix] NVARCHAR(250) NULL,
  [IdentificationNumber] VARCHAR(50) NULL,
  [ContactIssueDate] DATETIME NULL,
  [ContactIssueBy] NVARCHAR(250) NULL,
  [TotalQuantityBuyable] DECIMAL(28,8) NULL,
  [TotalQuantityRegistered] DECIMAL(28,8) NULL,
  [TotalQuantityApproved] DECIMAL(28,8) NULL,
  [TotalAmountBought] DECIMAL(28,8) NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [CreateDate] DATETIME NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL
CONSTRAINT [PK_SHMT2020] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END