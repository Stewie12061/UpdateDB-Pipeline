-- <Summary>
---- 
-- <History>
---- Create on 20/12/2013 by Thanh Sơn
---- Modified on 17/12/2013 by Le Thi Thu Hien 
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HT0327]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[HT0327]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NOT NULL,
      [ID] VARCHAR(50) NOT NULL,
      [Description] NVARCHAR(250) NULL,
      [Notes] NVARCHAR(500) NULL,
      [BeginDate] DATETIME NOT NULL,
      [EndDate] DATETIME NOT NULL,
      [Time] DECIMAL(28,8) DEFAULT (0) NULL,
      [IsWarning] TINYINT DEFAULT (0) NOT NULL,
      [Message] NVARCHAR(1000) NULL,
      [TitleID] VARCHAR(50) NOT NULL,
      [FromSalaryLevel] VARCHAR(50) NULL,
      [ToSalaryLevel] VARCHAR(50) NULL,
      [Years] DECIMAL(28,8) DEFAULT (0) NOT NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_HT0327] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
---- Add Columns
If Exists (Select * From sysobjects Where name = 'HT0327' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'HT0327'  and col.name = 'FromSalaryLevel')
           Alter Table  HT0327 Add FromSalaryLevel VARCHAR(50) Null Default('')
End 
If Exists (Select * From sysobjects Where name = 'HT0327' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'HT0327'  and col.name = 'ToSalaryLevel')
           Alter Table  HT0327 Add ToSalaryLevel VARCHAR(50) Null Default('')
End 
---- Alter Columns
IF EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HT0327]') AND TYPE IN (N'U'))
BEGIN
	ALTER TABLE HT0327
	DROP  CONSTRAINT PK_HT0327
	ALTER TABLE HT0327
	ALTER COLUMN APK  UNIQUEIDENTIFIER NOT NULL
	ALTER TABLE HT0327
	ADD CONSTRAINT PK_HT0327 PRIMARY KEY (APK)
END