﻿---- Create by Nguyễn Tấn Lộc on 4/22/2021 5:10:11 PM
---- Bảng Detail mặt hàng_Nghiệp vụ

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CRMT2181]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CRMT2181]
(
  [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
  [DivisionID] VARCHAR(50) NULL,
  [APKBusiness] VARCHAR(50) NULL,
  [VoucherBusiness] VARCHAR(50) NULL,
  [APKAT1302] VARCHAR(250) NULL,
  [InventoryID] VARCHAR(250) NULL,
  [InventoryName] NVARCHAR(MAX) NULL,
  [UnitID] VARCHAR(250) NULL,
  [UnitPrice] DECIMAL(28,8) NULL,
  [Discountamount] DECIMAL(28,8) NULL,
  [TablePrice] VARCHAR(50) NULL,
  [AmountInventory] VARCHAR(250) NULL,
  [TotalPrice] DECIMAL(28,8) NULL,
  [DeleteFlg] TINYINT DEFAULT 0 NULL,
  [CreateDate] DATETIME NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL
CONSTRAINT [PK_CRMT2181] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END