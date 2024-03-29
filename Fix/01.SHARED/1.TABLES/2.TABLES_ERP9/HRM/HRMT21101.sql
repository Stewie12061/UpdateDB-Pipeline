---- Create by Phan thanh hoàng vũ on 9/27/2017 8:58:14 AM
---- Nhóm tính cách cá nhân (D.I.S.C)
---- Modified on 22/09/2020 by Nhựt Trường: Chỉnh sửa lại kiểu dữ liệu của cột Descriptions từ TEXT thành NTEXT.
---- Modified on 28/09/2020 by Văn Tài	  : Bổ sung alter trung gian NVARCHAR(MAX)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HRMT21101]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[HRMT21101]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [EvaluationDate] DATETIME NOT NULL,
  [EmployeeID] VARCHAR(50) NOT NULL,
  [DepartmentID] VARCHAR(50) NOT NULL,
  [TeamID] VARCHAR(50) NULL,
  [DutyID] VARCHAR(50) NULL,
  [TitleID] VARCHAR(50) NULL,
  [Nature_D] INT DEFAULT 0 NULL,
  [Nature_I] INT DEFAULT 0 NULL,
  [Nature_S] INT DEFAULT 0 NULL,
  [Nature_C] INT DEFAULT 0 NULL,
  [Nature] VARCHAR(50) NULL,
  [Adaptive_D] INT DEFAULT 0 NULL,
  [Adaptive_I] INT DEFAULT 0 NULL,
  [Adaptive_S] INT DEFAULT 0 NULL,
  [Adaptive_C] INT DEFAULT 0 NULL,
  [Adaptive] VARCHAR(50) NULL,
  [Descriptions] [NTEXT] NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_HRMT21101] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END 

IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE [name] = 'HRMT21101' AND type = 'U')
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
		ON col.id = tab.id WHERE tab.name = 'HRMT21101' AND col.name = 'Descriptions')
		ALTER TABLE HRMT21101 ALTER COLUMN Descriptions NVARCHAR(MAX) NULL

		IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
		ON col.id = tab.id WHERE tab.name = 'HRMT21101' AND col.name = 'Descriptions')
		ALTER TABLE HRMT21101 ALTER COLUMN Descriptions NTEXT NULL

		IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
		ON col.id = tab.id WHERE tab.name = 'HRMT21101' AND col.name = 'Nature')
		ALTER TABLE HRMT21101 ALTER COLUMN Nature NVARCHAR(MAX) NULL
		
		IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
		ON col.id = tab.id WHERE tab.name = 'HRMT21101' AND col.name = 'Adaptive')
		ALTER TABLE HRMT21101 ALTER COLUMN Adaptive NVARCHAR(MAX) NULL
	END
