

--- Created on 20/03/2014 by Phan thanh hoàng vũ
--- Dữ liệu Ngiệp vụ Phiếu nhập hàng (Master)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0015]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST0015](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[ShopID] [varchar](50) NOT NULL,
	[TableID] [varchar](50) NOT NULL,
	[ObjectID] [varchar](50) NULL,
	[ObjectName] [nvarchar](250) NULL,
	[VoucherTypeID] [varchar](50) NOT NULL,
	[TranMonth] [int] NOT NULL,
	[TranYear] [int] NOT NULL,
	[VoucherDate] [datetime] NOT NULL,
	[VoucherNo] [varchar](50) NOT NULL,
	[VoucherID] [varchar](50) NOT NULL,--Dùng để dỏi số chứng từ tham chiếu sinh ra từ phiếu nào
	[EmployeeID] [varchar](50) NOT NULL,
	[EmployeeName] [nvarchar](250) NULL,
	[DelivererName] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[DeleteFlg] [tinyint] NOT NULL Default 0,
	[CreateUserID] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [varchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
 CONSTRAINT [PK_POST0015_1] PRIMARY KEY CLUSTERED 
(
	[APK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
End