-- <Summary>
---- Phân bổ chi phí mua hàng - Detail [LAVO]
-- <History>
---- Create on 04/03/2015 by Lê Thị Hạnh 
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT0321]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT0321]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [VoucherID] NVARCHAR(50) NOT NULL,
      [TransactionID] NVARCHAR(50) NOT NULL,
      [Check] TINYINT NULL,
      [POCVoucherID] NVARCHAR(50) NULL,
      [POVoucherID] NVARCHAR(50) NULL,
      [POTransactionID] NVARCHAR(50) NULL,
      [ExpenseOriginalAmount] DECIMAL(28,8) NULL,
      [ExpenseConvertedAmount] DECIMAL(28,8) NULL,
    CONSTRAINT [PK_AT0321] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [TransactionID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'AT0321' AND xtype = 'U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id = tab.id WHERE tab.name = 'AT0321' AND col.name = 'POCTransactionID')
		ALTER TABLE AT0321 ADD POCTransactionID NVARCHAR(50) NULL
	END	