---- Create by Phan thanh hoàng vũ on 3/7/2017 4:09:36 PM
---- Modify by Nguyễn Thị Lệ Huyền --  thêm cột Description
---- Danh mục loại hình bán hàng

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CRMT10601]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CRMT10601]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [SalesTagID] VARCHAR(50) NOT NULL,
  [SalesTagName] NVARCHAR(250) NOT NULL,
  [Disabled] TINYINT DEFAULT (0) NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL,
  [Description] NVARCHAR(250) NULL
CONSTRAINT [PK_CRMT10601] PRIMARY KEY CLUSTERED
(
  [SalesTagID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END