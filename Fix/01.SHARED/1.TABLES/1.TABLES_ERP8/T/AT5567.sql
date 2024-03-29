-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Thanh Nguyen
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT5567]') AND type in (N'U'))
CREATE TABLE [dbo].[AT5567](
	[APK] [uniqueidentifier] DEFAULT NEWID(),
	[TransactionTypeID] [nvarchar](50) NOT NULL,
	[TransactionID] [nvarchar](50) NOT NULL,
	[ObjectID] [nvarchar](50) NOT NULL,
	[TranDate] [datetime] NULL,
	[CurrencyID] [nvarchar](50) NOT NULL,
	[ExchangeRate] [decimal](28, 8) NOT NULL,
	[Amount] [decimal](28, 8) NULL,
	[BankAccountNo] [nvarchar](50)  NULL,
	[EndAmount] [decimal](28, 8) NULL,
	[ReVoucherID] [nvarchar](50) NOT NULL,
	[TranNotes] [nvarchar](500) NULL,
	[DivisionID] [nvarchar](50) NOT NULL,
	[TranMonth] [int] NOT NULL,
	[TranYear] [int] NOT NULL,
	[AgentStatus] [nvarchar](50)  NULL,
	CONSTRAINT [PK_AT5567] PRIMARY KEY NONCLUSTERED 
	(
		[APK] ASC
    )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
