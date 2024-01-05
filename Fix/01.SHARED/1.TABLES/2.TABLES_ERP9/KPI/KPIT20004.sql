---- Kết quả thực hiện KPI (Detail)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[KPIT20004]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[KPIT20004]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [APKMaster] UNIQUEIDENTIFIER NOT NULL,
  [DivisionID] VARCHAR(50) NULL,
  [TargetsID] VARCHAR(50) NULL,
  [TargetsName] NVARCHAR(250) NULL,
  [TargetsGroupID] VARCHAR(50) NULL,
  [TargetsGroupPercentage] DECIMAL(28,8) NULL,
  [UnitKpiID] VARCHAR(50) NULL,
  [FormulaName] NVARCHAR(250) NULL,
  [FrequencyID] VARCHAR(50) NULL,
  [SourceID] VARCHAR(50) NULL,
  [Categorize] INT NULL,
  [TargetsPercentage] DECIMAL(28,8) NULL,
  [Revenue] DECIMAL(28,8) NULL,
  [GoalLimit] DECIMAL(28,8) NULL,
  [Benchmark] DECIMAL(28,8) NULL,
  [PerformTotal] DECIMAL(28,8) NULL,
  [PerformPointTotal] DECIMAL(28,8) NULL,
  [PerformPercent] DECIMAL(28,8) NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [OrderNo] INT NULL
CONSTRAINT [PK_KPIT20004] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END