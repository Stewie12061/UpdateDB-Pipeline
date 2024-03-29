---- Create by Phan thanh hoàng vũ on 8/31/2017 5:31:30 PM
---- Danh mục thiết lập bảng đánh giá năng lực từng vị trí (Master)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[PAT10201]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[PAT10201]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [EvaluationKitID] VARCHAR(50) NOT NULL,
  [EvaluationKitName] NVARCHAR(250) NULL,
  [EvaluationPhaseID] VARCHAR(50) NULL,
  [DepartmentID] VARCHAR(50) NULL,
  [DutyID] VARCHAR(50) NULL,
  [TitleID] VARCHAR(50) NULL,
  [Note] NVARCHAR(250) NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL,
  [Disabled] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_PAT10201] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'PAT10201' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'PAT10201' AND col.name = 'EvaluationPhaseID') 
   ALTER TABLE PAT10201 ADD EvaluationPhaseID VARCHAR(50) NULL 
END

/*===============================================END EvaluationPhaseID===============================================*/ 