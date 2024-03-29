﻿---- Create by Cao Thị Phượng on 3/7/2017 11:55:25 AM
---- Mối liên hệ giữa đầu mối và chiến dịch

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CRMT20301_CRMT20401_REL]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CRMT20301_CRMT20401_REL]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [LeadID] VARCHAR(50) NOT NULL,
  [CampaignID] VARCHAR(50) NOT NULL
CONSTRAINT [PK_CRMT20301_CRMT20401_REL] PRIMARY KEY CLUSTERED
(
  [LeadID],
  [CampaignID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END