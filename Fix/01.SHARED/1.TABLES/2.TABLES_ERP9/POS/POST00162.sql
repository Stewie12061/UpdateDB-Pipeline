---- Create by Phan thanh hoàng vũ on 2/12/2019 6:23:09 PM
---- Lưu dữ liệu phân biệt phiếu bán hàng/đặt cọc đã bị cắt dữ liệu thì update lại IsCutDataERP = 1

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST00162]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST00162]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [RefAPK] UNIQUEIDENTIFIER NOT NULL,
  [TranYear] int,
  [RefTableID] VARCHAR(50) NULL,
  [Amount] DECIMAL(28,8) NULL
CONSTRAINT [PK_POST00162] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [RefAPK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00162' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00162' AND col.name = 'TranYear') 
   ALTER TABLE POST00162 ADD TranYear INT NULL 
END


IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST00162' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST00162' AND col.name = 'StatusReport') 
   ALTER TABLE POST00162 ADD StatusReport INT NULL 
END
