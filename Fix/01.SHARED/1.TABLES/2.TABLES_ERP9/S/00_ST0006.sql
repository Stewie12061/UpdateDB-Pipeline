IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[ST0006]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[ST0006]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NULL,
      [ModuleID] VARCHAR(50) NULL,
      [ReportID] VARCHAR(50) NULL,
      [UserGroupID] VARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [CreateUserID] VARCHAR(50) NULL
    CONSTRAINT [PK_ST0006] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END