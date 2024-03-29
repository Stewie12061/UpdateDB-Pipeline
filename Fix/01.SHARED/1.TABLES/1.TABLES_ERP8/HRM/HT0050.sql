---- Create by Nguyễn Văn Tài on 11/13/2019 6:26:14 PM
---- Bảng lưu thông tin file đính kèm của hồ sơ nhân viên.

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HT0050]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[HT0050]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] NVARCHAR(50) NOT NULL,
  [EmployeeID] NVARCHAR(50) NOT NULL,
  [Orders] INT NULL,
  [FileName] NVARCHAR(100) NOT NULL,
  [FileSize] DECIMAL(28,8) NULL,
  [OnlineFilePath] NVARCHAR(250) NOT NULL
CONSTRAINT [PK_HT0050] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

----Modified by Văn Tài: Add column Orders
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'HT0050' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'HT0050' AND col.name = 'Orders')
        ALTER TABLE HT0050 ADD Orders INT NULL
    END