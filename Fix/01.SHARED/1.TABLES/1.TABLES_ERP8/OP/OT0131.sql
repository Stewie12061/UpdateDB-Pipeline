-- <Summary>
---- Cam kết chiết khấu - Detail [Sài Gòn Petro - Customize Index: 36)
-- <History>
---- Create on 30/09/2014 by Lê Thị Hạnh 
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[OT0131]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[OT0131]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [ID] NVARCHAR(50) NOT NULL,
      [TransactionID] NVARCHAR(50) NOT NULL,
      [ObjectID] NVARCHAR(50) NULL,
      [IID] NVARCHAR(50) NULL,
      [Quantity] DECIMAL(28,8) NULL,
      [DiscountPrice] DECIMAL(28,8) NULL,
      [EmpAmount] DECIMAL(28,8) NULL,
      [MarketAmount] DECIMAL(28,8) NULL,
      [OtherAmount] DECIMAL(28,8) NULL
    CONSTRAINT [PK_OT0131] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [TransactionID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
