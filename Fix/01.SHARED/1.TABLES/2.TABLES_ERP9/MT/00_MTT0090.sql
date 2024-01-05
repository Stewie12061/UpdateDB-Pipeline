IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MTT0090]') AND TYPE IN (N'U'))
BEGIN
     
     CREATE TABLE [dbo].[MTT0090]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NOT NULL,
      [GroupID] VARCHAR(50) NOT NULL,
	  [IsStudentInfo] BIT DEFAULT(0) NOT NULL,
	  [IsStudentResult] BIT DEFAULT(0) NOT NULL,
	  [IsStudyInfo] BIT DEFAULT(0) NOT NULL,
	  [IsExamResult] BIT DEFAULT(0) NOT NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL,
	CONSTRAINT [PK_MTT0090] PRIMARY KEY CLUSTERED
      (
      [GroupID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END

