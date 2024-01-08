﻿---- Create by Tra Giang on 15/08/2018 
---- Thiết lập hệ thống (danh mục thành phần dinh dưỡng/ danh sách kho)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[NMT0001]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[NMT0001]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [SystemID] VARCHAR(50) NOT NULL,
  [SystemName] NVARCHAR(50) NULL,
  [SystemNameE] NVARCHAR(50) NULL,
  [WareHouseID] VARCHAR(50) NULL,
  [IsUse] TINYINT NULL,
  [IsCommon] TINYINT NULL,
  [Type] TINYINT NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_NMT0001] PRIMARY KEY CLUSTERED
(
  DivisionID,
  SystemID
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]

 END
