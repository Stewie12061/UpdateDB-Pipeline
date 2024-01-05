---- Create by Phan thanh hoàng vũ on 3/6/2017 3:22:53 PM
---- Mối liên hệ giữa cơ hội và liên hệ

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CRMT20501_CRMT10001_REL]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CRMT20501_CRMT10001_REL]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [OpportunityID] VARCHAR(50) NOT NULL,
  [ContactID] VARCHAR(50) NOT NULL
CONSTRAINT [PK_CRMT20501_CRMT10001_REL] PRIMARY KEY CLUSTERED
(
  [OpportunityID],
  [ContactID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END