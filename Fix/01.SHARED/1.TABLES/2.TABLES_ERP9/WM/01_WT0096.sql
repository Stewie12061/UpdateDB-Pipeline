--------------------Thêm column Status--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='WT0096' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT0096' AND col.name='Status')
	ALTER TABLE WT0096 ADD Status tinyint NULL
END

--------------------Thêm column ReceiptQuantity--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='WT0096' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT0096' AND col.name='ReceiptQuantity')
	ALTER TABLE WT0096 ADD ReceiptQuantity Decimal(28,6)  NULL
END

--------------------Thêm column WarrantyID--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='WT0096' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT0096' AND col.name='WarrantyID')
	ALTER TABLE WT0096 ADD WarrantyID NVARCHAR(50) NULL
END

--------------------Thêm column IsInheritWarranty--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='WT0096' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT0096' AND col.name='IsInheritWarranty')
	ALTER TABLE WT0096 ADD IsInheritWarranty TINYINT NULL
END

-- [Minh Dũng] Create on: 22/11/2023
--------------------Thêm quy cách ------------------------------------------------
-- [Đức Tuyên] Update on: 05/12/2023 Loại bỏ quy cách chỉ lưu vào bảng quy cách WT8899
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='WT0096' AND xtype='U')
BEGIN
	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S01ID') 
	ALTER TABLE WT0096 DROP COLUMN S01ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S02ID') 
	ALTER TABLE WT0096 DROP COLUMN S02ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S03ID') 
	ALTER TABLE WT0096 DROP COLUMN S03ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S04ID') 
	ALTER TABLE WT0096 DROP COLUMN S04ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S05ID') 
	ALTER TABLE WT0096 DROP COLUMN S05ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S06ID') 
	ALTER TABLE WT0096 DROP COLUMN S06ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S07ID') 
	ALTER TABLE WT0096 DROP COLUMN S07ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S08ID') 
	ALTER TABLE WT0096 DROP COLUMN S08ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S09ID') 
	ALTER TABLE WT0096 DROP COLUMN S09ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S10ID') 
	ALTER TABLE WT0096 DROP COLUMN S10ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S11ID') 
	ALTER TABLE WT0096 DROP COLUMN S11ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S12ID') 
	ALTER TABLE WT0096 DROP COLUMN S12ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S13ID') 
	ALTER TABLE WT0096 DROP COLUMN S13ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S14ID') 
	ALTER TABLE WT0096 DROP COLUMN S14ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S15ID') 
	ALTER TABLE WT0096 DROP COLUMN S15ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S16ID') 
	ALTER TABLE WT0096 DROP COLUMN S16ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S17ID') 
	ALTER TABLE WT0096 DROP COLUMN S17ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S18ID') 
	ALTER TABLE WT0096 DROP COLUMN S18ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S19ID') 
	ALTER TABLE WT0096 DROP COLUMN S19ID

	IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'S20ID') 
	ALTER TABLE WT0096 DROP COLUMN S20ID
END

-- [Minh Dũng] -- Thêm các param phục vụ cho công thức chuyển đổi đơn vị

IF EXISTS (SELECT * FROM sysobjects WHERE NAME='WT0096' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT0096' AND col.name='Parameter01')
	ALTER TABLE WT0096 ADD Parameter01 Decimal(28,6)  NULL
END

IF EXISTS (SELECT * FROM sysobjects WHERE NAME='WT0096' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT0096' AND col.name='Parameter02')
	ALTER TABLE WT0096 ADD Parameter02 Decimal(28,6)  NULL
END

IF EXISTS (SELECT * FROM sysobjects WHERE NAME='WT0096' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT0096' AND col.name='Parameter03')
	ALTER TABLE WT0096 ADD Parameter03 Decimal(28,6)  NULL
END

IF EXISTS (SELECT * FROM sysobjects WHERE NAME='WT0096' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT0096' AND col.name='Parameter04')
	ALTER TABLE WT0096 ADD Parameter04 Decimal(28,6)  NULL
END

IF EXISTS (SELECT * FROM sysobjects WHERE NAME='WT0096' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT0096' AND col.name='Parameter05')
	ALTER TABLE WT0096 ADD Parameter05 Decimal(28,6)  NULL
END

--------------------Thêm column DriverID--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='WT0096' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT0096' AND col.name='DriverID')
	ALTER TABLE WT0096 ADD DriverID VARCHAR(50) NULL
END

--------------------Thêm column CarID--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='WT0096' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='WT0096' AND col.name='CarID')
	ALTER TABLE WT0096 ADD CarID VARCHAR(50) NULL
END

--------------------Thêm column IsProInventoryID--------------------------------
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'WT0096' AND xtype = 'U')
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
    ON col.id = tab.id WHERE tab.name = 'WT0096' AND col.name = 'IsProInventoryID')
    ALTER TABLE WT0096 ADD [IsProInventoryID] TINYINT DEFAULT (0)
END 