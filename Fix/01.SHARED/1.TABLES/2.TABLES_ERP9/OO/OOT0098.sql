﻿
---- Create by Đình Ly on 14/01/2020 09:34:00 AM
---- Dùng lưu chung các danh sách user của từng nghiệp vụ 

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[OOT0098]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[OOT0098]
(
	[APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
	[APKRel] UNIQUEIDENTIFIER NULL,
	[RelatedToID] VARCHAR(50) NULL,
	[RelBusiness] VARCHAR(50) NULL, 
	[APKObject] UNIQUEIDENTIFIER NULL,
	[ObjectID] VARCHAR(50) NULL,
	[ObjectBusiness] VARCHAR(50) NULL, 
	[RelatedToTypeID] INT NULL,
	[DataRefer01] NVARCHAR(MAX) NULL,
	[DataRefer02] NVARCHAR(MAX) NULL,
	[DataRefer03] NVARCHAR(MAX) NULL,
	[DataRefer04] NVARCHAR(MAX) NULL,
	[DataRefer05] NVARCHAR(MAX) NULL,

CONSTRAINT [PK_OOT0098] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END
