﻿---- Create by Đoàn Duy on 15/3/2022
---- File đính kèm và đối tượng liên quan cho newsfeed

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[OOT2091]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[OOT2091]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [AttachID] INT NOT NULL,
  [RelatedToID] VARCHAR(250) NOT NULL,
  [RelatedToTypeID_REL] INT NOT NULL,
  [TypeAttach] INT NULL,
CONSTRAINT [PK_OOT2091] PRIMARY KEY CLUSTERED
(
  [AttachID],
  [RelatedToID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END