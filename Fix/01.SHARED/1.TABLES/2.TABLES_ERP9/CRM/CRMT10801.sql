---- Create by Phan Thanh Hoàng Vũ on 3/23/2017 1:21:45 PM
---- Modify by Nguyễn Thị Lệ Huyền thêm column
---- Danh mục hành động tiếp theo

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CRMT10801]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CRMT10801]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [NextActionID] VARCHAR(50) NOT NULL,
  [NextActionName] NVARCHAR(250) NOT NULL,
  [Disabled] TINYINT DEFAULT (0) NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL,
  [Description] NVARCHAR(250) NULL
CONSTRAINT [PK_CRMT10801] PRIMARY KEY CLUSTERED
(
  [NextActionID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END