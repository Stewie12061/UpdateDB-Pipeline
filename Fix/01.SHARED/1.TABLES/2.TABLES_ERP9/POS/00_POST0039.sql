--- Created on 20/07/2014 by Phan thanh hoàng vũ
--- Danh sách số dư tồn kho (Detail)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0039]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST0039](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[APKMaster] [uniqueidentifier] NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[ShopID] [varchar](50) NOT NULL,
	[WareHouseID] [varchar](50) NOT NULL,
	[WareHouseName] [nvarchar](250) NULL,
	[InventoryID] [varchar](50) NOT NULL,
	[InventoryName] [nvarchar](250) NULL,
	[UnitID] [varchar](50) NOT NULL,
	[UnitName] [nvarchar](250) NULL,
	[Quantity] [decimal](28, 8) NOT NULL Default 0,
	[Description] [nvarchar](250) NULL,
	[DeleteFlg] [tinyint] NOT NULL Default 0,
	[CreateUserID] [varchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastModifyUserID] [varchar](50) NOT NULL,
	[LastModifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_POST0039] PRIMARY KEY CLUSTERED 
(
	[APK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
End

--Add Columns
		----------------------------{Đơn giá}--------------------------------
		IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0039' AND xtype='U')
		BEGIN
			IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
			ON col.id=tab.id WHERE tab.name='POST0039' AND col.name='UnitPrice')
			ALTER TABLE POST0039 ADD UnitPrice decimal(28, 8) DEFAULT (0) NULL
		END
---Modified by Thị Phượng Date 08/02/2018 Bổ sung trạng thái hàng hóa
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0039' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0039' AND col.name = 'StatusInventory') 
   ALTER TABLE POST0039 ADD StatusInventory TINYINT DEFAULT (0) NULL 
END
--Modified by Thị Phượng Date: 22/03/2018: Bổ sung trường STT để lưu theo đúng thứ tự
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST0039' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST0039' AND col.name = 'OrderNo') 
   ALTER TABLE POST0039 ADD OrderNo INT NULL 
END

/*===============================================END OrderNo===============================================*/ 