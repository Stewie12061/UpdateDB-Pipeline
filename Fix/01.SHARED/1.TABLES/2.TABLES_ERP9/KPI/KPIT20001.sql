---- Create by Phan thanh hoàng vũ on 8/24/2017 9:32:56 AM
---- Danh sách cá nhân tư đánh giá (Master)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[KPIT20001]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[KPIT20001]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [EmployeeID] VARCHAR(50) NOT NULL,
  [EmployeeName] NVARCHAR(250) NOT NULL,
  [EvaluationPhaseID] VARCHAR(50) NULL,
  [EvaluationSetID] VARCHAR(50) NULL,
  [EvaluationSetName] NVARCHAR(250) NULL,
  [Note] NVARCHAR(250) NULL,
  [FromDate] DATETIME NULL,
  [ToDate] DATETIME NULL,
  [DepartmentID] VARCHAR(50) NULL,
  [DutyID] VARCHAR(50) NULL,
  [TitleID] VARCHAR(50) NULL,
  [StrengthPoint] NVARCHAR(250) NULL,
  [WeakPoint] NVARCHAR(250) NULL,
  [EmployeeComments] NVARCHAR(250) NULL,
  [EmployeeProposes] NVARCHAR(250) NULL,
  [ConfirmUserID] VARCHAR(50) NULL,
  [ConfirmDepartmentID] VARCHAR(50) NULL,
  [ConfirmDutyID] VARCHAR(50) NULL,
  [ConfirmTitleID] VARCHAR(50) NULL,
  [ConfirmComments] NVARCHAR(250) NULL,
  [TotalPerformPoint] DECIMAL(28,8) NULL,
  [TotalReevaluatedPoint] DECIMAL(28,8) NULL,
  [TotalUnifiedPoint] DECIMAL(28,8) NULL,
  [ClassificationPerformPoint] VARCHAR(50) NULL,
  [ClassificationReevaluatedPoint] VARCHAR(50) NULL,
  [ClassificationUnifiedPoint] VARCHAR(50) NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_KPIT20001] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END 