﻿---- Create by Cao Thị Phượng on 3/9/2017 11:09:01 AM
---- Người dùng và đối tượng liên quan

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT1103_REL]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1103_REL]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [RelatedToID] VARCHAR(50) NOT NULL,
  [UserID] VARCHAR(50) NOT NULL,
  [RelatedToTypeID] INT NOT NULL
CONSTRAINT [PK_AT1103_REL] PRIMARY KEY CLUSTERED
(
  [RelatedToID],
  [UserID],
  [RelatedToTypeID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END