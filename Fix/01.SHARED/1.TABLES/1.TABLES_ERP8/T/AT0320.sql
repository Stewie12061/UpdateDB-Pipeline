-- <Summary>
---- Phân bổ chi phí mua hàng - Master [LAVO]
-- <History>
---- Create on 04/03/2015 by Lê Thị Hạnh 
---- Modified on 14/08/2020 by Huỳnh Thử: Merge Code: MEKIO và MTE
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT0320]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT0320]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [VoucherID] NVARCHAR(50) NOT NULL,
      [TranMonth] INT NULL,
      [TranYear] INT NULL,
      [VoucherTypeID] NVARCHAR(50) NULL,
      [VoucherNo] NVARCHAR(50) NULL,
      [VoucherDate] DATETIME NULL,
      [EmployeeID] NVARCHAR(50) NULL,
      [ApportMethod] INT NULL,
      [Description] NVARCHAR(250) NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_AT0320] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [VoucherID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END