﻿---- Create by Hồng Thảo on 02/11/2018
---- Danh mục mức độ ưu tiên 

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[FNT1020]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[FNT1020]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [PriorityID] VARCHAR(50) NOT NULL,
  [PriorityName] NVARCHAR(250) NULL,
  [PlanTypeID] VARCHAR(50) NULL,
  [Notes] NVARCHAR(250) NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL,
  [Disabled] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_FNT1020] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [PriorityID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END



