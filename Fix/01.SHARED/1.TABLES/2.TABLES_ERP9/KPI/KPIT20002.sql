---- Create by Phan thanh hoàng vũ on 8/24/2017 9:34:21 AM
---- Danh sách cá nhân tư đánh giá (Detail)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[KPIT20002]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[KPIT20002]
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
  [Note] NVARCHAR(250) NULL,
  [Categorize] INT NULL,
  [TargetsPercentage] DECIMAL(28,8) NULL,
  [Revenue] DECIMAL(28,8) NULL,
  [GoalLimit] DECIMAL(28,8) NULL,
  [Benchmark] DECIMAL(28,8) NULL,
  [Perform] DECIMAL(28,8) NULL,
  [PerformPoint] DECIMAL(28,8) NULL,
  [Reevaluated] DECIMAL(28,8) NULL,
  [ReevaluatedPoint] DECIMAL(28,8) NULL,
  [UnifiedPoint] DECIMAL(28,8) NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [OrderNo] INT NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_KPIT20002] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

--Bổ sung cột "Dghi chú đánh giá lại"----
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'KPIT20002' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'KPIT20002' AND col.name = 'ReevaluatedNote') 
   ALTER TABLE KPIT20002 ADD ReevaluatedNote NVARCHAR(4000) NULL 
END

/*===============================================END ReevaluatedNote===============================================*/ 