---- Create by Phan thanh hoàng vũ on 7/26/2017 3:33:17 PM
---- Cập nhật hàng khuyến mãi theo CA (Minhsang)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT1329_MS]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1329_MS]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [PromoteID] VARCHAR(50) NOT NULL,
  [CA] DECIMAL(28,8) NOT NULL,
  [Description] NVARCHAR(250) NULL,
  [OrderNo] INT NULL
CONSTRAINT [PK_AT1329_MS] PRIMARY KEY CLUSTERED
(
  [PromoteID],
  [CA]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END 