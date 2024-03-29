---- Create by Cao Thị Phượng on 12/8/2017 2:03:47 PM
---- Thông tin mặt hàng gói sản phẩm (Detail)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CT0148]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CT0148]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [PackagePriceID] VARCHAR(50) NOT NULL,
  [PackageID] VARCHAR(50) NOT NULL,
  [InventoryID] VARCHAR(50) NOT NULL,
  [InventoryName] NVARCHAR(250) NOT NULL,
  [UnitID] VARCHAR(50) NOT NULL,
  [UnitPrice] DECIMAL(28,8) NOT NULL,
  [OrderNo] INT NOT NULL
CONSTRAINT [PK_CT0148] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [PackagePriceID],
  [PackageID],
  [InventoryID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

---Thị Phượng Date 02/01/2018 Bổ sung chỉnh sửa thêm cột phân biệt hàng tặng 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CT0148' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CT0148' AND col.name = 'IsGift') 
   ALTER TABLE CT0148 ADD IsGift TINYINT DEFAULT (0) NULL 
END
/*===============================================END IsGift===============================================*/ 

---Hoàng Vũ Date 06/03/2018 Bổ sung chỉnh sửa % chiết khấu
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CT0148' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CT0148' AND col.name = 'DiscountRate') 
   ALTER TABLE CT0148 ADD DiscountRate DECIMAL(28,8) NULL 
END
/*===============================================END DiscountRate===============================================*/ 

---Hoàng Vũ Date 06/03/2018 Bổ sung chỉnh sửa tiền chiết khấu
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CT0148' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CT0148' AND col.name = 'DiscountAmount') 
   ALTER TABLE CT0148 ADD DiscountAmount DECIMAL(28,8) NULL 
END
/*===============================================END DiscountAmount===============================================*/ 

-- Danh - 2018/04/13 Thêm trường xử lý bảng giá trước/sau thuế
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CT0148' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CT0148' AND col.name = 'VATPercent') 
   ALTER TABLE CT0148 ADD VATPercent decimal(28, 8) NULL
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CT0148' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CT0148' AND col.name = 'VATAmount') 
   ALTER TABLE CT0148 ADD VATAmount decimal(28, 8) NULL
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CT0148' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CT0148' AND col.name = 'TotalAmount') 
   ALTER TABLE CT0148 ADD TotalAmount decimal(28, 8) NULL
END