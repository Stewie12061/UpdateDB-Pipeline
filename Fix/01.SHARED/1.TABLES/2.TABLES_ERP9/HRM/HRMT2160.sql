﻿---- Create by Kiều Nga on 20/11/2020
---- Huê hồng theo nhân viên

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HRMT2160]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[HRMT2160]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] NVARCHAR(50) NOT NULL,
  [TranMonth] INT NULL,
  [TranYear] INT NULL,
  [EmployeeID] NVARCHAR(50) NULL,
  [ObjectID] NVARCHAR(50) NULL,
  [InventoryID] NVARCHAR(50) NULL,
  [VoucherNo] NVARCHAR(50) NULL,
  [PayAmount] DECIMAL(28,8) NULL,
  [Amount] DECIMAL(28,8) NULL,
  [BonusRate01] DECIMAL(28,8) NULL,
  [BonusRate02] DECIMAL(28,8) NULL,
  [BonusRate03] DECIMAL(28,8) NULL,
  [BonusRate04] DECIMAL(28,8) NULL,
  [BonusRate05] DECIMAL(28,8) NULL,
  [RevenueAmount] DECIMAL(28,8) NULL,
  [CreateUserID] NVARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] NVARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_HRMT2160] PRIMARY KEY CLUSTERED
(
  [APK],
  [DivisionID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END