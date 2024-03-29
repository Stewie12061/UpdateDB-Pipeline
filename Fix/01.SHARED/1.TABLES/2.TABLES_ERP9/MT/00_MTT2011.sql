IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MTT2011]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[MTT2011]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NULL,
      [ReAPK] UNIQUEIDENTIFIER NOT NULL,
      [Performance01] VARCHAR(50) NULL,
      [Performance02] VARCHAR(50) NULL,
      [Performance03] VARCHAR(50) NULL,
      [Performance04] VARCHAR(50) NULL,
      [Performance05] VARCHAR(50) NULL,
      [Performance06] VARCHAR(50) NULL,
      [Listening] DECIMAL(28,8) DEFAULT (0) NULL,
      [Speaking] DECIMAL(28,8) DEFAULT (0) NULL,
      [Reading] DECIMAL(28,8) DEFAULT (0) NULL,
      [Writing] DECIMAL(28,8) DEFAULT (0) NULL,
      [Result01] VARCHAR(50) NULL,
      [Result02] VARCHAR(50) NULL,
      [Result03] VARCHAR(50) NULL,
      [Result04] VARCHAR(50) NULL,
      [Result05] VARCHAR(50) NULL,
      [Result06] VARCHAR(50) NULL,
      [Result07] VARCHAR(50) NULL,
      [Result08] VARCHAR(50) NULL,
      [Result09] VARCHAR(50) NULL,
      [Result10] VARCHAR(50) NULL,
      [Result11] VARCHAR(50) NULL,
      [OverallAssess] NVARCHAR(500) NULL,
      [EndPerformance01] VARCHAR(50) NULL,
      [EndPerformance02] VARCHAR(50) NULL,
      [EndPerformance03] VARCHAR(50) NULL,
      [EndPerformance04] VARCHAR(50) NULL,
      [EndPerformance05] VARCHAR(50) NULL,
      [EndPerformance06] VARCHAR(50) NULL,
      [EndListening] DECIMAL(28,8) DEFAULT (0) NULL,
      [EndSpeaking] DECIMAL(28,8) DEFAULT (0) NULL,
      [EndReading] DECIMAL(28,8) DEFAULT (0) NULL,
      [EndWriting] DECIMAL(28,8) DEFAULT (0) NULL,
      [EndResult01] VARCHAR(50) NULL,
      [EndResult02] VARCHAR(50) NULL,
      [EndResult03] VARCHAR(50) NULL,
      [EndResult04] VARCHAR(50) NULL,
      [EndResult05] VARCHAR(50) NULL,
      [EndResult06] VARCHAR(50) NULL,
      [EndResult07] VARCHAR(50) NULL,
      [EndResult08] VARCHAR(50) NULL,
      [EndResult09] VARCHAR(50) NULL,
      [EndResult10] VARCHAR(50) NULL,
      [EndResult11] VARCHAR(50) NULL,
      [EndOverallAssess] NVARCHAR(500) NULL,
      [IsPass] TINYINT DEFAULT (0) NOT NULL
    CONSTRAINT [PK_MTT2011] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END