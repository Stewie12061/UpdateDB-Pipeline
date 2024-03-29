﻿---- Create by Tieumai on 6/6/2018 1:18:28 PM
---- Danh mục ca làm việc

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0069]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST0069]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] NVARCHAR(50) NOT NULL,
  [ShopID] NVARCHAR(50) NOT NULL,
  [ShiftID] NVARCHAR(50) NOT NULL,
  [FromTime] DATETIME NULL,
  [ToTime] DATETIME NULL,
  [EmployeeID] NVARCHAR(50) NULL,
  [Description] NVARCHAR(250) NULL,
  [Disabled] TINYINT DEFAULT (0) NOT NULL,
  [CreateUserID] NVARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] NVARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_POST0069] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [ShopID],
  [ShiftID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END
