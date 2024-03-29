---- Create by Phan thanh hoàng vũ on 3/7/2018 3:16:44 PM
---- Khuyến mãi tặng hàng theo hóa đơn (Detail 01)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CT0150]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CT0150]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [PromoteID] VARCHAR(50) NOT NULL,
  [VoucherID] UNIQUEIDENTIFIER NOT NULL,
  [FromValues] DECIMAL(28,8) NULL,
  [ToValues] DECIMAL(28,8) NULL,
  [Notes] NVARCHAR(250) NULL
CONSTRAINT [PK_CT0150] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [PromoteID],
  [VoucherID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CT0150' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CT0150' AND col.name = 'OrderNo') 
   ALTER TABLE CT0150 ADD OrderNo INT NULL 
END

/*===============================================END OrderNo===============================================*/ 