---- Create by Nguy?n T?n L?c on 8/20/2020 1:41:52 PM
---- Danh s�ch Email

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[OOT2220]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[OOT2220]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NULL,
  [UIDMail] NVARCHAR(250) NULL,
  [SubjectName] NVARCHAR(MAX) NULL,
  [From] NVARCHAR(MAX) NULL,
  [To] NVARCHAR(MAX) NULL,
  [Cc] NVARCHAR(MAX) NULL,
  [Bcc] NVARCHAR(MAX) NULL,
  [UserID] VARCHAR(50) NULL,
  [StatusID] VARCHAR(50) NULL,
  [TypeOfProtocol] VARCHAR(50) NULL,
  [Description] NVARCHAR(MAX) NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [CreateDate] DATETIME NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL
CONSTRAINT [PK_OOT2220] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END