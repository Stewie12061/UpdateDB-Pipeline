-- <Summary>
---- Quyết toán đơn hàng - Detail [Customize Index: 45 - ABA]
-- <History>
---- Create on 22/04/2015 by Lê Thị Hạnh 
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[OT0141]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[OT0141]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [VoucherID] NVARCHAR(50) NOT NULL,
      [TransactionID] NVARCHAR(50) NOT NULL,
      [Orders] INT NULL,
      [OPVoucherID] NVARCHAR(50) NULL,
	  [OPTableID] NVARCHAR(50) NULL --ĐHB: OT2001, ĐHM: OT3001
    CONSTRAINT [PK_OT0141] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [TransactionID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
