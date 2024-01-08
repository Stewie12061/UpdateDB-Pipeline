﻿---- Create by tuananh on 3/17/2020 9:19:17 AM
---- Lưu vết cấn trừ tiền chuyển nhượng

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[EDMT2154]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[EDMT2154]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] NVARCHAR(50) NOT NULL,
  [VoucherID] NVARCHAR(50) NOT NULL,
  [APKReceiptID] UNIQUEIDENTIFIER NOT NULL,
  [APKDetailReceiptID] UNIQUEIDENTIFIER NOT NULL,
  [TableID] NVARCHAR(250) NOT NULL,
  [ReceiptID] NVARCHAR(250) NOT NULL,
  [APKTransfer] UNIQUEIDENTIFIER NOT NULL,
  [APKDetailTransfer] UNIQUEIDENTIFIER NOT NULL,
  [AmountOrginal] DECIMAL(28,8) NOT NULL,
  [AmountTransfer] DECIMAL(28,8) NOT NULL,
  [CreateDate] DATETIME DEFAULT GETDATE() NULL,
  [CreateUserID] NVARCHAR(250) NULL,
  [LastModifyDate] DATETIME DEFAULT GETDATE() NULL,
  [LastModifyUserID] NVARCHAR(250) NULL

CONSTRAINT [PK_EDMT2154] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END