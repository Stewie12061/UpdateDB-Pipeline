---- Create by Phan thanh hoàng vũ on 9/4/2018 11:22:43 AM
---- Danh sách đợt phát hành (master)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[SHMT1020]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[SHMT1020]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NULL,
  [SHPublishPeriodID] VARCHAR(50) NOT NULL,
  [SHPublishPeriodName] NVARCHAR(250) NOT NULL,
  [SHPublishPeriodDate] DATETIME NOT NULL,
  [QuantityPreferredShare] DECIMAL(28,8) NULL,
  [QuantityCommonShare] DECIMAL(28,8) NULL,
  [QuantityTotal] DECIMAL(28,8) NULL,
  [Description] NVARCHAR(250) NULL,
  [Disabled] TINYINT DEFAULT (0) NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL,
  [CreateDate] DATETIME NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL
CONSTRAINT [PK_SHMT1020] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END
