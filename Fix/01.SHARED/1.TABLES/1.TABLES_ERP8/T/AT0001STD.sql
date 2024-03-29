-- <Summary>
---- 
-- <History>
---- Create on 10/12/2010 by Thanh Trẫm
---- Modified on ... by 
-- <Example>
IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT0001STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT0001STD](
	[CompanyName] [nvarchar](250) NULL,
	[ShortName] [nvarchar](250) NULL,
	[Tel] [nvarchar](100) NULL,
	[Fax] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](250) NULL,
	[CountryID] [nvarchar](50) NULL,
	[CityID] [nvarchar](50) NULL,
	[ChiefAccountant] [nvarchar](250) NULL,
	[Director] [nvarchar](250) NULL,
	[Chairmain] [nvarchar](250) NULL,
	[BaseCurrencyID] [nvarchar](50) NULL,
	[PeriodNum] [int] NULL,
	[DBID] [nvarchar](50) NULL,
	[QuantityDecimals] [tinyint] NOT NULL,
	[UnitCostDecimals] [tinyint] NOT NULL,
	[ConvertedDecimals] [tinyint] NOT NULL,
	[DBVersion] [nvarchar](50) NULL,
	[CurrencyID] [nvarchar](50) NULL,
	[Serial] [nvarchar](250) NULL,
	[InvoiceNo] [nvarchar](250) NULL
) ON [PRIMARY]
END

