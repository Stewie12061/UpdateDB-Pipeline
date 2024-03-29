-- <Summary>
---- Lưu tờ khai thuế tài nguyên - AF0311-12-13
-- <History>
---- Create on 02/06/2015 by Lê Thị Hạnh
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT0310]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT0310]
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
      [FromMonthTax] INT NULL, -- thời gian năm tài chính
      [FromYearTax] INT NULL,
      [ToMonthTax] INT NULL,    
      [ToYearTax] INT NULL,        
      [TaxReturnDate] DATETIME NULL, -- ngày phát sinh
      [ReturnTime] INT NULL,
      [IsAppendix] TINYINT NULL,
      [TaxAgentPeron] NVARCHAR(250) NULL,
      [TaxAgentCertificate] NVARCHAR(250) NULL,
      [TaxReturnPerson] NVARCHAR(250) NULL,
      [TaxAssignDate] DATETIME NULL,
      [AmendedReturnDate] DATETIME NULL,
      [MainReturnTax1] XML NULL, --TK thuế 01/TAIN
      [MainReturnTax2] XML NULL, --TK quyết toán thuế 02/TAIN
      [AmendedReturnTax] XML NULL,--KHBS
      [PrintDate] DATETIME NULL,
      [NRTTypeID] TINYINT NULL, --1: Tờ quyết toán năm, 2: phát sinh
      [OriginalAmount] DECIMAL(28,8) NULL, --Số thuế TTĐB
	  [ConvertedAmount] DECIMAL(28,8) NULL,
	  [DeductNRTOriAmount] DECIMAL(28,8) NULL, --Số thuế TN được khấu trừ
	  [DeductNRTConAmount] DECIMAL(28,8) NULL,
	  [DeclareNRTOriAmount] DECIMAL(28,8) NULL,--Số thuế TN phải nộp
	  [DeclareNRTConAmount] DECIMAL(28,8) NULL,
	  [NRTOriDeclare] DECIMAL(28,8) NULL, --Thuế tài nguyên đã kê khai trong kỳ
	  [NRTConDeclare] DECIMAL(28,8) NULL,
	  [NRTOriValidate] DECIMAL(28,8) NULL, --Chênh lệch giữa số quyết toán với kê khai
	  [NRTConValidate] DECIMAL(28,8) NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_AT0310] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [VoucherID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
