---- Create by Khâu Vĩnh Tâm on 12/7/2018 8:23:18 AM
---- Danh mục dùng chung

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[OOT1070]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[OOT1070]
(
  [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [CodeMaster] VARCHAR(25) NOT NULL,
  [CategoryName] NVARCHAR(250) NOT NULL,
  [AttachID] INT NULL,
  [AttachFile] VARBINARY(8000) NULL,
  [AttachName] NVARCHAR(MAX) NULL,
  [Disabled] TINYINT DEFAULT 0 NULL,
  [IsCommon] TINYINT DEFAULT 0 NULL,
  [CreateDate] DATETIME NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL
CONSTRAINT [PK_OOT1070] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [CodeMaster]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END