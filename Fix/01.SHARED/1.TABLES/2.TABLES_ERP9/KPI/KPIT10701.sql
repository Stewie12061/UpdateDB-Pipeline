---- Create by Phan thanh hoàng vũ on 8/22/2017 5:55:41 PM
---- Danh mục thiết lập bảng đánh giá KPI (master)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[KPIT10701]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[KPIT10701]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NULL,
  [DepartmentID] VARCHAR(50) NULL,
  [EvaluationPhaseID] VARCHAR(50) NULL,
  [EvaluationSetID] VARCHAR(50) NOT NULL,
  [EvaluationSetName] NVARCHAR(250) NOT NULL,
  [DutyID] VARCHAR(50) NULL,
  [TitleID] VARCHAR(50) NULL,
  [Note] NVARCHAR(250) NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL,
  [Disabled] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_KPIT10701] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'KPIT10701' AND xtype = 'U')
BEGIN
   ---- Modified on 22/02/2019 by Bảo Anh: Bổ sung cột Cách nhập bảng đánh giá
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'KPIT10701' AND col.name = 'TypingID') 
   ALTER TABLE KPIT10701 ADD TypingID VARCHAR(50) NULL
END
 
-------------------- 20/06/2020 - Vĩnh Tâm: Bổ sung cột EvaluationPhaseID cho các table cũ --------------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'KPIT10701' AND col.name = 'EvaluationPhaseID')
BEGIN
	ALTER TABLE KPIT10701 ADD EvaluationPhaseID VARCHAR(50) NULL
END
-------------------- 27/12/2023 - Minh Trí: Bổ sung cột DeleteFlg --------------------

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name]='KPIT10701' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
	ON col.id=tab.id WHERE tab.name='KPIT10701' and col.name='DeleteFlg')
	ALTER TABLE KPIT10701 ADD DeleteFlg TINYINT DEFAULT 0 NULL
END