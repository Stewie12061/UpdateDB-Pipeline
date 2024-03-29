-- <Summary>
---- 
-- <History>
---- Create on 10/03/2015 by Trần Quốc Tuấn
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[ST3017]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[ST3017]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [Module] NVARCHAR(50) NULL,
      [GroupID] NVARCHAR(50) NULL,
      [GroupName] NVARCHAR(500) NULL
	  CONSTRAINT [PK_ST3017] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END