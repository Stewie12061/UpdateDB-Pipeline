--Create by: MaiVu
--Create Date: 08/05/2014
-------------------------Rename Columns Decription---------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0022' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0022' AND col.name='Decription')
	EXEC sp_rename 'dbo.POST0022.Decription', 'Description', 'COLUMN';
END
-------------------------Delete column RecipientName--------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0022' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0022' AND col.name='RecipientName')
	ALTER TABLE POST0022 DROP COLUMN RecipientName
END
-------------------------Thêm cột IsRefund------------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0022' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0022' AND col.name='IsRefund')
	ALTER TABLE POST0022 ADD IsRefund tinyint NULL
END
--------------------------Thêm cột WarehouseID -----------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0022' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0022' AND col.name='WarehouseID')
	ALTER TABLE POST0022 ADD WarehouseID varchar(50) NULL
END

--------------------------Thêm cột WarehouseName -----------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0022' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0022' AND col.name='WarehouseName')
	ALTER TABLE POST0022 ADD WarehouseName nvarchar(250) NULL
END
--------------------------Thêm cột RecipientShopID-----------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0022' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0022' AND col.name='RecipientShopID')
	ALTER TABLE POST0022 ADD RecipientShopID varchar(50) NULL
END

--------------------------Thêm cột RecipientShopName----------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0022' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0022' AND col.name='RecipientShopName')
	ALTER TABLE POST0022 ADD RecipientShopName nvarchar(250) NULL
END

---------------------------Thêm cột RecipientWarehouseID-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0022' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0022' AND col.name='RecipientWarehouseID')
	ALTER TABLE POST0022 ADD RecipientWarehouseID varchar(50) NULL
END

---------------------------Thêm cột RecipientWarehouseName-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0022' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0022' AND col.name='RecipientWarehouseName')
	ALTER TABLE POST0022 ADD RecipientWarehouseName nvarchar(250) NULL
END

