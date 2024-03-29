---- Create by Phan thanh hoàng vũ on 4/12/2019 5:06:25 PM
---- Quản lý chi tiết đã thu tiền khách/đã nộp cửa hàng (NHANNGOC) => cho phép thu/nộp nhiều lần

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[APT0014]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[APT0014]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NULL,
  [RefVoucherID] VARCHAR(50) NULL,
  [RefTableID] VARCHAR(50) NULL,
  [IsERP] INT NULL,
  [TypeID] INT NULL,
  [OriginalAmount] DECIMAL(28,8) NULL,
  [ConvertedAmount] DECIMAL(28,8) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_APT0014] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END