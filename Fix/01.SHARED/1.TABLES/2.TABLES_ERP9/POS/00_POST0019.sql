--- Created on 17/04/2014 by Phan thanh hoàng vũ
--- Dữ liệu Ngiệp vụ nhật ký hàng hóa (Master)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0019]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST0019](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[ShopID] [varchar](50) NOT NULL,
	[VoucherTypeID] [varchar](50) NOT NULL,
	[TranMonth] [int] NOT NULL,
	[TranYear] [int] NOT NULL,
	[TableID] [varchar](50) NOT NULL,
	[VoucherDate] [datetime] NOT NULL,
	[VoucherNo] [varchar](50) NOT NULL,
	[ObjectID] [varchar](50) NULL,
	[ObjectName] [nvarchar](250) NULL,
	[EmployeeID] [varchar](50) NULL,
	[EmployeeName] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[Status] [tinyint] NOT NULL  DEFAULT 1 ,
	[DeleteFlg] [tinyint] NOT NULL DEFAULT 0,
	[CreateUserID] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [varchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
 CONSTRAINT [PK_POST0019] PRIMARY KEY CLUSTERED 
(
	[APK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
End