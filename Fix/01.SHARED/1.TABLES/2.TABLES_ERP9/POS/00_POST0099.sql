--- Created on 17/01/2014 by Phan thanh hoàng vũ
--- Dữ liệu master data (dữ liệu load chết trong combo)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0099]') AND TYPE IN (N'U'))
BEGIN

CREATE TABLE [dbo].[POST0099](
      [CodeMaster] [varchar](50) NOT NULL,
      [ID] [Int] NOT NULL,
      [Description] [nvarchar](250) NULL,
      [DescriptionE] [nvarchar](250) NULL,
      [Disabled] [tinyint] default(0) Not null
 CONSTRAINT [PK_ POST0099] PRIMARY KEY CLUSTERED 
(
      [CodeMaster] ASC,
      [ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END

---------------- 28/07/2021 - Tấn Lộc: Bổ sung cột CodeMasterName ----------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'POST0099' AND col.name = 'CodeMasterName')
BEGIN
	ALTER TABLE POST0099 ADD CodeMasterName NVARCHAR(MAX) NULL
END
