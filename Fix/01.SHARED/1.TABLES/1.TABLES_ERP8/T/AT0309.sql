-- <Summary>
---- Lưu tờ khai thuế TTĐB - AF0309
-- <History>
---- Create on 29/05/2015 by Lê Thị Hạnh
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT0309]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT0309]
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
      [ReturnTime] INT NULL,
      [IsAppendix] TINYINT NULL,
      [IsAppendix1] TINYINT NULL,
      [IsAppendix2] TINYINT NULL,
      [TaxAgentPeron] NVARCHAR(250) NULL,
      [TaxAgentCertificate] NVARCHAR(250) NULL,
      [TaxReturnPerson] NVARCHAR(250) NULL,
      [TaxAssignDate] DATETIME NULL,
      [AmendedReturnDate] DATETIME NULL,
      [MainReturnTax] XML NULL, --TK
      [AppendixReturnTax1] XML NULL, -- PL1
      [AppendixReturnTax21] XML NULL, -- PL2-1
	  [AppendixReturnTax22] XML NULL, -- PL2-2
      [AmendedReturnTax] XML NULL,--KHBS
      [PrintDate] DATETIME NULL,
      [IsSETIncur] TINYINT NULL, --0: không phát sinh, 1: phát sinh
      [OriginalAmount] DECIMAL(28,8) NULL, --Số thuế TTĐB
	  [ConvertedAmount] DECIMAL(28,8) NULL,
	  [DeductSETOriAmount] DECIMAL(28,8) NULL, --Số thuế TTĐB được khấu trừ
	  [DeductSETConAmount] DECIMAL(28,8) NULL,
	  [DeclareSETOriAmount] DECIMAL(28,8) NULL,--Số thuế TTĐB phải nộp
	  [DeclareSETConAmount] DECIMAL(28,8) NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_AT0309] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [VoucherID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
