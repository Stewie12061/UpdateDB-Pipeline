--- Created by Nguyễn Thanh Sơn on 12/12/2013
--- Lịch sử thôi học
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MTT2020]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[MTT2020]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NULL,
      [TranMonth] INT NOT NULL,
      [TranYear] INT NOT NULL,
      [StudentID] VARCHAR(50) NOT NULL,
      [ClassID] VARCHAR(50) NOT NULL,
      [StopVoucherNo] VARCHAR(50) NULL,
      [StopDate] DATETIME NULL,
      [StopReasonID] VARCHAR(50) NULL,
      [StopPerson] NVARCHAR(250) NULL,
      [Notes] NVARCHAR(2000) NULL,
      [DeleteFlag] TINYINT DEFAULT (0) NOT NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_MTT2020] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
