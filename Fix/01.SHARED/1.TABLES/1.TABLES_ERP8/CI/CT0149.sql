---- Create by Phan thanh hoàng vũ on 3/7/2018 3:15:35 PM
---- Khuyến mãi tăng hàng theo hóa đơn (master)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CT0149]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CT0149]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [PromoteID] VARCHAR(50) NOT NULL,
  [PromoteName] NVARCHAR(250) NOT NULL,
  [FromDate] DATETIME NULL,
  [ToDate] DATETIME NULL,
  [Description] NVARCHAR(250) NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL,
  [Disabled] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_CT0149] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [PromoteID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END