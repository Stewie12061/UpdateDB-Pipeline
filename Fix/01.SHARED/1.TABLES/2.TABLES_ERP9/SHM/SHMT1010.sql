---- Create by Phan thanh hoàng vũ on 9/4/2018 10:53:20 AM
---- Danh mục loại cổ phần

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[SHMT1010]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[SHMT1010]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [ShareTypeID] VARCHAR(50) NOT NULL,
  [ShareTypeName] NVARCHAR(250) NOT NULL,
  [UnitPrice] DECIMAL(28,8) NULL,
  [PreferentialDescription] NVARCHAR(250) NULL,
  [TransferCondition] NVARCHAR(250) NULL,
  [LimitTransferYear] INT NULL,
  [SharedKind] TINYINT DEFAULT (0) NULL,
  [Disabled] TINYINT DEFAULT (0) NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL,
  [CreateDate] DATETIME NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL
CONSTRAINT [PK_SHMT1010] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [ShareTypeID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END