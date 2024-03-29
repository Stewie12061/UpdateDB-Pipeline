-- <Summary>
---- 
-- <History>
---- Create on 13/12/2010 by Thanh Trẫm
---- Modified on ... by ...
-- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1007STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT1007STD](
	[VoucherTypeID] [nvarchar](50) NOT NULL,
	[VoucherTypeName] [nvarchar](250) NULL,
	[Disabled] [tinyint] NOT NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[IsDefault] [tinyint] NOT NULL,
	[DebitAccountID] [nvarchar](50) NULL,
	[CreditAccountID] [nvarchar](50) NULL,
	[ObjectID] [nvarchar](50) NULL,
	[WareHouseID] [nvarchar](50) NULL,
	[VDescription] [nvarchar](250) NULL,
	[TDescription] [nvarchar](250) NULL,
	[BDescription] [nvarchar](250) NULL,
	[Auto] [tinyint] NOT NULL,
	[S1] [nvarchar](50) NULL,
	[S2] [nvarchar](50) NULL,
	[S3] [nvarchar](50) NULL,
	[OutputOrder] [tinyint] NULL,
	[OutputLength] [tinyint] NULL,
	[Separated] [tinyint] NOT NULL,
	[separator] [nvarchar](5) NULL,
	[S1Type] [tinyint] NULL,
	[S2Type] [tinyint] NULL,
	[S3Type] [tinyint] NULL,
	[Enabled1] [tinyint] NULL,
	[Enabled2] [tinyint] NULL,
	[Enabled3] [tinyint] NULL,
	[Enabled] [tinyint] NOT NULL,
	[VoucherGroupID] [nvarchar](50) NULL,
	[BankAccountID] [nvarchar](50) NULL,
	[BankName] [nvarchar](250) NULL,
	[IsVAT] [tinyint] NULL,
	[VATTypeID] [nvarchar](50) NULL,
	[IsBDescription] [tinyint] NULL,
	[IsTDescription] [tinyint] NULL
) ON [PRIMARY]
END