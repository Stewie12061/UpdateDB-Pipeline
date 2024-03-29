--- Created on 10/07/2014 by Phan thanh hoàng vũ
--- Danh mục liên kết khu vực-Thời điểm-Bảng giá
--- Modify by: Lê Thị Hạnh on 23/07/2014
--- Bổ sung APKMaster - APK của cửa hàng
--- Modify by: Lê Thị Hạnh on 29/07/2014
--- Bỏ trường APKMaster - APK của cửa hàng
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'POST0037') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE POST0037 (
		[APK] [uniqueidentifier] default NEWID() NOT NULL,
		[DivisionID] [varchar](50) NOT NULL,
		[ShopID] [varchar](50) NOT NULL,
		[AreaID] [varchar](50) NOT NULL,
		[TimeID] [varchar](50) NOT NULL,
		[PriceTableID] [varchar](50) NOT NULL,
		[Description] [NVARCHAR](250) NULL,
		[Disabled] [TINYINT] DEFAULT 0 NOT NULL,
		[CreateUserID] [varchar](50) NOT NULL,
		[CreateDate] [datetime] NOT NULL,
		[LastModifyUserID] [varchar](50) NOT NULL,
		[LastModifyDate] [datetime] NOT NULL,
	 CONSTRAINT  PK_POST0037  PRIMARY KEY CLUSTERED 
	(
		[APK] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
