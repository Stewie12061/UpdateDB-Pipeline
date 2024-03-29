﻿---- Create by Nguyễn Hoàng Bảo Thy on 9/6/2017 4:17:43 PM
---- PanalPina

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT0300]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[AT0300]
(
  [TransactionID] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [HouseID] VARCHAR(50) NULL,
  [HouseName] NVARCHAR(250) NULL,
  [InvoiceDate] DATETIME NULL,
  [InvoiceType] NVARCHAR(250) NULL,
  [TrafficType] NVARCHAR(250) NULL,
  [TrafficDirection] NVARCHAR(250) NULL,
  [FileRef] NVARCHAR(250) NULL,
  [InvoiceNote] NVARCHAR(250) NULL,
  [HAWBNumber] NVARCHAR(250) NULL,
  [AWBNumber] NVARCHAR(250) NULL,
  [ETD] DATETIME NULL,
  [CustomerID] NVARCHAR(250) NULL,
  [CustomerName] NVARCHAR(250) NULL,
  [ProjectID] NVARCHAR(250) NULL,
  [ProjectName] NVARCHAR(250) NULL,
  [PACustomerRef] NVARCHAR(250) NULL,
  [ChargeLineID] NVARCHAR(250) NULL,
  [ChargeLineName] NVARCHAR(250) NULL,
  [ChargeLineDescription] NVARCHAR(250) NULL,
  [Amount_Document] DECIMAL(28,8) NULL,
  [TaxCode] NVARCHAR(250) NULL,
  [Amount_Local] DECIMAL(28,8) NULL,
  [Amount_Target] DECIMAL(28,8) NULL,
  [Status] TINYINT DEFAULT (0) NULL,
  [ReMark] NVARCHAR(250) NULL
CONSTRAINT [PK_AT0300] PRIMARY KEY CLUSTERED
(
  [TransactionID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'AT0300' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'AT0300' AND col.name = 'Notes') 
   ALTER TABLE AT0300 ADD Notes NVARCHAR(250) NULL 
END