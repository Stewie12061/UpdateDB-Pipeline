---- Create by Trà Giang on 26/11/2019
---- Phiếu yêu cầu khách hàng ( MAITHU = 107) 

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CRMT2100]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CRMT2100]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL,
  [VoucherTypeID] VARCHAR(50) NULL,
  [TranMonth] INT NULL,
  [TranYear] INT NULL,
  [VoucherDate] DATETIME NULL,
  [VoucherNo] VARCHAR(50) NULL,
  [EmployeeID] VARCHAR(50) NULL,
  [ObjectID] VARCHAR(50) NULL,
  [DeliveryAddress] NVARCHAR(250) NULL
 
  
 
CONSTRAINT [PK_CRMT2100] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

-------------------- 22/12/2020 - Tấn Lộc: Bổ sung cột Address, ContactID, ContactID, Tel, Email, BusinessLinesID, DeliveryMethod, PackingMethod, PalletRequest--------------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT2100' AND col.name = 'Address')
BEGIN
	ALTER TABLE CRMT2100 ADD Address NVARCHAR(MAX) NULL
END

IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT2100' AND col.name = 'ContactID')
BEGIN
	ALTER TABLE CRMT2100 ADD ContactID VARCHAR(250) NULL
END

IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT2100' AND col.name = 'Tel')
BEGIN
	ALTER TABLE CRMT2100 ADD Tel NVARCHAR(250) NULL
END

IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT2100' AND col.name = 'Email')
BEGIN
	ALTER TABLE CRMT2100 ADD Email NVARCHAR(MAX) NULL
END

IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT2100' AND col.name = 'BusinessLinesID')
BEGIN
	ALTER TABLE CRMT2100 ADD BusinessLinesID NVARCHAR(250) NULL
END

IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT2100' AND col.name = 'DeliveryMethod')
BEGIN
	ALTER TABLE CRMT2100 ADD DeliveryMethod NVARCHAR(250) NULL
END

IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT2100' AND col.name = 'PackingMethod')
BEGIN
	ALTER TABLE CRMT2100 ADD PackingMethod NVARCHAR(250) NULL
END

IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT2100' AND col.name = 'PalletRequest')
BEGIN
	ALTER TABLE CRMT2100 ADD PalletRequest NVARCHAR(MAX) NULL
END