---- Create by tuan on 27/11/2015 1:24:55 PM
---- Chi tiết thiết lập người xét duyệt

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[OOT0011]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[OOT0011]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NULL,
      [AbsentType] VARCHAR(50) NULL,
      [RollLevel] INT NULL,
      [DutyID] VARCHAR(50) NULL,
      [APKMaster] VARCHAR(50) NULL
    CONSTRAINT [PK_OOT0011] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END