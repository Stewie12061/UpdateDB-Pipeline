---- Create by Phan thanh hoàng vũ on 9/4/2018 10:52:05 AM
---- Danh mục nhóm cổ đông

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[SHMT1000]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[SHMT1000]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [ShareHolderCategoryID] VARCHAR(50) NOT NULL,
  [ShareHolderCategoryName] NVARCHAR(250) NOT NULL,
  [Notes] NVARCHAR(250) NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL,
  [Disabled] TINYINT DEFAULT (0) NULL,
  [CreateDate] DATETIME NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL
CONSTRAINT [PK_SHMT1000] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [ShareHolderCategoryID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END