IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MTT0090]') AND TYPE IN (N'U'))
BEGIN
     
     CREATE TABLE [dbo].[MTT0090]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NOT NULL,
      [TeacherID] VARCHAR(50) NOT NULL,
      [ClassID] VARCHAR(50) NOT NULL,
      [FromDate] DATETIME NOT NULL,
      [ToDate] DATETIME NOT NULL,
      [Disabled] TINYINT DEFAULT 0 NOT NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL,
    CONSTRAINT [PK_MTT0090] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [TeacherID] ASC,
      [ClassID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END


