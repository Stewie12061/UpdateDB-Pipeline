---- Create by Phan thanh hoàng vũ on 4/28/2017 4:34:00 PM
---- Danh mục phân quyền xem (Vai trò)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[ST10501]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[ST10501]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [RoleID] VARCHAR(50) NOT NULL,
  [RoleName] NVARCHAR(250) NOT NULL,
  [ParentRoleID] VARCHAR(50) NULL,
  [LevelRoleID] INT NULL,
  [IsDefaultRoleID] TINYINT DEFAULT (0) NULL,
  [Notes] NVARCHAR(250) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_ST10501] PRIMARY KEY CLUSTERED
(
  [RoleID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF EXISTS (SELECT * FROM sysobjects WHERE NAME='ST10501' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='ST10501' AND col.name='IsDefualtRoleID')
	EXEC sp_rename 'ST10501.IsDefualtRoleID', 'IsDefaultRoleID', 'COLUMN';
END

--- 13/08/2020 - Tấn Thành: Bổ sung cột FillRoleID
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'ST10501' AND col.name = 'FillRoleType')
BEGIN
	ALTER TABLE ST10501 ADD FillRoleType VARCHAR(50) NULL
END
