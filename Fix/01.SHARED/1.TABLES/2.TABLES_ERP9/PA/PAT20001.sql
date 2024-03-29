---- Create by Phan thanh hoàng vũ on 9/1/2017 6:21:13 PM
---- Danh sách đánh giá năng lực (master)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[PAT20001]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[PAT20001]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [EmployeeID] VARCHAR(50) NOT NULL,
  [EvaluationPhaseID] VARCHAR(50) NULL,
  [FromDate] DATETIME NULL,
  [ToDate] DATETIME NULL,
  [EvaluationKitID] VARCHAR(50) NULL,
  [EvaluationKitName] NVARCHAR(250) NULL,
  [DepartmentID] VARCHAR(50) NULL,
  [DutyID] VARCHAR(50) NULL,
  [TitleID] VARCHAR(50) NULL,
  [Note] NVARCHAR(250) NULL,
  [ConfirmUserID] VARCHAR(50) NULL,
  [ConfirmComments] NVARCHAR(250) NULL,
  [TotalPerformPoint] DECIMAL(28,8) NULL,
  [TotalReevaluatedPoint] DECIMAL(28,8) NULL,
  [TotalUnifiedPoint] DECIMAL(28,8) NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_PAT20001] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

---- Modified on 18/02/2019 by Bảo Anh: Bổ sung cột phân biệt bảng đánh giá tuyển dụng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'PAT20001' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'PAT20001' AND col.name = 'IsRecruitment') 
   ALTER TABLE PAT20001 ADD IsRecruitment TINYINT NULL DEFAULT(0)
END