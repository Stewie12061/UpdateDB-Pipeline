IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[DRT0130]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[DRT0130]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT

 NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NULL,
      [GroupID] VARCHAR(50) NOT NULL,
      [EditContractInfo] TINYINT DEFAULT (0) NULL,
      [LeaderSendDispath] TINYINT DEFAULT (0) NULL,
      [ManagerSendDispath] TINYINT DEFAULT (0) NULL,
      [InfoSendDispath] TINYINT DEFAULT (0) NULL,
      [LeaderCloseContract] TINYINT DEFAULT (0) NULL,
      [ManagerCloseContract] TINYINT DEFAULT (0) NULL,
      [InfoCloseContract] TINYINT DEFAULT (0) NULL,
      [ViewCloseContract] TINYINT DEFAULT (0) NULL
    CONSTRAINT [PK_DRT0130] PRIMARY KEY CLUSTERED
      (
      [GroupID]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END

-- Thêm cột phần quyền từ tab 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'DRT0130' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'DRT0130' AND col.name = 'EditTabWorkHistory')
        ALTER TABLE DRT0130 ADD EditTabWorkHistory TINYINT NULL
    END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'DRT0130' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'DRT0130' AND col.name = 'EditTabOtherInfo')
        ALTER TABLE DRT0130 ADD EditTabOtherInfo TINYINT NULL
    END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'DRT0130' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'DRT0130' AND col.name = 'EditTabDebtorAddress')
        ALTER TABLE DRT0130 ADD EditTabDebtorAddress TINYINT NULL
    END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'DRT0130' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'DRT0130' AND col.name = 'EditTabContactInfo')
        ALTER TABLE DRT0130 ADD EditTabContactInfo TINYINT NULL
    END
 IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'DRT0130' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'DRT0130' AND col.name = 'EditTabAddInfo')
        ALTER TABLE DRT0130 ADD EditTabAddInfo TINYINT NULL
    END
 IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'DRT0130' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'DRT0130' AND col.name = 'EditTabRate')
        ALTER TABLE DRT0130 ADD EditTabRate TINYINT NULL
    END