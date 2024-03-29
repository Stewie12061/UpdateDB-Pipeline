---- Create by Phan thanh hoàng vũ on 9/27/2017 9:02:17 AM
---- Từ điển nhóm tính cách (D.I.S.C)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HRMT21102]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[HRMT21102]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [LanguageID] VARCHAR(50) NOT NULL,
  [CharacterGroupName] NVARCHAR(250) NOT NULL,
  [Character_D] NVARCHAR(4000) NULL,
  [Character_I] NVARCHAR(4000) NULL,
  [Character_S] NVARCHAR(4000) NULL,
  [Character_C] NVARCHAR(4000) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_HRMT21102] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END 

--Sắp xếp thứ tự
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'HRMT21102' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'HRMT21102' AND col.name = 'OrderNo') 
   ALTER TABLE HRMT21102 ADD OrderNo INT NULL 
END

/*===============================================END OrderNo===============================================*/ 