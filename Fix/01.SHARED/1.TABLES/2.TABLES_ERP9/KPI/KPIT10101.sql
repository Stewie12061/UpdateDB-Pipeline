---- Create by Phan thanh hoàng vũ on 8/11/2017 7:31:47 AM
---- Danh mục nhóm chỉ tiêu KPI/DGNL (master)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[KPIT10101]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[KPIT10101]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [TargetsGroupID] VARCHAR(50) NOT NULL,
  [TargetsGroupName] NVARCHAR(250) NOT NULL,
  [TargetsTypeID] INT NOT NULL,
  [Note] NVARCHAR(250) NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL,
  [Disabled] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_KPIT10101] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

--Cho phép sắp xếp Nhóm chỉ tiêu nào trước sau.
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'KPIT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'KPIT10101' AND col.name = 'OrderNo') 
   ALTER TABLE KPIT10101 ADD OrderNo INT NULL 
END
--Bổ sung cột DeleteFlg
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name]='KPIT10101' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
	ON col.id=tab.id WHERE tab.name='KPIT10101' and col.name='DeleteFlg')
	ALTER TABLE KPIT10101 ADD DeleteFlg TINYINT DEFAULT 0 NULL
END
/*===============================================END OrderNo===============================================*/ 