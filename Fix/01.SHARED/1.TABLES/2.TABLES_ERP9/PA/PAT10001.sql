---- Create by Phan thanh hoàng vũ on 8/28/2017 3:26:00 PM
---- Danh mục từ điển năng lực (Master)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[PAT10001]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[PAT10001]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [AppraisalDictionaryID] VARCHAR(50) NOT NULL,
  [AppraisalDictionaryName] NVARCHAR(250) NOT NULL,
  [AppraisalGroupID] VARCHAR(50) NULL,
  [LevelCritical] INT NULL,
  [LevelStandardNo] INT NULL,
  [Note] NVARCHAR(250) NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL,
  [Disabled] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_PAT10001] PRIMARY KEY CLUSTERED
(
  [AppraisalDictionaryID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END 