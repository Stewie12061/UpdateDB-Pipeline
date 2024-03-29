---- Create by tuan on 27/11/2015 1:32:45 PM
---- Thiết lập thời gian OT

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[OOT0020]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[OOT0020]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NULL,
      [TranMonth] INT NOT NULL,
      [TimeLaw] DECIMAL(28,8) NULL,
      [TimeCompany] DECIMAL(28,8) NULL,
      [TranYear] INT NOT NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_OOT0020] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END

--ADD COlUMN 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'OOT0020' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'OOT0020' AND col.name = 'EmailApprove')
        ALTER TABLE OOT0020 ADD EmailApprove VARCHAR(50) NULL
    END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'OOT0020' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'OOT0020' AND col.name = 'EmailSuggest')
        ALTER TABLE OOT0020 ADD EmailSuggest VARCHAR(50) NULL
    END
    
    
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'OOT0020' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'OOT0020' AND col.name = 'MaxAllowedTime')
        ALTER TABLE OOT0020 ADD MaxAllowedTime DECIMAL(28,8) NULL
    END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'OOT0020' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'OOT0020' AND col.name = 'MaxTimeOut')
        ALTER TABLE OOT0020 ADD MaxTimeOut DECIMAL(28,8) NULL
    END