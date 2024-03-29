---- Create by Phan thanh hoàng vũ on 8/31/2017 1:25:46 PM
---- Danh mục năng lực (Master)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[PAT10101]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[PAT10101]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [AppraisalID] VARCHAR(50) NOT NULL,
  [AppraisalName] NVARCHAR(250) NOT NULL,
  [Note] NVARCHAR(250) NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL,
  [Disabled] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_PAT10101] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

--Cho phép sắp xếp thứ tự năng lực
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'PAT10101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'PAT10101' AND col.name = 'OrderNo') 
   ALTER TABLE PAT10101 ADD OrderNo INT NULL 
END

/*===============================================END OrderNo===============================================*/ 