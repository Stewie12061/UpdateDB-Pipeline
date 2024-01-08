﻿---- Create by Tieumai on 6/22/2018 2:48:25 PM
---- Cập nhật Leadtime_MOQ (detail)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POT2014]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POT2014]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] NVARCHAR(50) NOT NULL,
  [LeadTimeID] NVARCHAR(50) NOT NULL,
  [DetailID] NVARCHAR(50) NOT NULL,
  [InventoryID] NVARCHAR(50) NULL,
  [UnitID] NVARCHAR(50) NULL,
  [ObjectID] NVARCHAR(50) NULL,
  [Quantity] DECIMAL(28,8) NULL,
  [UnitPrice] DECIMAL(28,8) NULL,
  [ConvertedAmount] DECIMAL(28,8) NULL,
  [DeliverDay] DECIMAL(28,8) NULL
CONSTRAINT [PK_POT2014] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [DetailID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END