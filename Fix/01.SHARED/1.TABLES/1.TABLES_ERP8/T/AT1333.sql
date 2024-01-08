﻿---- Create by Tiểu Mai on 6/28/2017 11:18:44 AM
---- Chi tiết quy trình chuyển kho

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT1333]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1333]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] NVARCHAR(50) NOT NULL,
  [VoucherID] NVARCHAR(50) NOT NULL,
  [WareHouseID] NVARCHAR(50) NOT NULL,
  [Orders] INT NULL
CONSTRAINT [PK_AT1333] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [VoucherID],
  [WareHouseID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END