--- Created on 28/02/2014 by Phan thanh hoàng vũ
--- Edited on 07/04/2014 by Phan thanh hoàng vũ
--- Dữ liệu Ngiệp vụ bán hàng (Master)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0016]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST0016](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[ShopID] [varchar](50) NOT NULL,
	[VoucherTypeID] [varchar](50) NOT NULL,
	[TranMonth] [int] NOT NULL,
	[TranYear] [int] NOT NULL,
	[VoucherNo] [varchar](50) NOT NULL,
	[VoucherDate] [datetime] NOT NULL,
	[ObjectID] [varchar](50) NULL,
	[ObjectName] [nvarchar](250) NULL,
	[PaymentObjectID] [varchar](50) NULL,
	[PaymentObjectName] [nvarchar](250) NULL,
	[EmployeeID] [varchar](50) NULL,
	[EmployeeName] [nvarchar](250) NULL,
	[MemberID] [varchar](50) NOT NULL,
	[MemberName] [nvarchar](250) NULL,
	[PaymentID] [varchar](50) NOT NULL,
	[PaymentName] [nvarchar](250) NULL,
	[CurrencyID] [varchar](50) NOT NULL,
	[CurrencyName] [nvarchar](250) NULL,
	[ExchangeRate] [decimal](28, 8) NOT NULL DEFAULT 1,
	[TotalAmount] [decimal](28, 8) NULL,
	[TotalTaxAmount] [decimal](28, 8) NULL,
	[TotalDiscountAmount] [decimal](28, 8) NULL,
	[TotalInventoryAmount] [decimal](28, 8) NULL,
	[AccruedScore] [int] NULL,
	[PayScore] [int] NULL,
	[LastAccruedScore] [int] NULL,
	[AmountOfPoint] [decimal](28, 8) NULL,
	[VoucherID] [varchar](50) NULL,
	[DeleteFlg] [tinyint] NOT NULL DEFAULT 0,
	[CreateUserID] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [varchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_POST0016_1] PRIMARY KEY CLUSTERED 
(
	[APK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
End