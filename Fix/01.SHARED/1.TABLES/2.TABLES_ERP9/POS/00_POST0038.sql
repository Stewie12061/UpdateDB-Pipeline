--- Created on 20/07/2014 by Phan thanh hoàng vũ
--- Danh sách số dư tồn kho (Master)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0038]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST0038](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[ShopID] [varchar](50) NOT NULL,
	[TranMonth] [int] NOT NULL,
	[TranYear] [int] NOT NULL,
	[VoucherTypeID] [varchar](50) NOT NULL,
	[VoucherNo] [varchar](50) NOT NULL,
	[VoucherDate] [datetime] NOT NULL,
	[EmployeeID] [varchar](50) NOT NULL,
	[EmployeeName] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[DeleteFlg] [tinyint] NOT NULL Default 0,
	[CreateUserID] [varchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastModifyUserID] [varchar](50) NOT NULL,
	[LastModifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_POST0038] PRIMARY KEY CLUSTERED 
(
	[APK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
End

