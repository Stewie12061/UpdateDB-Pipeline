---- Create by Phan thanh hoàng vũ on 8/31/2017 1:29:56 PM
---- Danh mục năng lực (Detail mức năng lực tiêu chuẩn)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[PAT10102]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[PAT10102]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [APKMaster] UNIQUEIDENTIFIER NOT NULL,
  [LevelStandardID] INT NOT NULL,
  [LevelStandardName] NVARCHAR(250) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_PAT10102] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

--------- Modify by Phan thanh hoàng vũ on 08/11/2017: sửa kiểu dữ liệu cột tiêu chuẩn (LevelStandardName )
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='PAT10102' AND xtype='U')
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab ON col.id=tab.id WHERE tab.name='PAT10102' AND col.name='LevelStandardName')
		ALTER TABLE PAT10102 ALTER COLUMN LevelStandardName NVARCHAR(max) NULL 
	END