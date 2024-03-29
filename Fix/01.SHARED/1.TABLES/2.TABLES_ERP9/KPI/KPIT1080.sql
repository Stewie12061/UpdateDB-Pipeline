---- Create by Khâu Vĩnh Tâm on 8/15/2019 11:04:14 PM
---- Bảng quy định thưởng KPI

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[KPIT1080]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[KPIT1080]
(
  [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
  [DivisionID] VARCHAR(50) NULL,
  [EffectiveDate] DATETIME NULL,
  [ExpirationDate] DATETIME NULL,
  [TableName] NVARCHAR(250) NULL,
  [Disabled] TINYINT DEFAULT 0 NULL,
  [IsCommon] TINYINT DEFAULT 0 NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_KPIT1080] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END