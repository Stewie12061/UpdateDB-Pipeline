IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0027]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE POST0027 (
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[TranMonth] [int] NOT NULL,
	[TranYear] [int] NOT NULL,
	[ShopID] [varchar](50) NOT NULL,
	[WarehouseID] [varchar](50) NOT NULL,
	[WarehouseName] [nvarchar](250) NOT NULL,
	[ObjectID] [varchar](50) NULL,
	[ObjectName] [nvarchar](250) NULL,
	[VoucherNo] [varchar](50) NOT NULL,
	[VoucherID] [varchar](50) NULL,--Theo dõi số chứng từ tham chiếu
	[TableID] [varchar](50) NULL,--Quan lý bàn thuốc khu vực-PHUCLONG
	[AreaID] [varchar](50) NULL,--Quản lý khu vực bán hàng-PHUCLONG
	[DBTableID] [varchar](50) NULL,--Theo dõi Phiếu xuất sinh ra từ POS hay ERP
	[VoucherDate] [datetime] NOT NULL,
	[VoucherTypeID] [varchar](50) NOT NULL,
	[EmployeeID] [varchar](50) NOT NULL,
	[EmployeeName] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[DeleteFlg] [tinyint] NOT NULL DEFAULT 0,
	[CreateUserID] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [varchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	 CONSTRAINT [PK_POST0027] PRIMARY KEY CLUSTERED 
(
	[APK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END 