--- Created on 20/03/2014 by Phan thanh hoàng vũ
--- Editted on 07/04/2014 by Phan thanh hoàng vũ
--- Dữ liệu Ngiệp vụ Phiếu nhập hàng (Detail)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST00161]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST00161](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[ShopID] [varchar](50) NOT NULL,
	[APKMaster] [uniqueidentifier] NOT NULL,
	[WareHouseID] [varchar](50) NOT NULL,
	[WareHouseName] [nvarchar](250) NULL,
	[InventoryID] [varchar](50) NOT NULL,
	[InventoryName] [nvarchar](250) NULL,
	[UnitID] [varchar](50) NOT NULL,
	[UnitName] [nvarchar](250) NULL,
	[ActualQuantity] [decimal](28, 8) NOT NULL,
	[UnitPrice] [decimal](28, 8) NOT NULL,
	[Amount] [decimal](28, 8) NULL,
	[DiscountAmount] [decimal](28, 8) NULL,
	[TaxAmount] [decimal](28, 8) NULL,
	[InventoryAmount] [decimal](28, 8) NULL,
	[VATGroupID] [varchar](50) NULL,
	[VATPercent] [decimal](28, 8) NULL,
	[DiscountRate] [decimal](28, 8) NULL,
	[IsPromotion] [tinyint] NULL DEFAULT 0,
	[DeleteFlg] [tinyint] NOT NULL DEFAULT 0,
	[EVoucherNo] [varchar](50) NULL,
	[APKMInherited] [uniqueidentifier] NULL,
	[APKDInherited] [uniqueidentifier] NULL,
	[MarkQuantity] [decimal](28, 8) NULL,
	[Ana01ID] [varchar](50) NULL,
	[Ana02ID] [varchar](50) NULL,
	[Ana03ID] [varchar](50) NULL,
	[Ana04ID] [varchar](50) NULL,
	[Ana05ID] [varchar](50) NULL,
	[Ana06ID] [varchar](50) NULL,
	[Ana07ID] [varchar](50) NULL,
	[Ana08ID] [varchar](50) NULL,
	[Ana09ID] [varchar](50) NULL,
	[Ana10ID] [varchar](50) NULL,
	[Imei01] [varchar](50) NULL,
	[Imei02] [varchar](50) NULL,
	[CreateUserID] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [varchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
 CONSTRAINT [PK_POST00161_1] PRIMARY KEY CLUSTERED 
(
	[APK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
End