﻿---- Create by Cao Thị Phượng on 3/17/2017 1:13:57 PM
---- Mối liên hệ giữa chiến dịch và nhóm người nhận

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CRMT20401_CRMT10301_REL]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CRMT20401_CRMT10301_REL]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [CampaignID] VARCHAR(50) NOT NULL,
  [GroupReceiverID] VARCHAR(50) NOT NULL
CONSTRAINT [PK_CRMT20401_CRMT10301_REL] PRIMARY KEY CLUSTERED
(
  [CampaignID],
  [GroupReceiverID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END