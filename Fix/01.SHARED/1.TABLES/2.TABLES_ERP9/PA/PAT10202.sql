---- Create by Phan thanh hoàng vũ on 8/31/2017 5:32:48 PM
---- Danh mục thiết lập bảng đánh giá năng lực từng vị trí (Detail)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[PAT10202]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[PAT10202]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [APKMaster] UNIQUEIDENTIFIER NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [AppraisalID] VARCHAR(50) NULL,
  [AppraisalName] NVARCHAR(250) NULL,
  [AppraisalGroupID] VARCHAR(50) NULL,
  [AppraisalGroupGoal] DECIMAL(28,8) NULL,
  [LevelCritical] INT NULL,
  [LevelStandardID] INT NULL,
  [LevelStandardName] NVARCHAR(250) NULL,
  [Note] NVARCHAR(250) NULL,
  [OrderNo] INT NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_PAT10202] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END 