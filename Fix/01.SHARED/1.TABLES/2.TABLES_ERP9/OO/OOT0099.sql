---- Create by Nguyen Hoang Bao Thy on 26/11/2015 3:26:26 PM
---- Đổ Nguồn Combobox

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[OOT0099]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[OOT0099]
     (
      [CodeMaster] VARCHAR(50) NOT NULL,
      [ID] VARCHAR(50) NOT NULL, 
      [ID1] TINYINT DEFAULT (0) NULL,
      [OrderNo] INT NULL,
      [Description] NVARCHAR(250) NULL,
      [DescriptionE] NVARCHAR(250) NULL,
      [Disabled] TINYINT DEFAULT (0) NULL
    CONSTRAINT [PK_OOT0099] PRIMARY KEY CLUSTERED
      (
      [CodeMaster],
      [ID]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END

---------------- 28/07/2021 - Hoài Bảo: Bổ sung cột CodeMasterName ----------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'OOT0099' AND col.name = 'CodeMasterName')
BEGIN
	ALTER TABLE OOT0099 ADD CodeMasterName NVARCHAR(MAX) NULL
END