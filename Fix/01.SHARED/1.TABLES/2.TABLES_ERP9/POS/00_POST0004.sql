--- Created on 16/01/2014 by Phan thanh hoàng vũ
--- Thiết lập mã phiếu chứng từ
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0004]') AND TYPE IN (N'U'))
BEGIN

CREATE TABLE [dbo].[POST0004](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[VoucherType01] [varchar](50) NOT NULL,
	[VoucherType02] [varchar](50) NOT NULL,
	[VoucherType03] [varchar](50) NOT NULL,
	[VoucherType04] [varchar](50) NOT NULL,
	[VoucherType05] [varchar](50) NOT NULL,
	[VoucherType06] [varchar](50) NOT NULL,
	[VoucherType07] [varchar](50) NOT NULL,
	[VoucherType08] [varchar](50) NOT NULL,
	[VoucherType09] [varchar](50) NOT NULL,
	[VoucherType10] [varchar](50) NOT NULL,
	[VoucherType11] [varchar](50) NOT NULL,
	[VoucherType12] [varchar](50) NOT NULL,
	[CreateUserID] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [varchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
 CONSTRAINT [PK_POST0004] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END
 