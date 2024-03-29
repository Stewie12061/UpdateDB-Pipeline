---- Create by Phan thanh hoàng vũ on 24/07/2016 4:59:56 AM
---- Thiết lập phan tích chỉ số tài chính (Detail)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT7927]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT7927]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NOT NULL,
      [ReportCode] VARCHAR(50) NOT NULL,
      [LineCode] VARCHAR(50) NOT NULL,
      [LineName] NVARCHAR(250) NULL,
      [IsCode] TINYINT DEFAULT (0) NULL,
      [Formula] NVARCHAR(250) NULL,
      [InheritAPK] VARCHAR(50) NULL,
      [IsStatus] TINYINT DEFAULT (0) NULL,
      [PrintStatus] TINYINT DEFAULT (0) NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_AT7927] PRIMARY KEY CLUSTERED
      (
      [DivisionID],
      [ReportCode],
      [LineCode]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END