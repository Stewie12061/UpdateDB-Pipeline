---- Create by Phan thanh hoàng vũ on 8/9/2017 4:07:36 PM
---- Bảng quản lý lịch sử sơ đồ cây tổ chức

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CIT1101]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CIT1101]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [APKMaster] UNIQUEIDENTIFIER NULL,
  [DivisionID] VARCHAR(50) NULL,
  [DepartmentID] VARCHAR(50) NULL,
  [TeamID] VARCHAR(50) NULL,
  [UserID] VARCHAR(50) NULL,
  [NodeTypeID] VARCHAR(50) NULL,
  [NodeID] VARCHAR(50) NULL,
  [NodeParentID] VARCHAR(50) NULL,
  [NodeName] NVARCHAR(4000) NULL,
  [Paths] NVARCHAR(4000) NULL,
  [OrderNo] Int NULL
CONSTRAINT [PK_CIT1101] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CIT1101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CIT1101' AND col.name = 'DivisionID') 
   ALTER TABLE CIT1101 ADD DivisionID VARCHAR(50) NULL 
END

/*===============================================END DivisionID===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CIT1101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CIT1101' AND col.name = 'DepartmentID') 
   ALTER TABLE CIT1101 ADD DepartmentID VARCHAR(50) NULL 
END

/*===============================================END DepartmentID===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CIT1101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CIT1101' AND col.name = 'TeamID') 
   ALTER TABLE CIT1101 ADD TeamID VARCHAR(50) NULL 
END

/*===============================================END TeamID===============================================*/ 


IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CIT1101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CIT1101' AND col.name = 'UserID') 
   ALTER TABLE CIT1101 ADD UserID VARCHAR(50) NULL 
END

/*===============================================END UserID===============================================*/ 