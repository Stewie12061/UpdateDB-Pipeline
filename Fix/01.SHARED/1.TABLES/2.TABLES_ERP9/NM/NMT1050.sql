﻿---- Create by Tra Giang on 16/08/2018 
---- Danh muc mon an

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[NMT1050]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[NMT1050]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,

  [DishID] VARCHAR(50) NOT NULL,
  [DishName] NVARCHAR(250) NOT NULL,
  [DishTypeID] VARCHAR(50)NOT NULL,
  [Description] NVARCHAR(250) NULL,
  [IsCommon] TINYINT NULL,
  [Disabled] TINYINT NULL,

  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_NMT1050] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END



  