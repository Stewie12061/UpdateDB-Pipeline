---- Create by Phan thanh hoàng vũ on 16/08/2016 10:49:17 AM
---- Khuyến mãi theo hóa đơn (Master)là bảng CIT0108, bảng detail là AT0109 (đẫy là bảng gốc của ERP8.1)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CIT0108]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[CIT0108]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
      [DivisionID] VARCHAR(50) NOT NULL,
      [PromoteID] VARCHAR(50) NOT NULL,
      [PromoteName] NVARCHAR(250) NOT NULL,
      [FromDate] DATETIME NOT NULL,
      [ToDate] DATETIME NOT NULL,
      [Description] NVARCHAR(250) NULL,
      [IsCommon] TINYINT DEFAULT (0) NOT NULL,
      [Disabled] TINYINT DEFAULT (0) NOT NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_CIT0108] PRIMARY KEY CLUSTERED
      (
      [PromoteID]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END