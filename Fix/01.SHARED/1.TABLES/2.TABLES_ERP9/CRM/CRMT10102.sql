---- Create by Phan Thanh Hoàng Vũ on 21/12/2015 7:06:58 PM
---- Mối liên hệ khách hàng và liên hệ

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CRMT10102]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[CRMT10102]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NOT NULL,
      [AccountID] VARCHAR(50) NOT NULL,
      [ContactID] VARCHAR(50) NOT NULL,
      [Disabled] TINYINT DEFAULT (0) NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_CRMT10102] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END