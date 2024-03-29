---- Create by Phan thanh hoàng vũ on 8/22/2017 5:56:42 PM
---- Danh mục thiết lập bảng đánh giá KPI (Detail)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[KPIT10702]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[KPIT10702]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [APKMaster] UNIQUEIDENTIFIER NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [TargetsID] VARCHAR(50) NULL,
  [TargetsName] NVARCHAR(250) NULL,
  [TargetsGroupID] VARCHAR(50) NULL,
  [TargetsGroupPercentage] DECIMAL(28,8) NULL,
  [UnitKpiID] VARCHAR(50) NULL,
  [FormulaName] NVARCHAR(250) NULL,
  [FrequencyID] VARCHAR(50) NULL,
  [SourceID] VARCHAR(50) NULL,
  [Note] NVARCHAR(250) NULL,
  [Categorize] INT NULL,
  [TargetsPercentage] DECIMAL(28,8) NULL,
  [Revenue] DECIMAL(28,8) NULL,
  [GoalLimit] DECIMAL(28,8) NULL,
  [Benchmark] DECIMAL(28,8) NULL,
  [OrderNo] INT NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_KPIT10702] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END