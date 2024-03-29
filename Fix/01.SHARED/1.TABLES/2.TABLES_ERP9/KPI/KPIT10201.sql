---- Create by Phan thanh hoàng vũ on 8/11/2017 1:26:07 PM
---- Danh mục từ điển thỉ tiêu

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[KPIT10201]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[KPIT10201]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [ClassificationID] INT NULL,
  [TargetsDictionaryID] VARCHAR(50) NOT NULL,
  [TargetsDictionaryName] NVARCHAR(250) NOT NULL,
  [TargetsGroupID] VARCHAR(50) NULL,
  [UnitKpiID] VARCHAR(50) NULL,
  [FormulaName] NVARCHAR(250) NULL,
  [FrequencyID] VARCHAR(50) NULL,
  [SourceID] VARCHAR(50) NULL,
  [Note] NVARCHAR(250) NULL,
  [Categorize] INT NULL,
  [Percentage] DECIMAL(28,8) NULL,
  [Revenue] DECIMAL(28,8) NULL,
  [GoalLimit] DECIMAL(28,8) NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL,
  [Disabled] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_KPIT10201] PRIMARY KEY CLUSTERED
(
  [TargetsDictionaryID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END 