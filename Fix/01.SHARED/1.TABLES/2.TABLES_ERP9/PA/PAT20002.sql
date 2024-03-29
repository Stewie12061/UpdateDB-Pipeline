---- Create by Phan thanh hoàng vũ on 9/1/2017 6:21:57 PM
---- Danh sách đánh giá năng lực (Detail)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[PAT20002]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[PAT20002]
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
  [Benchmark] DECIMAL(28,8) NULL,
  [Perform] INT NULL,
  [PerformPoint] DECIMAL(28,8) NULL,
  [Reevaluated] INT NULL,
  [ReevaluatedPoint] DECIMAL(28,8) NULL,
  [UnifiedPoint] DECIMAL(28,8) NULL,
  [Note] NVARCHAR(250) NULL,
  [EvidenceNote] NVARCHAR(250) NULL,
  [OrderNo] INT NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_PAT20002] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END 