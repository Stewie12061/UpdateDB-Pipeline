---- Create by Phan thanh hoàng vũ on 4/11/2017 11:06:34 AM
---- Phân loại mã đối tượng (dùng CRM)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT1331]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1331]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [TypeID] VARCHAR(50) NULL,
  [S] VARCHAR(50) NOT NULL,
  [STypeID] VARCHAR(50) NOT NULL,
  [SName] NVARCHAR(250) NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL,
  [Disabled] TINYINT DEFAULT (0) NULL,
  [CreateDate] DATETIME NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL
CONSTRAINT [PK_AT1331] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [S],
  [STypeID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END


--Quản lý mã tăng tự động đối tượng và bổ sung đối tượng bên CRM
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'AT1331' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'AT1331' AND col.name = 'TableID') 
   ALTER TABLE AT1331 ADD TableID VARCHAR(50) NULL 
END