---------------------------Sửa kiểu dữ liệu nVarchar -> Decimal-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST00191' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST00191' AND col.name='Note01')
	Alter Table POST00191
		Alter column Note01 Decimal(28,6) NULL
END

---------------------------Sửa kiểu dữ liệu nVarchar -> Decimal-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST00191' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST00191' AND col.name='Note02')
	Alter Table POST00191
		Alter column Note02 Decimal(28,6) NULL
END

---------------------------Sửa kiểu dữ liệu nVarchar -> Decimal-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST00191' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST00191' AND col.name='Note03')
	Alter Table POST00191
		Alter column Note03 Decimal(28,6) NULL
END

---------------------------Sửa kiểu dữ liệu nVarchar -> Decimal-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST00191' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST00191' AND col.name='Note04')
	Alter Table POST00191
		Alter column Note04 Decimal(28,6) NULL
END

---------------------------Sửa kiểu dữ liệu nVarchar -> Decimal-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST00191' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST00191' AND col.name='Note05')
	Alter Table POST00191
		Alter column Note05 Decimal(28,6) NULL
END

---------------------------Sửa trường hàng đi đường từ MovingQuantity -> FromMovingQuantity-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST00191' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST00191' AND col.name='MovingQuantity')
	EXEC sp_rename 'dbo.POST00191.MovingQuantity', 'FromMovingQuantity', 'COLUMN';
END

---------------------------Thêm hàng đi đường đến ToMovingQuantity-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST00191' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST00191' AND col.name='ToMovingQuantity')
	ALTER TABLE POST00191 ADD ToMovingQuantity Decimal(28,6) DEFAULT (0) NULL
END