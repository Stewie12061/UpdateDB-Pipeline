---- Create by Thanh Luong on 13/11/2023
---- Quan ly tien coc theo chuong trinh
---- DROP TABLE CIT1530
IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CIT1533]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CIT1533]
(
	[APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
	[DivisionID] nvarchar(50) NULL,
	[ObjectID] nvarchar(50) NOT NULL,
	[PromoteID] nvarchar(50) NOT NULL,
	[ConditionID] nvarchar(50) NOT NULL,
	[DepositAmount] Decimal(28,8) NULL,
	[TatolPaidAmount] Decimal(28,8) NULL,
	[RemainedAmount] Decimal(28,8) NULL,
	[CreateUserID] VARCHAR(50) NULL,
	[CreateDate] DATETIME NULL,
	[LastModifyUserID] VARCHAR(50) NULL,
	[LastModifyDate] DATETIME NULL
CONSTRAINT [PK_CIT1533] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END 
