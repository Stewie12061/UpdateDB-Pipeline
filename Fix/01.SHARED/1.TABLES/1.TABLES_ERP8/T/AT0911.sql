﻿--- Hoài Phong [12/10/2020] - Tăng độ dài ký tự
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT0911]') AND type in (N'U'))
CREATE TABLE [dbo].[AT0911](
	[VoucherID] [nvarchar](50) NOT NULL,
	[BatchID] [nvarchar](50) NOT NULL,
	[TransactionID] [nvarchar](50) NOT NULL,
	[TableID] [nvarchar](50) NOT NULL,
	[DivisionID] [nvarchar](50) NOT NULL,
	[TranMonth] [int] NULL,
	[TranYear] [int] NULL,
	[TransactionTypeID] [nvarchar](50) NULL,
	[CurrencyID] [nvarchar](50) NULL,
	[ObjectID] [nvarchar](50) NULL,
	[CreditObjectID] [nvarchar](50) NULL,
	[VATNo] [nvarchar](50) NULL,
	[VATObjectID] [nvarchar](50) NULL,
	[VATObjectName] [nvarchar](250) NULL,
	[VATObjectAddress] [nvarchar](250) NULL,
	[DebitAccountID] [nvarchar](50) NULL,
	[CreditAccountID] [nvarchar](50) NULL,
	[ExchangeRate] [money] NULL,
	[UnitPrice] [decimal](28, 8) NULL,
	[OriginalAmount] [decimal](28, 8) NULL,
	[ConvertedAmount] [decimal](28, 8) NULL,
	[ImTaxOriginalAmount] [money] NULL,
	[ImTaxConvertedAmount] [money] NULL,
	[ExpenseOriginalAmount] [money] NULL,
	[ExpenseConvertedAmount] [money] NULL,
	[IsStock] [tinyint] NOT NULL,
	[VoucherDate] [datetime] NULL,
	[InvoiceDate] [datetime] NULL,
	[VoucherTypeID] [nvarchar](50) NULL,
	[VATTypeID] [nvarchar](50) NULL,
	[VATGroupID] [nvarchar](50) NULL,
	[VoucherNo] [nvarchar](50) NULL,
	[Serial] [nvarchar](50) NULL,
	[InvoiceNo] [nvarchar](50) NULL,
	[Orders] [int] NULL,
	[EmployeeID] [nvarchar](50) NULL,
	[SenderReceiver] [nvarchar](150) NULL,
	[SRDivisionName] [nvarchar](250) NULL,
	[SRAddress] [nvarchar](250) NULL,
	[RefNo01] [nvarchar](50) NULL,
	[RefNo02] [nvarchar](50) NULL,
	[VDescription] [nvarchar](500) NULL,
	[BDescription] [nvarchar](500) NULL,
	[TDescription] [nvarchar](500) NULL,
	[Quantity] [decimal](28, 8) NULL,
	[InventoryID] [nvarchar](50) NULL,
	[UnitID] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NOT NULL,
	[IsAudit] [tinyint] NOT NULL,
	[IsCost] [tinyint] NOT NULL,
	[Ana01ID] [nvarchar](50) NULL,
	[Ana02ID] [nvarchar](50) NULL,
	[Ana03ID] [nvarchar](50) NULL,
	[PeriodID] [nvarchar](50) NULL,
	[ExpenseID] [nvarchar](50) NULL,
	[MaterialTypeID] [nvarchar](50) NULL,
	[ProductID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[OriginalAmountCN] [money] NULL,
	[ExchangeRateCN] [money] NULL,
	[CurrencyIDCN] [nvarchar](50) NULL,
	[DueDays] [int] NULL,
	[PaymentID] [nvarchar](50) NULL,
	[DueDate] [datetime] NULL,
	[DiscountRate] [money] NULL,
	[OrderID] [nvarchar](50) NULL,
	[CreditBankAccountID] [nvarchar](50) NULL,
	[DebitBankAccountID] [nvarchar](50) NULL,
	[CommissionPercent] [money] NULL,
	[InventoryName1] [nvarchar](250) NULL,
	[Ana04ID] [nvarchar](50) NULL,
	[Ana05ID] [nvarchar](50) NULL,
	[PaymentTermID] [nvarchar](50) NULL,
	[DiscountAmount] [money] NULL,
	[hostname] [nvarchar](128) NULL,
	[program_name] [nvarchar](128) NULL,
	[type] [int] NULL,
	[deletedate] [datetime] NULL,
	 CONSTRAINT [PK_AT0911] PRIMARY KEY NONCLUSTERED 
(	
	[VoucherID] ASC
) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

----Modified by Kiều Nga on 26/03/2021: Bổ sung khóa chính TransactionID
If Exists (Select * From sysobjects Where name = 'AT0911' and xtype ='U') 
Begin
	ALTER TABLE AT0911 DROP CONSTRAINT PK_AT0911;

	ALTER TABLE AT0911 ADD CONSTRAINT PK_AT0911 
	PRIMARY KEY NONCLUSTERED (TransactionID,DivisionID,VoucherID);
END
