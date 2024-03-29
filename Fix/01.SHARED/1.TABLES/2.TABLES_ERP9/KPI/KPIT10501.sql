---- Create by Phan thanh hoàng vũ on 8/12/2017 7:17:41 AM
---- Danh mục chỉ tiêu (master)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[KPIT10501]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[KPIT10501]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [TargetsID] VARCHAR(50) NOT NULL,
  [TargetsName] NVARCHAR(250) NOT NULL,
  [FrequencyID] VARCHAR(50) NULL,
  [SourceID] VARCHAR(50) NULL,
  [Categorize] INT NULL,
  [FormulaName] NVARCHAR(250) NULL,
  [Note] NVARCHAR(250) NULL,
  [UnitKpiID] VARCHAR(50) NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL,
  [Disabled] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_KPIT10501] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

--Cho phép sắp xếp chỉ tiêu nào trước sau.
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'KPIT10501' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'KPIT10501' AND col.name = 'OrderNo') 
   ALTER TABLE KPIT10501 ADD OrderNo INT NULL

   ---- Modified on 22/02/2019 by Bảo Anh: Bổ sung cột Mã công thức tính
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'KPIT10501' AND col.name = 'FormulaID') 
   ALTER TABLE KPIT10501 ADD FormulaID VARCHAR(50) NULL
END

--- 17/09/2020 - Trọng Kiên: Thay đổi kiểu dữ liệu FormulaName
IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'KPIT10501' AND col.name = 'FormulaName')
BEGIN
	ALTER TABLE KPIT10501 ALTER COLUMN FormulaName NVARCHAR(MAX) NULL
END
-- 26/12/2023 - Minh Trí: Bổ sung cột DeleteFlg
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name]='KPIT10501' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
	ON col.id=tab.id WHERE tab.name='KPIT10501' and col.name='DeleteFlg')
	ALTER TABLE KPIT10501 ADD DeleteFlg TINYINT DEFAULT 0 NULL
END
/*===============================================END OrderNo===============================================*/ 