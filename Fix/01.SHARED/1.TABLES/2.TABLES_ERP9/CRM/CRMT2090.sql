---- Create by Phan thanh hoàng vũ on 9/18/2018 1:33:00 PM
---- Danh sách phiếu bảo hành (master) => Customize = OKIA

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CRMT2090]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CRMT2090]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [VoucherTypeID] VARCHAR(50) NULL,
  [TranMonth] INT NULL,
  [Tranyear] INT NULL,
  [VoucherDate] DATETIME NULL,
  [VoucherNo] VARCHAR(50) NULL,
  [WarrantyRecipientID] VARCHAR(50) NULL,
  [FromShopID] VARCHAR(50) NULL,
  [Descriptions] NVARCHAR(250) NULL,
  [EmployeeID] VARCHAR(50) NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_CRMT2090] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END