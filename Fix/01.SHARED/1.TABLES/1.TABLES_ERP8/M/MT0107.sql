-- <Summary>
---- Phiếu pha trộn - Master
-- <History>
---- Create on 16/09/2014 by Lê Thị Hạnh
---- Modified on 15/01/2015 by Lê Thị Hạnh: Bổ sung lưu ProductQuantity, Notes02, TotalVolume
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MT0107]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[MT0107]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [VoucherID] NVARCHAR(50) NOT NULL,
      [TranMonth] INT NULL,
      [TranYear] INT NULL,
      [VoucherTypeID] NVARCHAR(50) NULL,
      [VoucherNo] NVARCHAR(50) NULL,
      [VoucherDate] DATETIME NULL,
      [MOVoucherID] NVARCHAR(50) NULL,
      [ProductID] NVARCHAR(50) NULL,
      [ProductQuantity] DECIMAL(28,8) NULL,
      [Notes02] DECIMAL(28,8) NULL,
      [TotalVolume] DECIMAL(28,8) NULL,
      [FormulaID] NVARCHAR(50) NULL,
      [BatchNo] NVARCHAR(50) NULL,
      [Description] NVARCHAR(250) NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_MT0107] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [VoucherID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
