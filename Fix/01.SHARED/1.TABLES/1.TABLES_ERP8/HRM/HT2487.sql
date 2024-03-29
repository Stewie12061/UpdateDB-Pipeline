-- <Summary>
---- 
-- <History>
---- Create on 20/03/2012 by Huỳnh Tấn Phú
---- Modified on ... by ...
---- <Example>
IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT2487]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT2487](
	[APK] [uniqueidentifier] NULL DEFAULT NEWID(),
	[VoucherID] [nvarchar](50) NOT NULL,
	[DivisionID] [nvarchar](3) NOT NULL,
	[VoucherNo] [nvarchar](50) NULL,
	[VoucherDate] [datetime] NULL,
	[HICount] [int] NULL,
	[OutOfTownCount] [int] NULL,
	[UsingFromDate] [datetime] NULL,
	[UsingToDate] [datetime] NULL,
	[Descriptions] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL
	CONSTRAINT [PK_HT2487] PRIMARY KEY CLUSTERED 
(
	[VoucherID] ASC,
	[DivisionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END