-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Thanh Nguyen
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT7410STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT7410STD](
	[ReportCode] [nvarchar](50) NOT NULL,
	[ReportName1] [nvarchar](250) NULL,
	[ReportName2] [nvarchar](250) NULL,
	[IsTax] [tinyint] NOT NULL,
	[TaxAccountID1From] [nvarchar](50) NULL,
	[TaxAccountID1To] [nvarchar](50) NULL,
	[TaxAccountID2From] [nvarchar](50) NULL,
	[TaxAccountID2To] [nvarchar](50) NULL,
	[TaxAccountID3From] [nvarchar](50) NULL,
	[TaxAccountID3To] [nvarchar](50) NULL,
	[NetAccountID1From] [nvarchar](50) NULL,
	[NetAccountID1To] [nvarchar](50) NULL,
	[NetAccountID2From] [nvarchar](50) NULL,
	[NetAccountID2To] [nvarchar](50) NULL,
	[NetAccountID3From] [nvarchar](50) NULL,
	[NetAccountID3To] [nvarchar](50) NULL,
	[NetAccountID4From] [nvarchar](50) NULL,
	[NetAccountID4To] [nvarchar](50) NULL,
	[NetAccountID5From] [nvarchar](50) NULL,
	[NetAccountID5To] [nvarchar](50) NULL,
	[VoucherTypeIDFrom] [nvarchar](50) NULL,
	[VoucherTypeIDTo] [nvarchar](50) NULL,
	[IsVATType] [tinyint] NOT NULL,
	[VATTypeID1] [nvarchar](50) NULL,
	[VATTypeID2] [nvarchar](50) NULL,
	[VATTypeID3] [nvarchar](50) NULL,
	[VATTypeID] [nvarchar](50) NULL,
	[IsVATGroup] [tinyint] NOT NULL,
	[VATGroupID1] [nvarchar](50) NULL,
	[VATGroupID2] [nvarchar](50) NULL,
	[VATGroupID3] [nvarchar](50) NULL,
	[VATGroupIDFrom] [nvarchar](50) NULL,
	[VATGroupIDTo] [nvarchar](50) NULL,
	[VATObjectTypeID] [nvarchar](50) NULL,
	[VATObjectIDFrom] [nvarchar](50) NULL,
	[VATObjectIDTo] [nvarchar](50) NULL,
	[VoucherTypeID] [nvarchar](50) NULL,
	[ReportID] [nvarchar](50) NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyDate] [datetime] NULL,
	[Disabled] [tinyint] NOT NULL,
	[IsVATIn] [tinyint] NULL,
	[ObjectIDFrom] [nvarchar](50) NULL,
	[ObjectIDTo] [nvarchar](50) NULL,
	[Order1] [nvarchar](50) NULL,
	[Order2] [nvarchar](50) NULL,
	[Order3] [nvarchar](50) NULL,
	[Order4] [nvarchar](50) NULL,
	[VATTypeID4] [nvarchar](50) NULL,
	[VATGroupID4] [nvarchar](50) NULL
) ON [PRIMARY]
END
