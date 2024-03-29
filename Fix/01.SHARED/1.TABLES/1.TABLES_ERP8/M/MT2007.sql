--- Create by : Phan thanh hoàng Vũ
--- Create Date: 16/02/2015
--- Custmize Secoin = 43 
--- Quản lý Master phiếu giao việc
IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MT2007]') AND type in (N'U'))
BEGIN
		CREATE TABLE [dbo].[MT2007]
		(
			[APK] [uniqueidentifier] DEFAULT NEWID(),
			[DivisionID] [nvarchar](3) NOT NULL,
			[VoucherID] [nvarchar](50) NOT NULL,
			[TranMonth] [int] NULL,
			[TranYear] [int] NULL,
			[VoucherTypeID] [nvarchar](50) NULL,
			[VoucherDate] [datetime] NULL,
			[VoucherNo] [nvarchar](50) NULL,
			[RefNo01] [nvarchar](250) NULL,
			[RefNo02] [nvarchar](250) NULL,
			[RefNo03] [nvarchar](250) NULL,
			[RefNo04] [nvarchar](250) NULL,
			[RefNo05] [nvarchar](250) NULL,
			[ObjectID] [nvarchar](50) NULL,
			[LaborID] [nvarchar](50) NULL,--Tên thợ 
			[EmployeeID] [nvarchar](50) NULL, --Người giao việc
			[InventoryTypeID] [nvarchar](50) NULL,--Nhóm hàng
			[Description] [nvarchar](250) NULL,
			[OrderStatus] [tinyint] NOT NULL, --Trạng thái: 0 chưa hoàn tất; 1 hoàn tất
			[SOrderID] [nvarchar](50) NULL,--ID kế thừa từ Đơn hàng sản xuất
			[CreateDate] [datetime] NULL,
			[CreateUserID] [nvarchar](50) NULL,
			[LastModifyUserID] [nvarchar](50) NULL,
			[LastModifyDate] [datetime] NULL
	
		 CONSTRAINT [PK_MT2007] PRIMARY KEY NONCLUSTERED 
		(
			[DivisionID],
			[VoucherID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]

END
