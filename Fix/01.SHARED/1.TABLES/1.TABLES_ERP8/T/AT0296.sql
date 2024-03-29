-- <Summary>
---- Lưu tờ khai thuế bảo vệ môi trường - AF0291
-- <History>
---- Create on 02/04/2015 by Lê Thị Hạnh
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT0296]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT0296]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [VoucherID] NVARCHAR(50) NOT NULL,
      [TaxReturnFileID] NVARCHAR(250) NULL,
	  [TaxReturnID] NVARCHAR(250) NULL,
	  [TranMonth] INT NULL,
	  [TranYear] INT NULL,
      [IsPeriodTax] TINYINT NULL, -- 1: tờ khai tháng, 0: tờ khai phát sinh
      [TranMonthTax] INT NULL,
      [TranYearTax] INT NULL,
      [TaxReturnDate] DATETIME NULL, -- ngày phát sinh
      [TaxReturnName] NVARCHAR(250) NULL,
      [ReturnTime] INT NULL,
      [IsAppendix] TINYINT NULL,
      [TaxAgentPeron] NVARCHAR(250) NULL,
      [TaxAgentCertificate] NVARCHAR(250) NULL,
      [TaxReturnPerson] NVARCHAR(250) NULL,
      [TaxAssignDate] DATETIME NULL,
      [ReportVoucherID] NVARCHAR(50) NULL,
      [ETaxVoucherID] NVARCHAR(50) NULL,
      [AmendedReturnDate] DATETIME NULL,
      [MainReturnTax] XML NULL, --TK
      [AppendixReturnTax] XML NULL, -- PL
      [AmendedReturnTax] XML NULL,--KHBS
      [PrintDate] DATETIME NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_AT0296] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [VoucherID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
