-- <Summary>
---- 
-- <History>
---- Create on 13/12/2010 by Thanh Trẫm
---- Modified on ... by ...
-- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1004STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1004STD](
	[CurrencyID] [nvarchar](50) NOT NULL,
	[CurrencyName] [nvarchar](250) NULL,
	[ExchangeRate] [decimal](28, 8) NULL,
	[Operator] [tinyint] NULL,
	[Disabled] [tinyint] NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[ExchangeRateDecimal] [tinyint] NOT NULL,
	[DecimalName] [nvarchar](50) NULL,
	[UnitName] [nvarchar](50) NULL
) ON [PRIMARY]
END
