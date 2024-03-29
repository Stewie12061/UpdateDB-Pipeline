---- Create by Phan thanh hoàng vũ on 24/07/2016 4:58:54 AM
---- Thiết lập phân tích chỉ số tài chính (Master)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT7926]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT7926]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NOT NULL,
      [ReportCode] VARCHAR(50) NOT NULL,
      [ReportName] NVARCHAR(250) NULL,
      [ReportTitle] NVARCHAR(250) NULL,
      [ReportID] VARCHAR(50) NULL,
      [ReportCode_CDKT] VARCHAR(50) NULL,
      [ReportCode_KQKD] VARCHAR(50) NULL,
      [AmountFormat] DECIMAL(28,8) NULL,
      [BracketNegative] DECIMAL(28,8) NULL,
      [Disabled] TINYINT DEFAULT (0) NOT NULL,
      [CreateDate] DATETIME NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL
    CONSTRAINT [PK_AT7926] PRIMARY KEY CLUSTERED
      (
      [DivisionID],
      [ReportCode]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END