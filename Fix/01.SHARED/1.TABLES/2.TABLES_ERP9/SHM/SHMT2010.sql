---- Create by Phan thanh hoàng vũ on 9/5/2018 10:00:39 AM
---- Danh sách sổ cổ đông (master)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[SHMT2010]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[SHMT2010]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [ObjectID] VARCHAR(50) NOT NULL,
  [ShareHolderCategoryID] VARCHAR(50) NULL,
  [ContactIssueDate] DATETIME NULL,
  [ContactIssueBy] NVARCHAR(250) NULL,
  [IdentificationNumber] VARCHAR(50) NULL,
  [ContactPrefix] VARCHAR(50) NULL,
  [TotalShare] DECIMAL(28,8) NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_SHMT2010] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END