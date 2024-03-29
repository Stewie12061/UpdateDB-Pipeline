---- Create by Phan thanh hoàng vũ on 3/17/2017 8:06:40 AM
---- Danh sách nhóm người nhận

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CRMT10301]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CRMT10301]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [GroupReceiverID] VARCHAR(50) NOT NULL,
  [GroupReceiverName] NVARCHAR(250) NOT NULL,
  [Description] NVARCHAR(250) NULL,
  [IsCommon] TINYINT DEFAULT (0) NOT NULL,
  [Disabled] TINYINT DEFAULT (0) NOT NULL,
  [CreateDate] DATETIME NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL
CONSTRAINT [PK_CRMT10301] PRIMARY KEY CLUSTERED
(
  [GroupReceiverID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END