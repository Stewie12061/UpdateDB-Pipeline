

--- Created on 06/05/2014 by Phan thanh hoàng vũ
--- Dữ liệu Ngiệp vụ Phiếu chênh lêch (Detail)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0025]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST0025](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[ShopID] [varchar](50) NOT NULL,
	[APKMaster] [uniqueidentifier] NOT NULL,
	[APKMInherited] [uniqueidentifier] NULL,
	[APKDInherited] [uniqueidentifier] NULL,
	[EVoucherNo] [varchar](50) NULL,
	[MarkQuantity] [decimal](28, 8) NULL,
	[WareHouseID] [varchar](50) NOT NULL,
	[WareHouseName] [nvarchar](250) NULL,
	[InventoryID] [varchar](50) NOT NULL,
	[InventoryName] [nvarchar](250) NULL,
	[UnitID] [varchar](50) NOT NULL,
	[UnitName] [nvarchar](250) NULL,
	[ActualQuantity] [decimal](28, 8) NULL,
	[DeleteFlg] [tinyint] NOT NULL DEFAULT 0,
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
	[CreateUserID] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [varchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
 CONSTRAINT [PK_POST0025_1] PRIMARY KEY CLUSTERED 
(
	[APK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

End