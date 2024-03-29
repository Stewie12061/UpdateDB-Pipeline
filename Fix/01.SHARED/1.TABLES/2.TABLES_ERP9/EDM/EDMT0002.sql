---- Create by Hồng Thảo on 23/10/2018
---- Thiết lập người xét duyệt

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[EDMT0002]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[EDMT0002]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NOT NULL,
      [VoucherTypeID] VARCHAR(50) NOT NULL,
      [AbsentType] VARCHAR(50) NULL,
      [Level] INT NULL,
	  [AbsentTypeID] VARCHAR(50) NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_EDMT0002] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END


