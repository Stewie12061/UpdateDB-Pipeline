---- Create by Phan thanh hoàng vũ on 9/5/2018 10:01:36 AM
---- Danh sách sổ cổ đông (detail)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[SHMT2011]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[SHMT2011]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [APKMaster] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [ShareTypeID] VARCHAR(50) NOT NULL,
  [TransactionDate] Datetime,	--Lưu ngày phát sinh giao dịch
  [TransactionTypeID] int null,	--Lưu nguồn phát sinh: 0-Sổ cổ đông; 1-Dăng ký mua cổ phần; 2-Chuyển nhượng cổ phần 
  [Description] NVARCHAR(250) NULL,
  [IncrementQuantity] DECIMAL(28,8) NULL,
  [DecrementQuantity] DECIMAL(28,8) NULL,
  [UnitPrice] DECIMAL(28,8) NULL,
  [OrderNo] INT NULL,
  [APKMInherited] UNIQUEIDENTIFIER NULL,
  [APKDInherited] UNIQUEIDENTIFIER NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_SHMT2011] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END