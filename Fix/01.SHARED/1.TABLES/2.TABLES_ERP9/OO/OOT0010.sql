---- Create by tuan on 27/11/2015 1:21:02 PM
---- Thiết lập người xét duyệt

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[OOT0010]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[OOT0010]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NOT NULL,
      [TranMonth] INT NOT NULL,
      [TranYear] INT NOT NULL,
      [VoucherTypeID] VARCHAR(50) NOT NULL,
      [AbsentType] VARCHAR(50) NULL,
      [Level] INT NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_OOT0010] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END

-- Add column
IF EXISTS ( SELECT TOP 1 1 FROM sysobjects WHERE NAME='OOT0010' AND xtype='U')
BEGIN
	 IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col 
					INNER JOIN sysobjects obj ON obj.id = col.id
	                WHERE col.name='AbsentTypeID'
	                AND obj.name='OOT0010')
	                BEGIN
	                	ALTER TABLE OOT0010 ADD  AbsentTypeID VARCHAR(50) NULL 
	                END
	              
END
