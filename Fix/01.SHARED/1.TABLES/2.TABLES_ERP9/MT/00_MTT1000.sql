IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MTT1000]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[MTT1000]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NULL,
      [CourseID] VARCHAR(50) NOT NULL,
      [CourseName] NVARCHAR(250) NULL,
      [BeginDate] DATETIME NULL,
      [EndDate] DATETIME NULL,
      [Notes] NVARCHAR(500) NULL,
      [IsCommon] TINYINT DEFAULT (0) NOT NULL,
      [Disabled] TINYINT DEFAULT (0) NOT NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_MTT1000] PRIMARY KEY CLUSTERED
      (
      [CourseID]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END