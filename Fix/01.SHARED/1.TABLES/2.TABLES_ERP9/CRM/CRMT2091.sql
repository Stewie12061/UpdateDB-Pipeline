---- Create by Phan thanh hoàng vũ on 9/18/2018 1:33:50 PM
---- Danh sách phiếu bảo hành (Detail) => Customize = OKIA

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CRMT2091]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CRMT2091]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [APKMaster] UNIQUEIDENTIFIER NOT NULL,
  [DivisionID] VARCHAR(50) NULL,
  [ObjectID] VARCHAR(50) NULL,
  [VoucherDate] DATETIME NULL,
  [SaleVoucherNo] VARCHAR(50) NULL,
  [ExportVoucherNo] VARCHAR(50) NULL,
  [InventoryID] VARCHAR(50) NULL,
  [ActualQuantity] DECIMAL(28,8) NULL,
  [WarrantyCard] NVARCHAR(250) NULL,
  [SerialNo] VARCHAR(50) NULL,
  [NumberOfWarranty] INT NULL,
  [IsWarrantyExpires] TINYINT DEFAULT (0) NULL,
  [IsStatusNewOrDisplay] TINYINT DEFAULT (0) NULL,
  [FailureStatus] NVARCHAR(250) NULL,
  [RepairOrReplace] NVARCHAR(250) NULL,
  [RepairedDate] DATETIME NULL,
  [WarrantyExpenses] DECIMAL(28,8) NULL,
  [WarrantyStaffID] VARCHAR(50) NULL,
  [DeliveryDate] DATETIME NULL,
  [Notes] NVARCHAR(250) NULL,
  [OrderNo] INT NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [APKMInherited] NVARCHAR(250) NULL,
  [APKDInherited] NVARCHAR(250) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_CRMT2091] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END